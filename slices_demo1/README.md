# Demo1 README

## 前言：
本文基于Github开源P4Demo：Source_Routing的原理进行实验。

在进行接下来的步骤之前，请阅读Github项目介绍：[Github: SourceRouting](https://github.com/p4lang/tutorials/tree/master/SIGCOMM_2015#exercise-1-source-routing)

## 原理：

1.实验中使用的 EasyRoute Protocol 数据报结构如下：

```
preamble (8 bytes) | num_valid (4 bytes) | port_1 (1 byte) | port_2 (1 byte) |
... | port_n (1 byte) | payload
```

2.实验拓扑：

![](/Users/wasdns/Library/Containers/com.tencent.qq/Data/Library/Application Support/QQ/Users/952693358/QQ/Temp.db/BBB7676B-8194-4491-A6A9-EB8059E3E027.png)

3.介绍：

本实验首先基于Barefoot提供的原始P4程序，进行了相关的改动。

原始P4程序如下：

```
/*
Copyright 2013-present Barefoot Networks, Inc. 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

header_type easyroute_head_t {
    fields {
        preamble: 64;
        num_valid: 32;
    }
}

header easyroute_head_t easyroute_head;

header_type easyroute_port_t {
    fields {
        port: 8;
    }
}

header easyroute_port_t easyroute_port;

parser start {
    return select(current(0, 64)) {
        0: parse_head;
        default: ingress;
    }
}

parser parse_head {
    extract(easyroute_head);
    return select(latest.num_valid) {
        0: ingress;
        default: parse_port;
    }
}

parser parse_port {
    extract(easyroute_port);
    return ingress;
}

action _drop() {
    drop();
}

action route() {
    modify_field(standard_metadata.egress_spec, easyroute_port.port);
    add_to_field(easyroute_head.num_valid, -1);
    remove_header(easyroute_port);
}

table route_pkt {
    reads {
        easyroute_port: valid;
    }
    actions {
        _drop;
        route;
    }
    size: 1;
}

control ingress {
    apply(route_pkt);
}

control egress {
    // leave empty
}
```

**改动：**

1.增加一个寄存器`Register_Count`，并设置为direct状态。

2.增加一张名为Count_Table的流表，流表内含动作`_drop`与`Read_Register`。该流表根据端口进行匹配，通过command.txt(或者Runtime_CLI)增加一条表项：倘若字段easyroute_port与3相匹配，执行动作`Read_Register`；同时设置默认动作`_drop`，当没有匹配到表项时执行丢包。

3.动作`Read_Register`：将寄存器中的信息记录到元数据中。

4.流控制程序；先查找表`Count_Table`，之后通过if语句判断元数据中记录的寄存器信息是否等于0：是的话执行路由，不是的话不执行路由。

改动后的P4程序：

```
/*
Copyright 2013-present Barefoot Networks, Inc. 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/


/*
    Demo 1, FuZhou University, SDNLAB, Chen, 2017/1/11
*/


#define Match_Drop_Num 00000000

header_type easyroute_head_t 
{
    fields 
    {
        preamble : 64;
        
        num_valid : 32;
    }
}

header easyroute_head_t easyroute_head;

header_type easyroute_port_t 
{
    fields 
    {
        port : 8;
    }
}

header easyroute_port_t easyroute_port;

parser start 
{
    return select(current(0, 64)) 
    {
        0 : parse_head;
        
        default : ingress;
    }
}

parser parse_head 
{
    extract(easyroute_head);
    
    return select(latest.num_valid) 
    {
        0 : ingress;
        default : parse_port;
    }
}

parser parse_port 
{
    extract(easyroute_port);
    
    return ingress;
}

action _drop() 
{
    drop();
}


header_type Register_Meta_t
{
    fields 
    {
        register_tmp : 8;
    }
}

metadata Register_Meta_t Register_Meta;

register Register_Count
{
    width : 32;
    direct : Count_Table;
}

action Read_Register(register_index)
{
    register_read(Register_Meta.register_tmp, Register_Count, register_index);
}


/*
    command.txt:

    table_add Count_Table Read_Register 00000101 => 1
*/


table Count_Table 
{
    reads {
        easyroute_port.port : exact;
    }

    actions {
        
        Read_Register;

        _drop;
    }
}

action route() 
{
    modify_field(standard_metadata.egress_spec, easyroute_port.port);
    
    add_to_field(easyroute_head.num_valid, -1);
    
    remove_header(easyroute_port);
}

table route_pkt {
    
    reads {
        easyroute_port: valid;
    }
    
    actions {
        
        _drop;

        route;
    }
    
    size: 1;
}

control ingress 
{
    apply(Count_Table);

    if (Register_Meta.register_tmp <= Match_Drop_Num)
    {
        apply(route_pkt);
    }
}

control egress {
    // leave empty
}

```

## 实验步骤

在执行本实验之前，请先完成博客：[Run P4 without p4factory](http://www.cnblogs.com/qq952693358/p/6195385.html) 的内容。

### 改动：

1.p4src：

请将上文中的P4程序添加到目录p4src中，命名为source_routing.p4

2.command.txt:

```
table_set_default Count_Table _drop
table_set_default route_pkt route
table_add Count_Table Read_Register 00000101 => 1
```

### Mininet：

1.执行./run_demo.sh：

```
parsing successful
semantic checking successful
Header type standard_metadata_t not byte-aligned, adding padding
Generating json output to /home/wasdns/P4Slices/Sample/Sample_sourcerouting/source_routing.json
*** Creating network
*** Adding hosts:
h1 h2 h3 
*** Adding switches:
s1 s2 s3 
*** Adding links:
(h1, s1) (h2, s2) (h3, s3) (s1, s2) (s1, s3) (s2, s3) 
*** Configuring hosts
h1 h2 h3 
*** Starting controller

*** Starting 3 switches
s1 Starting P4 switch s1
/home/wasdns/bmv2/targets/simple_switch/simple_switch -i 1@s1-eth1 -i 2@s1-eth2 -i 3@s1-eth3 --pcap --thrift-port 22222 --nanolog ipc:///tmp/bm-0-log.ipc --device-id 0 source_routing.json
switch has been started
s2 Starting P4 switch s2
/home/wasdns/bmv2/targets/simple_switch/simple_switch -i 1@s2-eth1 -i 2@s2-eth2 -i 3@s2-eth3 --pcap --thrift-port 22223 --nanolog ipc:///tmp/bm-1-log.ipc --device-id 1 source_routing.json
switch has been started
s3 Starting P4 switch s3
/home/wasdns/bmv2/targets/simple_switch/simple_switch -i 1@s3-eth1 -i 2@s3-eth2 -i 3@s3-eth3 --pcap --thrift-port 22224 --nanolog ipc:///tmp/bm-2-log.ipc --device-id 2 source_routing.json
switch has been started

/sbin/ethtool --offload eth0 rx off
/sbin/ethtool --offload eth0 tx off
/sbin/ethtool --offload eth0 sg off
disable ipv6
/sbin/ethtool --offload eth0 rx off
/sbin/ethtool --offload eth0 tx off
/sbin/ethtool --offload eth0 sg off
disable ipv6
/sbin/ethtool --offload eth0 rx off
/sbin/ethtool --offload eth0 tx off
/sbin/ethtool --offload eth0 sg off
disable ipv6
/home/wasdns/bmv2/tools/runtime_CLI.py --json source_routing.json --thrift-port 22222
Control utility for runtime P4 table manipulation
RuntimeCmd: Setting default action of Count_Table
action:              _drop
runtime data:        
RuntimeCmd: Setting default action of route_pkt
action:              route
runtime data:        
RuntimeCmd: Adding entry to exact match table Count_Table
match key:           EXACT-41
action:              Read_Register
runtime data:        00:00:00:01
Entry has been added with handle 0
RuntimeCmd: 

/home/wasdns/bmv2/tools/runtime_CLI.py --json source_routing.json --thrift-port 22223
Control utility for runtime P4 table manipulation
RuntimeCmd: Setting default action of Count_Table
action:              _drop
runtime data:        
RuntimeCmd: Setting default action of route_pkt
action:              route
runtime data:        
RuntimeCmd: Adding entry to exact match table Count_Table
match key:           EXACT-41
action:              Read_Register
runtime data:        00:00:00:01
Entry has been added with handle 0
RuntimeCmd: 

/home/wasdns/bmv2/tools/runtime_CLI.py --json source_routing.json --thrift-port 22224
Control utility for runtime P4 table manipulation
RuntimeCmd: Setting default action of Count_Table
action:              _drop
runtime data:        
RuntimeCmd: Setting default action of route_pkt
action:              route
runtime data:        
RuntimeCmd: Adding entry to exact match table Count_Table
match key:           EXACT-41
action:              Read_Register
runtime data:        00:00:00:01
Entry has been added with handle 0
RuntimeCmd: 

Ready !
*** Starting CLI:
mininet> 
```

2.打开h1，h3的xterm：

```
mininet> xterm h1 h3
```

3.在h3的终端中执行：

```
./receive.py
```

4.在h1的终端中执行：

```
./send.py h1 h3
```

5.在h1的终端中输入`Hello`，在h3的终端中出现“Hello”字样。

![](/Users/wasdns/Desktop/截图 2017-01-12 00时28分44秒.jpg)

### 对比实验

重启，将P4程序中的流控制程序改为：

```
control ingress 
{
    apply(Count_Table);

    if (Register_Meta.register_tmp > Match_Drop_Num)
    {
        apply(route_pkt);
    }
}
```

重新执行上文步骤的实验现象：在h1中发送信息，h3无法接收。

## 实验结论

本实验为验证性实验，验证以下功能：只有当当前数据报的端口为3时，才执行路由；否则执行丢包。

实验中，P4交换机部署P4程序生成的相关配置，同时根据运行时CLI为流表添加表项。


2017.1.12 Chen