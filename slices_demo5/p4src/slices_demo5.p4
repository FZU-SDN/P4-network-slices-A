/**********************************

    <Demo 5>
    
    Added by Chen, 2017/2/8
    
    Changed by Chen, 2017/2/19

    Based on l2switch
    
 **********************************/

//uncomment to enable openflow
//#define OPENFLOW_ENABLE

/* If you add the openflow for this demo, you should read the file named    */
/* openflow.p4 in the repo p4ofagent. Based on your needs, you can choose   */
/* to add some function that the openflow.p4 supported. For example, VLAN.  */

#ifdef OPENFLOW_ENABLE
    #include "openflow.p4"
#endif /* OPENFLOW_ENABLE */

/**********************************

	Please see commands.txt.

 **********************************/

/**********************************

                +===+
    +-+         | 2 |         +-+
    |1|---+ +---|   |---+ +---|4|
    +-+   | |   +===+   | |   +-+
         +===+         +===+
    +-+  | 1 |         | 4 |  +-+
    |2|--|   |         |   |--|5|
    +-+  +===+         +===+  +-+
          | |           | |
    +-+   | |   +===+   | |   +-+
    |3|---+ +---| 3 |---+ +---|6|
    +-+         |   |         +-+
                +===+

    IP: 10.0.0.i
    MAC: 00:00:00:00:00:0i

    i: 1, 2, 3, 4, 5, 6
    
 **********************************/

/**********************************

    Headers & Parsers Definitions
    
 **********************************/

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

/**********************************

    Tables & Actions Definitions
    
 **********************************/

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

/* Special Tables and Actions Definations for Network Slices                */
/* TODO: You can change some definitions of them if you are ready to trying */
/* p4 programming.                                                          */
/* For Instance, you can change the match key of the table tagin and tagout */

header_type flag_t {
    fields {
        tag : 8;
    }
}

header flag_t flag;

/* The action add_flag is used to adding a header named "flag". Then change */
/* the value of the field "tag" using the arg "value". As soon as the       */
/* action is finished, the field "tag" can be used to be the match key of   */
/* the flow table that your defined. You can see what I have done in the    */
/* definition of table named "tagout" and the commands showed in the end of */
/* this file.                                                               */

action add_tag(value) {
    add_header(flag);
    modify_field(flag.tag, value);
}

table tagin {
    reads {
        ethernet.dstAddr : exact;
        ethernet.srcAddr : exact;
    }
    actions {
        add_tag;
        _nop;
    }
}

/* Counter Definitions                                                       */
/* This Counter "tag_counter" is used to counting the tenants' packets.      */
/* One thing should be noticed that, one counter instance records one        */
/* tenant's packets. For example, the counter instance 0 records the packets */
/* from tenant A, however, it cannot records the packets from tenant B.      */

counter tag_counter {
    type : packets;
    static : tagout;
    instance_count : 16384; //you can change the num of instance here
}

/* According to the match key of table tagout, the action "tagout" count     */
/* the packets of special tenant, then remove the header "flag".             */

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

/**********************************

    Control Program Definitions
    
 **********************************/

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
    // you must call the function here if you are using openflow:
    process_ofpat_ingress();
#endif /* OPENFLOW_ENABLE */
}

control egress {
    // the "if" block avoided the mess of learn_client 
    if(standard_metadata.ingress_port == standard_metadata.egress_port) {
        apply(mcast_src_pruning);
    }
    apply(tagout);
#ifdef OPENFLOW_ENABLE
    // you must call the function here if you are using openflow:
    process_ofpat_egress();
#endif /*OPENFLOW_ENABLE */
}


/* If you are interesting in the writing of runtime commands, please        */
/* refer to the commands below, or you can find all commands that the CLI   */
/* support by doing this:                                                   */

/* First login to the simple_switch_CLI by using the thrift port of switch. */
/* Then you ask the runtime commands by using the command: ?                */
/* Like this:                                                               */
/* Runtimecmd: ?                                                            */

/**********************************

    Reference - cmds:

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

 **********************************/
