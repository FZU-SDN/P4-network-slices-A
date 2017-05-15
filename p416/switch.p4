// FuZhou University, SDNLAB
// Added by Chen, 2017.5.15

/* Copyright 2017 FuZhou University SDNLab, Edu. 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */

/* -*- P4_16 -*- */
#include <core.p4>
#include <v1model.p4>

const bit<16> TYPE_IPV4 = 0x800;

/*************************************************************************
*********************** H E A D E R S  ***********************************
*************************************************************************/

typedef bit<9>  egressSpec_t;
typedef bit<48> macAddr_t;
typedef bit<32> ip4Addr_t;
typedef bit<8>  value_t;

header ethernet_t {
    macAddr_t dstAddr;
    macAddr_t srcAddr;
    bit<16>   etherType;
}

header ipv4_t {
    bit<4>    version;
    bit<4>    ihl;
    bit<8>    diffserv;
    bit<16>   totalLen;
    bit<16>   identification;
    bit<3>    flags;
    bit<13>   fragOffset;
    bit<8>    ttl;
    bit<8>    protocol;
    bit<16>   hdrChecksum;
    ip4Addr_t srcAddr;
    ip4Addr_t dstAddr;
}

struct tag_meta_t {
    bit<8>    tag;
}

struct metadata {
    tag_meta_t   tag_meta;
}

struct headers {
    ethernet_t   ethernet;
    ipv4_t       ipv4;
}

/*************************************************************************
*********************** P A R S E R  ***********************************
*************************************************************************/

parser ParserImpl(packet_in packet,
                  out headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {

    state start {
        transition parse_ethernet;
    }

    state parse_ethernet {
        packet.extract(hdr.ethernet);
        transition select(hdr.ethernet.etherType) {
            TYPE_IPV4: parse_ipv4;
            default: accept;
        }
    }

    state parse_ipv4 {
        packet.extract(hdr.ipv4);
	    transition accept;
    }

}


/*************************************************************************
************   C H E C K S U M    V E R I F I C A T I O N   *************
*************************************************************************/

control verifyChecksum(in headers hdr, inout metadata meta) {   
    apply {  }
}


/*************************************************************************
**************  I N G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control ingress(inout headers hdr, inout metadata meta,
                inout standard_metadata_t standard_metadata) {
    
    action drop() {
        mark_to_drop(); // HINT
    }
    
    // ipv4 forward, not used in our demo
    action ipv4_forward(macAddr_t dstAddr, egressSpec_t port) {
        standard_metadata.egress_spec = port;
	    hdr.ethernet.srcAddr = hdr.ethernet.dstAddr; // HINT
	    hdr.ethernet.dstAddr = dstAddr;
        hdr.ipv4.ttl = hdr.ipv4.ttl - 1;
    }
    
    action forward(egressSpec_t port) {
        standard_metadata.egress_spec = port;
    }

    action broadcast() {
        standard_metadata.mgast_grp = 1; // build in v1model.p4
    }

    action add_tag(value_t value) {
        meta.tag_meta.tag = value; // HINT
    }

    // ipv4 lpm, not used in our demo
    table ipv4_lpm {
        key = {
            hdr.ipv4.dstAddr: lpm;
        }
        actions = {
	        ipv4_forward;
            drop;
            NoAction;
        }
        size = 1024;
        default_action = NoAction();
    }
    
    // table smac and the mac_learn engine is moved from this demo.

    table dmac {
        key = {
            hdr.ethernet.dstAddr: exact;
        }
        actions = {
            forward; 
            broadcast;
            NoAction;
        }
        size = 1024;
        default_action = NoAction;
    }

    table mcast_src_pruning {
        key = {
            standard_metadata.instance_type: exact;
        }
        actions = {
            drop;
            NoAction;
        }
        size = 1024;
        default_action = NoAction;
    }

    table tagin {
        key = {
            hdr.ethernet.dstAddr: exact;
            hdr.ethernet.srcAddr: exact;
        }
        actions = {
            add_tag;
            NoAction;
        }
        default_action = NoAction;
    }

    apply {
        dmac.apply();
        tagin.apply();
    }
}

/*************************************************************************
****************  E G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control egress(inout headers hdr, inout metadata meta, 
               inout standard_metadata_t standard_metadata) {
    
    action drop() {
        mark_to_drop();
    }

    // TODO: ADD TAG_ACTION

    table tagout {
        key = {
            meta.tag_meta.tag : exact;
        }
        actions = {
            // tag_action;
            NoAction;
            drop;
        }
        default_action = NoAction;
    }

    apply {  
        tagout.apply();
    }
}

/*************************************************************************
*************   C H E C K S U M    C O M P U T A T I O N   **************
*************************************************************************/

control computeChecksum(
    inout headers  hdr,
    inout metadata meta)
{
    Checksum16() ipv4_checksum;
    
    apply {
        if (hdr.ipv4.isValid()) {
            hdr.ipv4.hdrChecksum = ipv4_checksum.get(
                {    
                    hdr.ipv4.version,
                    hdr.ipv4.ihl,
                    hdr.ipv4.diffserv,
                    hdr.ipv4.totalLen,
                    hdr.ipv4.identification,
                    hdr.ipv4.flags,
                    hdr.ipv4.fragOffset,
                    hdr.ipv4.ttl,
                    hdr.ipv4.protocol,
                    hdr.ipv4.srcAddr,
                    hdr.ipv4.dstAddr
                });
        }
    }
}


/*************************************************************************
***********************  D E P A R S E R  *******************************
*************************************************************************/

control DeparserImpl(packet_out packet, in headers hdr) {
    apply {
        packet.emit(hdr.ethernet);
        packet.emit(hdr.ipv4);
    }
}

/*************************************************************************
***********************  S W I T C H  *******************************
*************************************************************************/

V1Switch(
ParserImpl(),
verifyChecksum(),
ingress(),
egress(),
computeChecksum(),
DeparserImpl()
) main;