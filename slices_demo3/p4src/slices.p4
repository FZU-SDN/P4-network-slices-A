// Demo 3
// Added by chen, 2017-1-20
// Based on simple_router

#include "includes/headers.p4"
#include "includes/parser.p4"

action _drop() {
    drop();
}

header_type routing_metadata_t {
    fields {
        nhop_ipv4 : 32;
    }
}

metadata routing_metadata_t routing_metadata;

action set_nhop(nhop_ipv4, port) {
    modify_field(routing_metadata.nhop_ipv4, nhop_ipv4);
    modify_field(standard_metadata.egress_spec, port);
    add_to_field(ipv4.ttl, -1);
}

table ipv4_lpm {
    reads {
        ipv4.dstAddr : lpm;
    }
    actions {
        set_nhop;
        _drop;
    }
    size: 1024;
}

action set_dmac(dmac) {
    modify_field(ethernet.dstAddr, dmac);
}

table forward {
    reads {
        routing_metadata.nhop_ipv4 : exact;
    }
    actions {
        set_dmac;
        _drop;
    }
    size: 512;
}

action rewrite_mac(smac) {
    modify_field(ethernet.srcAddr, smac);
}

table send_frame {
    reads {
        standard_metadata.egress_port: exact;
    }
    actions {
        rewrite_mac;
        _drop;
    }
    size: 256;
}

/*  Added by Chen, 2017/1/16 */

action _noop() {
    //left empty
}

counter Indecounter {
    type : packets;
    static : Match_Table;
    instance_count : 16384;
}

action count_action(index) {
    count(Indecounter, index);
}

table Match_Table {
    reads {
        ipv4.srcAddr : exact;
    }
    actions {
        _noop;
        count_action;
    }
}

table Apply_Drop {
    reads {
        ethernet.etherType : exact;
        ipv4.srcAddr : lpm;
    }
    actions {
        _noop;
        _drop;
    }
}

/*  Added by Chen, 2017/1/16 */

control ingress {
    apply(Match_Table);
    apply(ipv4_lpm);
    apply(forward);
}

control egress {
    apply(send_frame);
    apply(Apply_Drop);
}
