## 2sw带宽测试 续

```
           +-----+   +-----+
    h1 <=> |     |   |     | <=> h3
           |  s1 |<->|  s2 |
    h2 <=> |     |   |     | <=> h4
           +-----+   +-----+
```

请先确保主机之间正常通信。

## 正常情况

1.在主机之间正常通信时，执行:

```
mininet> h2 ping h4 -c 100
```

ping值情况：

```
--- 10.0.0.4 ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 99180ms
rtt min/avg/max/mdev = 0.868/2.351/6.706/1.112 ms

```

2.在tcp模式下，客户端到服务器上传带宽测试，测试时间为60秒。

h1运行客户端，h3运行服务器。

开启xterm

```
mininet> xterm h1 h3
```

xterm h3:

```
iperf -s
```

xterm h1:

```
iperf -c 10.0.0.3 -t 90
```

同时mininet执行：

```
mininet> h2 ping h4 -c 100
```

结果：

```
100 packets transmitted, 100 received, 0% packet loss, time 99134ms
rtt min/avg/max/mdev = 10.205/34.551/608.747/60.752 ms
```

```
h1 -> h3

0.0-120.0 sec 382Mbytes 26.7 Mbits/sec

h3 -> h1

0.0-120.3 sec 382Mbytes 26.7 Mbits/sec
```

3.结果：产生大流量的情况下，平均ping值是正常情况的14.7倍。

## 虚拟化情况

1.在主机之间正常通信时，执行:

```
mininet> h2 ping h4 -c 100
```

ping值情况：

```
100 packets transmitted, 100 received, 0% packet loss, time 99218ms
rtt min/avg/max/mdev = 1.008/2.644/5.653/1.001 ms
```

2.在tcp模式下，客户端到服务器上传带宽测试，测试时间为60秒。

h1运行客户端，h3运行服务器。

开启xterm

```
mininet> xterm h1 h3
```

xterm h3:

```
iperf -s
```

xterm h1:

```
iperf -c 10.0.0.3 -t 90
```

同时mininet执行：

```
mininet> h2 ping h4 -c 100
```

结果(取h1-h3带宽相对接近380的组别)：

```
100 packets transmitted, 100 received, 0% packet loss, time 99149ms
rtt min/avg/max/mdev = 10.090/30.276/161.977/18.119 ms

```

```
h1 -> h3

0.0-120.0 sec 350Mbytes 24.4 Mbits/sec

h3 -> h1

0.0-120.1 sec 350Mbytes 24.4 Mbits/sec
```

3.结果：产生大流量的情况下，平均ping值是正常情况的11.5倍。

## Compare

未启动虚拟化的情况下，产生大流量平均ping值是正常情况的**14.7**倍；在启动虚拟化的情况下，产生大流量平均ping值是平正常情况的**11.5**倍。
