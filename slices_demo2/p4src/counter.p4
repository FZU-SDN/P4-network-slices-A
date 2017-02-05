/*

P4 Environment: Network Virtual Slices Using P4.

Demo 3.

FuZhou University, China.

SDN Lab, Chen, 1.17.2017.

 */

/*
	The commands.txt:

	table_set_default Match_Table _noop 
	table_set_default Ipv4_lpm _drop
	table_set_default Forward _drop
	table_set_default Apply_Drop _noop
	

	table_add Ipv4_lpm Set_DstMetadata 10.0.0.3/32 => 10.0.0.3
	table_add Forward forward 10.0.0.3 => 3
	table_add Match_Table count_action 10.0.0.3 => 0
 */

/* Header */

header_type Ethernet_t 
{
 	fields {
 		Src_MAC : 48;
 		Dst_MAC : 48;
 		Ether_Type : 16;
 	}
}

header_type Ipv4_t 
{
 	fields {
 		Version : 4;
 		Ip_Header_len : 4;
 		Differ_Serve : 8;
 		Len_tot : 16;
 		Identification : 16;
 		Flag : 4;
 		Frag_Offset : 12;
 		TTL : 8;
 		Protocol : 8;
 		Header_CheckSum : 16;
 		Src_Address : 32;
 		Dst_Address : 32;
 	}
}

/* Header */

/* Parser */

parser start 
{
	return Parser_Ethernet;
}

header Ethernet_t ethernet;

parser Parser_Ethernet
{
 	extract (ethernet);

 	return Parser_Ipv4;
}

header Ipv4_t ipv4;

parser Parser_Ipv4 
{
	extract (ipv4);

	return ingress;
}

/* Parser */

/* counter */

action _drop() {
	drop();
}

action _noop() {

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
        ipv4.Dst_Address : exact;
    }
    actions {
        _noop;
        count_action;
    }
}

table Apply_Drop {
    reads {
        ipv4.Dst_Address : exact;
    }
    actions {
        _noop;
        _drop;
    }
}

/* counter */

/* IPv4 LPM */

header_type DstAddress_Metadata_t
{
	fields {
		Dst_Address : 32;
	}
}

metadata DstAddress_Metadata_t Dst_Metadata;

action Set_DstMetadata(Dst_addr)
{
	modify_field(Dst_Metadata.Dst_Address, Dst_addr);
	add_to_field(ipv4.TTL, -1);
}

table Ipv4_lpm 
{
	reads {
		ipv4.Dst_Address : lpm;
	}

	actions {
		Set_DstMetadata;
		_drop;
	}
}

/* IPv4 LPM */

/* Forward */

action forward(port) 
{
    modify_field(standard_metadata.egress_spec, port);
}

table Forward
{
	reads {
		Dst_Metadata.Dst_Address : exact;
	}

	actions {
		forward;
		_drop;
	}
}

/* Forward */

/* Logic = ingress + egress(empty) */

control ingress 
{
	apply(Match_Table);
	
	apply(Apply_Drop);
	
	apply(Ipv4_lpm);
	
	apply(Forward);
}

control egress 
{
	//left empty
}
