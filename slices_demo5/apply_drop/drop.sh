# FuZhou University, SDNLab
# Created by Chen, 2017/2/19

# The drop.sh is used to drop packets of Tenant A

sudo ./simple_switch_CLI --thrift-port 22222 < drop_A.txt
sudo ./simple_switch_CLI --thrift-port 22223 < drop_A.txt
sudo ./simple_switch_CLI --thrift-port 22225 < drop_A.txt
