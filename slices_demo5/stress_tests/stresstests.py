#!/usr/bin/env python3

# FuZhou University, SDNLab
# 2017/3/6

# UDP Test

# ICMP: 64 KB = 65536 bytes = 524288 bits
# count 1w => apply drop == 10000*524288 bits => 5,242,880,000 bits

# Time = 1min = 60s
# 5,242,880,000 bits/60 sec => 87,381,334 bits/sec == 10.5 Mb/sec => 1w packets/min 

# Iperf:
# -u => udp mode
# -b => bandwidth bits/sec 

# Commands of Iperf:
# Client: iperf -c 10.0.0.i(i <= server) -p 5001 -f 10.5m -t 180 -i 1
# Server: iperf -s

import time
import os

def main():
	time.sleep(60)
	os.system("sh drop.sh")
	print("Execeeded!\nDrop the packets that from tenant A and B!")

if __name__ == '__main__':
	main()
