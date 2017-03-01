#!/bin/bash

# FuZhou University, SDNLab
# Added by Chen, 2017/3/1

# This file is used to being called by the web server.
# Stop vitualization.

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $THIS_DIR/env.sh

sudo ./simple_switch_CLI --thrift-port 22222 < cmd/cntreset_cmds.txt
sudo ./simple_switch_CLI --thrift-port 22223 < cmd/cntreset_cmds.txt
sudo ./simple_switch_CLI --thrift-port 22224 < cmd/cntreset_cmds.txt
sudo ./simple_switch_CLI --thrift-port 22225 < cmd/cntreset_cmds.txt

sudo ./simple_switch_CLI --thrift-port 22222 < cmd/drop_A.txt
sudo ./simple_switch_CLI --thrift-port 22223 < cmd/drop_A.txt
sudo ./simple_switch_CLI --thrift-port 22225 < cmd/drop_A.txt

