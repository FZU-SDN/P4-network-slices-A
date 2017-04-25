# FuZhou University, SDN Lab.
# changed by Chen, 2017/2/7

# Commands:
#
# sudo ./runtime_CLI.py --pre SimplePreLAG --thrift-port [thrift_port] < commands.txt
#
# or
#
# sudo ./simple_switch_CLI --thrift-port [thrift_port] < commands.txt

sudo ./simple_switch_CLI --thrift-port 22222 < commands.txt
sudo ./simple_switch_CLI --thrift-port 22223 < commands.txt
sudo ./simple_switch_CLI --thrift-port 22224 < commands.txt
sudo ./simple_switch_CLI --thrift-port 22225 < commands.txt

# oldcmds:
# sudo ./simple_switch_CLI --thrift-port 22222 < commands_s1.txt
# sudo ./simple_switch_CLI --thrift-port 22223 < commands_s2.txt
# sudo ./simple_switch_CLI --thrift-port 22224 < commands_s3.txt

