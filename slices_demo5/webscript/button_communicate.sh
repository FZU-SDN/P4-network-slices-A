#!/bin/bash

# FuZhou University, SDNLab
# Added by Chen, 2017/3/1

# This file is used to being called by the web server.
# Make the six switches can communicate each other succesfully.

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $THIS_DIR/env.sh

sudo ./simple_switch_CLI --thrift-port 22222 < cmd/cmu_cmds.txt
sudo ./simple_switch_CLI --thrift-port 22223 < cmd/cmu_cmds.txt
sudo ./simple_switch_CLI --thrift-port 22224 < cmd/cmu_cmds.txt
sudo ./simple_switch_CLI --thrift-port 22225 < cmd/cmu_cmds.txt

sudo ./simple_switch_CLI --thrift-port 22222 < cmd/forward/s1.txt
sudo ./simple_switch_CLI --thrift-port 22223 < cmd/forward/s2.txt
sudo ./simple_switch_CLI --thrift-port 22224 < cmd/forward/s3.txt
sudo ./simple_switch_CLI --thrift-port 22225 < cmd/forward/s4.txt
