// Demo 5
// Added by Chen, 2017/2/8
// Changed by Chen, 2017/2/19

// Based on l2switch

//uncomment to enable openflow
//#define OPENFLOW_ENABLE

#ifdef OPENFLOW_ENABLE
    #include "openflow.p4"
#endif /* OPENFLOW_ENABLE */

/******************************
    
    commands:
	Please see commands.txt.

 ******************************/

/******************************

    Hint:
    IP: 10.0.0.i
    MAC: 00:00:00:00:00:0i

    i: 1, 2, 3, 4, 5, 6
    
 ******************************/

header_type ethernet_t {
    fields {
        dstAddr : 48;
        srcAddr : 48;
        etherType : 16;
    }
}

header_type intrinsic_metadata_t {
    fields {
        mcast_grp : 4;
        egress_rid : 4;
        mcast_hash : 16;
        lf_field_list: 32;
    }
}

parser start {
    return parse_ethernet;
}

header ethernet_t ethernet;
metadata intrinsic_metadata_t intrinsic_metadata;

parser parse_ethernet {
    extract(ethernet);
#ifdef OPENFLOW_ENABLE
    return select(latest.etherType) {
        ETHERTYPE_BF_FABRIC : parse_fabric_header;
        default : ingress;
    }
#else
    return ingress;
#endif /* OPENFLOW_ENABLE */
}

action _drop() {
    drop();
}

action _nop() {
}

#define MAC_LEARN_RECEIVER 1024

field_list mac_learn_digest {
    ethernet.srcAddr;
    standard_metadata.ingress_port;
}

action mac_learn() {
    generate_digest(MAC_LEARN_RECEIVER, mac_learn_digest);
}

table smac {
    reads {
        ethernet.srcAddr : exact;
    }
    actions {mac_learn; _nop;}
    size : 512;
}

action forward(port) {
    modify_field(standard_metadata.egress_spec, port);
}

action broadcast() {
    modify_field(intrinsic_metadata.mcast_grp, 1);
}

table dmac {
    reads {
        ethernet.dstAddr : exact;
    }
    actions {
        forward;
        broadcast;
#ifdef OPENFLOW_ENABLE
        openflow_apply;
        openflow_miss;
#endif /* OPENFLOW_ENABLE */
    }
    size : 512;
}

table mcast_src_pruning {
    reads {
        standard_metadata.instance_type : exact;
    }
    actions {_nop; _drop;}
    size : 1;
}

/******************************
    
    cmds:

    table_set_default tagin _nop
    table_set_default tagout _nop

    table_add tagin add_flag 00:00:00:00:00:01 00:00:00:00:00:04 => 00000001
    table_add tagin add_flag 00:00:00:00:00:04 00:00:00:00:00:01 => 00000001
    table_add tagin add_flag 00:00:00:00:00:02 00:00:00:00:00:05 => 00000010
    table_add tagin add_flag 00:00:00:00:00:05 00:00:00:00:00:02 => 00000010
    table_add tagin add_flag 00:00:00:00:00:03 00:00:00:00:00:06 => 00000011
    table_add tagin add_flag 00:00:00:00:00:06 00:00:00:00:00:03 => 00000011

    table_add tagout tag_action [dstTag] [srcAddr] => [countnum]
    table_add tagout _drop [dstTag] [srcAddr] =>

    s1(22222), s4(22225):

    table_add tagout tag_action 00000001 => 0
    table_add tagout tag_action 00000010 => 1
    table_add tagout tag_action 00000011 => 2

    s2(22223):

    table_add tagout tag_action 00000001 => 0
    table_add tagout tag_action 00000011 => 2
    table_add tagout _drop 00000010 =>    

    s3(22224):

    table_add tagout tag_action 00000010 => 1
    table_add tagout tag_action 00000011 => 2
    table_add tagout _drop 00000001 =>   
    
    cnt:

    counter_read tag_counter 0
    counter_read tag_counter 1
    counter_read tag_counter 2    

 ******************************/

/******************************/

header_type flag_t {
    fields {
        tag : 8;
    }
}

header flag_t flag;

action add_flag(value) {
    add_header(flag);
    modify_field(flag.tag, value);
}

table tagin {
    reads {
        ethernet.dstAddr : exact;
        ethernet.srcAddr : exact;
    }
    actions {
        add_flag;
        _nop;
    }
}

counter tag_counter {
    type : packets;
    static : tagout;
    instance_count : 16384;
}

action tag_action(index) {
    count(tag_counter, index);
    remove_header(flag);
}

table tagout {
    reads {
        flag.tag : exact;
    }
    actions {
        tag_action;
        _nop;
        _drop;
    }
}

/******************************/

control ingress {
#ifdef OPENFLOW_ENABLE
    apply(packet_out) {
        nop {
#endif /* OPENFLOW_ENABLE */
            apply(tagin);
            apply(smac);
            apply(dmac);
#ifdef OPENFLOW_ENABLE
        }
    }

    process_ofpat_ingress();
#endif /* OPENFLOW_ENABLE */
}

control egress {
    if(standard_metadata.ingress_port == standard_metadata.egress_port) {
        apply(mcast_src_pruning);
    }
    apply(tagout);
#ifdef OPENFLOW_ENABLE
    process_ofpat_egress();
#endif /*OPENFLOW_ENABLE */
}


