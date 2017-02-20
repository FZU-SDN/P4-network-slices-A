## Demo 5 README

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

## 准备

1.拓扑信息：

```
hosts IP: 10.0.0.i 

hosts MAC: 00:00:00:00:00:0i

(i = 1, 2, 3, 4, 5, 6)
```

执行：

```
./run_demo.sh
```

启动 mininet。

2.ping failed

```
mininet> pingall
```

此时主机之间无法正常通信。

3.打开一个新的终端，执行：

```
./add_entry.sh
```

进入mclearn目录，下发流表使主机之间相互通信。

```
cd mclearn
./learn.sh
```

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

注：建议不要使用learn_client。

## 虚拟化切片

本实验模拟三个虚拟租户：

租户A为h1和h4，使用交换机s1、s2、s4；

租户B为h2和h5，使用交换机s1、s3、s4；

租户C为h3和h6，使用交换机s1、s2、s3、s4。

租户A的数据包打上tag1，租户B的数据包打上tag2，租户C的数据包打上tag3。

**不同租户之间相互隔离！**

1.启动虚拟化：

```
cd slice
./start_virtual.sh
```

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

显示三个虚拟租户的hosts之间不能相互通信。

2.重置计数器：

```
cd cntreset
./reset.sh
```

3.打开一个新的终端，进入demo目录，执行：

```
sudo ./simple_switch_CLI --thrift-port 22223
```

以上命令，打开交换机**s2**的控制CLI，查看计数器信息(此时均为0)：

```
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 2
tag_counter[2]=  BmCounterValue(packets=0, bytes=0)
```

4.在mininet中执行：

```
h1 ping h4
```

在s2的CLI界面中查看计数器信息，当显示超过一百个包停止ping。

```
counter_read tag_counter 0
```

**注：计数器实例0计数租户A的数据包，实例1计数B的数据包，实例2计数C的数据包。**

5.停止为租户A提供服务：

```
cd apply_drop
./drop.sh
```

6.在mininet中执行`pingall`

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

结果显示租户A的服务已停止。

重置计数器：

```
cd ..
cd cntreset
./reset.sh
```

7.判断其他租户是否正常工作。

在mininet中分别让 h2和h5之间、h3和h6之间 通信一段时间：

```
mininet> h2 ping h5 -c 6
```

```
mininet> h3 ping h6 -c 6
```

查看交换机的计数器信息：

s1

```
tag_counter[0]=  BmCounterValue(packets=0, bytes=0)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=49, bytes=4410)
RuntimeCmd: counter_read tag_counter 2
tag_counter[2]=  BmCounterValue(packets=74, bytes=6468)
RuntimeCmd: counter_read tag_counter 3
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

证明：在停止租户A之后，交换机s2只为租户C提供服务；同时，交换机s1、s3、s4正常工作，租户B和C未受租户A的影响。

8.实验结束：

```
./finish.py
```

## 结论：

本实验在mininet中借助P4实现了租户网络虚拟化的需求模拟。

在租户A使用s1、s2、s4，租户B使用s1、s3、s4，租户C使用s1、s2、s3、s4的情况下，对租户A加以限制，当交换机s2接收的租户A数据报的数目超过100时，不再为租户A提供服务；同时不影响租户B、C主机之间的正常通信。

