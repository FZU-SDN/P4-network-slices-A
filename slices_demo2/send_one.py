#!/usr/bin/env python
from scapy.all import *

p = Ether(src="aa:bb:cc:dd:ee:ff") / IP(dst="10.0.0.3") / TCP() / "aaaaaaaaaaaaaaaa"
sendp(p, iface = "veth0", verbose = 0)
