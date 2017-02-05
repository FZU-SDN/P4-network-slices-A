## P4_Slices_DEMO2 README

### 实验目的：

将内含计数器的P4程序写入交换机，启动P4交换机，能够借助运行时CLI下发命令，从而看见交换机中的计数器信息。

### 实验准备：

1.Ubuntu 14.04

2.bmv2

3.p4c-bm

注：请修改各个脚本中的路径信息，如`$BMV2=/home/wasdns/bmv2`

### 实验步骤：

1.在终端A中启动P4交换机：

```
./run_switch.sh
```
显示如下：

```
root@ubuntu:/home/wasdns/tutorials/examples/slices_demo2# ./run_switch.sh 
parsing successful
semantic checking successful
Header type standard_metadata_t not byte-aligned, adding padding
Generating json output to /home/wasdns/tutorials/examples/slices_demo2/counter.json
Thrift port was not specified, will use 9090
Calling target program-options parser
Adding interface veth0 as port 0
Adding interface veth2 as port 1
Adding interface veth4 as port 2
Adding interface veth6 as port 3
Adding interface veth8 as port 4
Thrift server was started
Using JSON input counter.json
No Thrift port specified, using CLI default
Control utility for runtime P4 table manipulation
RuntimeCmd: Setting default action of Match_Table
action:              _noop
runtime data:        
RuntimeCmd: Setting default action of Ipv4_lpm
action:              _drop
runtime data:        
RuntimeCmd: Setting default action of Forward
action:              _drop
runtime data:        
RuntimeCmd: Setting default action of Apply_Drop
action:              _noop
runtime data:        
RuntimeCmd: Adding entry to lpm match table Ipv4_lpm
match key:           LPM-0a:00:00:03/32
action:              Set_DstMetadata
runtime data:        0a:00:00:03
Entry has been added with handle 0
RuntimeCmd: Adding entry to exact match table Forward
match key:           EXACT-0a:00:00:03
action:              forward
runtime data:        00:03
Entry has been added with handle 0
RuntimeCmd: Adding entry to exact match table Match_Table
match key:           EXACT-0a:00:00:03
action:              count_action
runtime data:        00:00:00:00
Entry has been added with handle 0
RuntimeCmd: 
READY!!!
sudo $SWITCH_PATH counter.json -i 0@veth0 -i 1@veth2 -i 2@veth4 -i 3@veth6 -i 4@veth8 --nanolog ipc:///tmp/bm-0-log.ipc --pcap

```

2.在终端B中指定thrift端口9090，启动运行时CLI：

```
./runtime_CLI.py --thrift-port 9090
```
显示如下：

```
root@ubuntu:/home/wasdns/tutorials/examples/slices_demo2# ./runtime_CLI.py --thrift-port 9090
Obtaining JSON from switch...
Done
Control utility for runtime P4 table manipulation
RuntimeCmd: 
```

3.在CLI中查看计数器信息：

```
RuntimeCmd: counter_read counter_read Indecounter 0
```

显示如下：

```
RuntimeCmd: counter_read Indecounter 0
Indecounter[0]=  BmCounterValue(packets=0, bytes=0)
```

4.执行发包脚本send.py：

```
./send.py
```

显示如下：

```
root@ubuntu:/home/wasdns/tutorials/examples/slices_demo2# ./send_one.py 
WARNING: No route found for IPv6 destination :: (no default route?)

```

5.再次下发CLI命令，查看计数器信息：

```
RuntimeCmd: counter_read counter_read Indecounter 0
```

显示如下：

```
RuntimeCmd: counter_read Indecounter 0
Indecounter[0]=  BmCounterValue(packets=1, bytes=70)

```
此时计数器信息为1.

6.通过CLI命令重置计数器，再次查看计数器信息

```
RuntimeCmd: counter_reset Indecounter

RuntimeCmd: counter_read Indecounter 0
Indecounter[0]=  BmCounterValue(packets=0, bytes=0)
```
重置成功。

###实验结论：

我们能够借助本实验中作为控制平面的运行时CLI实时查看数据平面的交换机信息，通过指定thrift服务端口能够对数据平面中某个特定的P4交换机进行独立配置。

> 2017/1/17 Chen