## Demo 5 README

Related Works: [demo4_2sw](https://github.com/Emil-501/P4-network-slices-A/tree/master/demo4_2sw)

## Web

Github: [Web for slicing](https://github.com/Emil-501/web_for_slice)

This repo(i.e.Web for slicing) is used to abstract the runtime_CLI (i.e. simple_switch_CLI) which is used in our repo named P4-network-slices-A. It’s easy to operate and we change the way we used before to insert the flow entries to specific switch.

The web is made of two major part. The first one is the static topologic boundary, we made it easy to program. The second part is we abstracted the script that is used in our demo into buttons which is easy to call. 

## Topo

```
            +===+
+-+         | 2 |         +-+
| |---+ +---|   |---+ +---| |
+-+   | |   +===+   | |   +-+
     +===+         +===+
+-+  | 1 |         | 4 |  +-+
| |--|   |         |   |--| |
+-+  +===+         +===+  +-+
      | |           | |
+-+   | |   +===+   | |   +-+
| |---+ +---| 3 |---+ +---| |
+-+         |   |         +-+
            +===+
```

## Preparation

1.The topologic infomations:

拓扑信息：

```
hosts IP: 10.0.0.i 

hosts MAC: 00:00:00:00:00:0i

(i = 1, 2, 3, 4, 5, 6)
```

Execute:

执行：

```
./run_demo.sh
```

Start mininet.

启动 mininet。

2.ping failed

```
mininet> pingall
```

The hosts cannot communicate each other successfully now.

此时主机之间无法正常通信。

3.Open a new terminal and execute the commands:

打开一个新的终端，执行：

```
./add_entry.sh
```

cd to the dir mclearn and execute the script "learn.sh" to make the net function well:

进入mclearn目录，下发流表使主机之间相互通信:

```
cd mclearn
./learn.sh
```

the six hosts can communicate each other normally:

此时六台主机之间正常通信：

```
mininet> pingall
*** Ping: testing ping reachability
h1 -> h2 h3 h4 h5 h6 
h2 -> h1 h3 h4 h5 h6 
h3 -> h1 h2 h4 h5 h6 
h4 -> h1 h2 h3 h5 h6 
h5 -> h1 h2 h3 h4 h6 
h6 -> h1 h2 h3 h4 h5 
*** Results: 0% dropped (30/30 received)
```

Hint: My advise is, don't use the learn_client engine in this demo.

注：建议不要使用learn_client。

## Virtualization Slicing 虚拟化切片

This experiment simulates three virtual tenant:

本实验模拟三个虚拟租户：

The host h1 and h4 belongs to tenant A, and the virtual network using the elements s1, s2, s4;

租户A为h1和h4，使用交换机s1、s2、s4；

The host h2 and h5 belongs to tenant B, and the virtual network using the elements s1, s3, s4;

租户B为h2和h5，使用交换机s1、s3、s4；

The host h3 and h6 belongs to tenant C, and the virtual network using the elements s1, s2, s3, s4.

租户C为h3和h6，使用交换机s1、s2、s3、s4。

The packets from tenant A, B and C is added by the tag1, tag2 and tag3, respectively.

租户A的数据包打上tag1，租户B的数据包打上tag2，租户C的数据包打上tag3。

**Keeping the isolation between different tenants is very improtant!**

**不同租户之间相互隔离！**

1.Start virtualization:

启动虚拟化：

```
cd slice
./start_virtual.sh
```

Execute `pingall` in the mininet:

在mininet中执行`pingall`：

```
mininet> pingall
*** Ping: testing ping reachability
h1 -> X X h4 X X 
h2 -> X X X h5 X 
h3 -> X X X X h6 
h4 -> h1 X X X X 
h5 -> X h2 X X X 
h6 -> X X h3 X X 
*** Results: 80% dropped (6/30 received)
```

It shows that the hosts that belongs to different tenants cannot communicate each other.

显示三个虚拟租户的hosts之间不能相互通信。

2.reset the counter instance:

重置计数器：

```
cd cntreset
./reset.sh
```

3.Open a new terminal and cd to the dir slices_demo5 and then execute:

打开一个新的终端，进入demo目录，执行：

```
sudo ./simple_switch_CLI --thrift-port 22223
```

open the runtime CLI of the switch s2, and check the information of the counter instances:

以上命令，打开交换机**s2**的控制CLI，查看计数器信息(此时均为0)：

```
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 2
tag_counter[2]=  BmCounterValue(packets=0, bytes=0)
```

4.Execute this command in mininet:

在mininet中执行：

```
h1 ping h4
```

Check the counter informations in the CLI of the switch s2, stop the ping process in the mininet as soon as the CLI shows that the counter have counted over 100 packets.

在s2的CLI界面中查看计数器信息，当显示超过一百个包停止ping。

```
counter_read tag_counter 0
```

**Hint: The counter instance 0 counts the packets from tenant A; the counter instance 1 counts the packets from tenant B; the counter instance 2 counts the packets from tenant C.**

**注：计数器实例0计数租户A的数据包，实例1计数B的数据包，实例2计数C的数据包。**

5.Stop the virtual network A:

停止为租户A提供服务：

```
cd apply_drop
./drop.sh
```

6.Execute `pingall` in mininet

在mininet中执行`pingall`

```
mininet> pingall
*** Ping: testing ping reachability
h1 -> X X X X X 
h2 -> X X X h5 X 
h3 -> X X X X h6 
h4 -> X X X X X 
h5 -> X h2 X X X 
h6 -> X X h3 X X 
*** Results: 86% dropped (4/30 received)
```

The result shows that the virtual network of tenant A has been stoped.

结果显示租户A的服务已停止。

Reset the counter instance:

重置计数器：

```
cd ..
cd cntreset
./reset.sh
```

7.Check if the virtual networks of other tenants function well or not.

判断其他租户是否正常工作。

Execute ping between the h2 and h5, h3 and h6 for a little while:

在mininet中分别让 h2和h5之间、h3和h6之间 通信一段时间：

```
mininet> h2 ping h5 -c 6
```

```
mininet> h3 ping h6 -c 6
```

Check the counter informations of the switches:

查看交换机的计数器信息：

s1

```
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=49, bytes=4410)
RuntimeCmd: counter_read tag_counter 2
tag_counter[2]=  BmCounterValue(packets=74, bytes=6468)
```

s2

```
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 2
tag_counter[2]=  BmCounterValue(packets=21, bytes=1890)
```

s3

```
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=14, bytes=1260)
RuntimeCmd: counter_read tag_counter 2
tag_counter[2]=  BmCounterValue(packets=21, bytes=1890)
RuntimeCmd: 
```

s4

```
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=49, bytes=4410)
RuntimeCmd: counter_read tag_counter 2
tag_counter[2]=  BmCounterValue(packets=94, bytes=8652)
RuntimeCmd: 
```

The results proved that: the switch s2 only give serve to the tenant C after stopping the virtual network of tenant A; meanwhile, the switch s1, s3 and s4 function well and the virtual networks of tenant B and C didn't suffer from the close of tenant A's virtual network.

证明：在停止租户A之后，交换机s2只为租户C提供服务；同时，交换机s1、s3、s4正常工作，租户B和C未受租户A的影响。

8.Finish the experiment:

实验结束：

```
./finish.py
```

## Nmap test

See directory: `Nmap test`

## 结论：

本实验在mininet中借助P4实现了租户网络虚拟化的需求模拟。

在租户A使用s1、s2、s4，租户B使用s1、s3、s4，租户C使用s1、s2、s3、s4的情况下，对租户A加以限制，当交换机s2接收的租户A数据报的数目超过100时，不再为租户A提供服务；同时不影响租户B、C主机之间的正常通信。

