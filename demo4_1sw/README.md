## Demo4 README

## 1sw

```
           +-----+ 
    h1 <=> |     | <=> h3
           |  s  |
    h2 <=> |     | <=> h4
           +-----+
```

1.拓扑信息：

hosts IP: 10.0.0.i 
hosts MAC: 00:00:00:00:00:0i

(i = 1, 2, 3, 4)

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

```
mininet> pingall
*** Ping: testing ping reachability
h1 -> X X X 
h2 -> X X X 
h3 -> X X X 
h4 -> X X X 
*** Results: 100% dropped (0/12 received)
```

3.打开两个新的终端A和B，分别启动s1、s2的learn_client，使两台交换机进行mac学习。

```
cd learn_client_s1
make
./learn_client
```

4.下发流表，使四台主机相互通信：

```
./add_entry.sh
```

```
mininet> pingall
```

```
mininet> pingall
*** Ping: testing ping reachability
h1 -> h2 h3 h4 
h2 -> h1 h3 h4 
h3 -> h1 h2 h4 
h4 -> h1 h2 h3 
*** Results: 0% dropped (12/12 received)
```

> 附：也可以通过以下方式执行脚本下发流表使s1、s2及四台host正常通信(无需进行mac_learn)。

```
./add_entry.sh

cd mclearn
./mc_learn.sh
```

5.执行脚本：

```
cd slice
./start_virtual.sh
```

启动两个租户A、B，同时记录流表handle信息。

租户A使用host 1、2；租户B使用host 3、4。

当交换机接收到来自租户A、B的数据报时，打上tag1、tag2，并对其进行计数。

**不同租户之间不能通信。**

```
mininet> pingall
*** Ping: testing ping reachability
h1 -> X h3 X 
h2 -> X X h4 
h3 -> h1 X X 
h4 -> X h2 X 
*** Results: 66% dropped (4/12 received)
mininet>
```

6.打开cmd控制界面下发运行时命令：

```
./simple_switch_CLI --thrift-port 22222
```

查看计数器信息：

```
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=0, bytes=0)

RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=0, bytes=0)
```

7.在mininet中执行：

```
mininet> h1 ping h3
```

在cmd控制界面查看数据报信息：

```
···
tag_counter[0]=  BmCounterValue(packets=80, bytes=7616)
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=82, bytes=7812)
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=84, bytes=8008)
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=90, bytes=8596)
···
```

8.当计数器显示超过一百个包时，从运行时命令行下发运行时命令，阻断h1与h3之间的通信。

计数器超过100个包：

```
tag_counter[0]=  BmCounterValue(packets=98, bytes=9380)
RuntimeCmd: counter_read tag_counter 0
tag_counter[0]=  BmCounterValue(packets=104, bytes=9856)
```

下发命令。启动cmd界面：

```
sudo ./simple_switch_CLI --thrift-port 22222
```

a.根据handle(tagout流表中handle为0和1)删除原有表项：

```
RuntimeCmd: table_delete tagout 0
Deleting entry 0 from tagout

RuntimeCmd: table_delete tagout 1
Deleting entry 1 from tagout
```

b.添加表项，当接收的数据报是租户A的数据报时，丢弃。

```
cd apply_drop
./drop.sh
```

此时h1和h3无法正常通信，h2和h4正常通信。

```
mininet> pingall
*** Ping: testing ping reachability
h1 -> X X X 
h2 -> X X h4 
h3 -> X X X 
h4 -> X h2 X 
*** Results: 83% dropped (2/12 received)
mininet> 
```

9.在mininet中使h2和h4进行通信，在cmd中查看计数器信息：

```
mininet> h2 ping h4
PING 10.0.0.4 (10.0.0.4) 56(84) bytes of data.
64 bytes from 10.0.0.4: icmp_seq=1 ttl=64 time=0.746 ms
64 bytes from 10.0.0.4: icmp_seq=2 ttl=64 time=0.992 ms
64 bytes from 10.0.0.4: icmp_seq=3 ttl=64 time=2.29 ms
64 bytes from 10.0.0.4: icmp_seq=4 ttl=64 time=0.968 ms
64 bytes from 10.0.0.4: icmp_seq=5 ttl=64 time=1.00 ms
64 bytes from 10.0.0.4: icmp_seq=6 ttl=64 time=1.50 ms
64 bytes from 10.0.0.4: icmp_seq=7 ttl=64 time=0.729 ms
64 bytes from 10.0.0.4: icmp_seq=8 ttl=64 time=0.998 ms
64 bytes from 10.0.0.4: icmp_seq=9 ttl=64 time=0.899 ms
```

```
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=42, bytes=3108)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=44, bytes=3304)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=46, bytes=3500)
RuntimeCmd: counter_read tag_counter 1
tag_counter[1]=  BmCounterValue(packets=48, bytes=3696)
RuntimeCmd: 
```

> 结论：

本实验在mininet中进行了简单的双租户需求模拟。

在租户A使用h1、h3，租户B使用h2、h4的情况下，对租户A加以限制，当交换机接收的租户A数据报的数目超过100时，不再为租户A提供服务；同时不影响租户B的两台主机的正常通信。
