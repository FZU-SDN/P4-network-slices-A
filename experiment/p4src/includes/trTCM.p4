/*********************************
 FuZhou University, SDNLab
 Added by Chen, 2017.3.26
 *********************************/

/* A Two Rate Three Color Marker */

/* 
	Hint: This meter tags the incoming packet with
	the color RED, Yellow and Green based on the 
	sending rate. We can define a filter to drop the 
	packet which is tagged as RED and Yellow easily.
	Feel free to define the sending rate by passing
	your argument to the send_and_recieve.py and move 
	the commands.txt we gave.
	color_RED    : 2
	color_Yellow : 1
	color_Green  : 0
 */


/*
                          +------------+
                          |   Result   |
                          |            V
                      +-------+    +--------+
                      |       |    |        |
    Packet Stream ===>| Meter |===>| Marker |===> Marked Packet Stream
                      |       |    |        |
                      +-------+    +--------+
 */

header_type packet_color_metedata_t {
	fields {
		color : 4; // the packet color
	}
}
metadata packet_color_metedata_t pkt_color_metadata;

// indirect meter
meter trTCM_meter {
	type : packets;
	static : pkt_color_tag;
	instance_count : 16384; // 2^14
}

action color_tag(index) {
	execute_meter(trTCM_meter, index, pkt_color_metadata.color);
	// modify_field(standard_metadata.egress_spec, 1);
}

// tag the packet with color
table pkt_color_tag {
	reads { // free to do here, you can choose L2-7 feature here.
		ipv4.dstAddr : exact;
	}
	actions {_nop; color_tag;}
}

counter pkt_color_counter {
	type : packets;
	static : pkt_color_filter;
	instance_count : 5; // 0 => green pkt; 1 => yellow pkt; 2 => red pkt
}

// count the red pkt and then drop it
action pkt_filter() {
	count(pkt_color_counter, 2);
	drop();
}

// count the green and yellow pkt
action pkt_cnt(cnt_idx) {
	count(pkt_color_counter, cnt_idx);
}

// packet filter based on the color
table pkt_color_filter {
	reads {
		pkt_color_metadata.color : exact;
	}
	actions {_nop; pkt_cnt; pkt_filter;}
}

// control program 
control trTCM_process {
	apply(pkt_color_tag);
	apply(pkt_color_filter);
}
