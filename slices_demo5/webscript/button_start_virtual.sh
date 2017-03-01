#!/bin/bash

# FuZhou University, SDNLab
# Added by Chen, 2017/3/1

# This file is used to being called by the web server.
# Start vitualization.

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $THIS_DIR/env.sh

sudo ./simple_switch_CLI --thrift-port 22222 < cmd/tagcmds/egswitch.txt
sudo ./simple_switch_CLI --thrift-port 22223 < cmd/tagcmds/switch2.txt
sudo ./simple_switch_CLI --thrift-port 22224 < cmd/tagcmds/switch3.txt
sudo ./simple_switch_CLI --thrift-port 22225 < cmd/tagcmds/egswitch.txt
