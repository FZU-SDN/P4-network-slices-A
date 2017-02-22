## 2sw 带宽测试

```
           +-----+   +-----+
    h1 <=> |     |   |     | <=> h3
           |  s1 |<->|  s2 |
    h2 <=> |     |   |     | <=> h4
           +-----+   +-----+
```

## Test1

在tcp模式下，客户端到服务器上传带宽测试，测试时间为60秒。

h1运行客户端，h3运行服务器。

### start 

h1:

```
iperf -c 10.0.0.3 -t 60
```

h3:

```
iperf -s
```

### results

性能指标从左到右分别为：间隔/s、转递数据报/Mbytes、带宽 Mbits/sec 

h1 -> h3

```
0.0-60.0 sec 180Mbytes 25.2 Mbits/sec
```

h3 -> h1

```
0.0-60.3 sec 180Mbytes 25.1 Mbits/sec
```

## Test2

### start

1.在mininet中执行

```
mininet> h2 ping h4
```

2.进行Test1的测试。

3.读取mininet信息及Test1测试信息。

### result

a.mininet中测试结果：

```
64 bytes from 10.0.0.4: icmp_seq=1 ttl=64 time=3.39 ms
64 bytes from 10.0.0.4: icmp_seq=2 ttl=64 time=3.36 ms
64 bytes from 10.0.0.4: icmp_seq=3 ttl=64 time=2.23 ms
64 bytes from 10.0.0.4: icmp_seq=4 ttl=64 time=2.02 ms
64 bytes from 10.0.0.4: icmp_seq=5 ttl=64 time=1.90 ms
64 bytes from 10.0.0.4: icmp_seq=6 ttl=64 time=51.6 ms
64 bytes from 10.0.0.4: icmp_seq=7 ttl=64 time=99.8 ms
64 bytes from 10.0.0.4: icmp_seq=8 ttl=64 time=70.6 ms
64 bytes from 10.0.0.4: icmp_seq=9 ttl=64 time=53.8 ms
64 bytes from 10.0.0.4: icmp_seq=10 ttl=64 time=65.4 ms
64 bytes from 10.0.0.4: icmp_seq=11 ttl=64 time=50.7 ms
64 bytes from 10.0.0.4: icmp_seq=12 ttl=64 time=50.3 ms
64 bytes from 10.0.0.4: icmp_seq=13 ttl=64 time=52.0 ms
64 bytes from 10.0.0.4: icmp_seq=14 ttl=64 time=57.4 ms
64 bytes from 10.0.0.4: icmp_seq=15 ttl=64 time=56.4 ms
64 bytes from 10.0.0.4: icmp_seq=16 ttl=64 time=42.4 ms
64 bytes from 10.0.0.4: icmp_seq=17 ttl=64 time=48.2 ms
64 bytes from 10.0.0.4: icmp_seq=18 ttl=64 time=38.0 ms
64 bytes from 10.0.0.4: icmp_seq=19 ttl=64 time=38.7 ms
64 bytes from 10.0.0.4: icmp_seq=20 ttl=64 time=96.9 ms
64 bytes from 10.0.0.4: icmp_seq=63 ttl=64 time=50.0 ms

···

64 bytes from 10.0.0.4: icmp_seq=64 ttl=64 time=24.1 ms
64 bytes from 10.0.0.4: icmp_seq=65 ttl=64 time=26.2 ms
64 bytes from 10.0.0.4: icmp_seq=66 ttl=64 time=5.73 ms
64 bytes from 10.0.0.4: icmp_seq=67 ttl=64 time=2.46 ms
64 bytes from 10.0.0.4: icmp_seq=68 ttl=64 time=3.11 ms
64 bytes from 10.0.0.4: icmp_seq=69 ttl=64 time=4.79 ms
64 bytes from 10.0.0.4: icmp_seq=70 ttl=64 time=2.05 ms
64 bytes from 10.0.0.4: icmp_seq=71 ttl=64 time=1.77 ms
64 bytes from 10.0.0.4: icmp_seq=72 ttl=64 time=2.91 ms
64 bytes from 10.0.0.4: icmp_seq=73 ttl=64 time=2.74 ms
64 bytes from 10.0.0.4: icmp_seq=74 ttl=64 time=2.05 ms
64 bytes from 10.0.0.4: icmp_seq=75 ttl=64 time=0.964 ms
64 bytes from 10.0.0.4: icmp_seq=76 ttl=64 time=1.68 ms
64 bytes from 10.0.0.4: icmp_seq=77 ttl=64 time=1.81 ms

```

可以看到明显的往返时间波动：

```
rtt min/avg/max/mdev = 0.964/26.144/99.809/22.371 ms
```

b.iperf 测试结果：

性能指标从左到右分别为：间隔(s)、转递数据报(Mbytes)、带宽(Mbits/sec) 

h1 -> h3

```
0.0-60.1 sec 180Mbytes 25.1 Mbits/sec
```

h3 -> h1

```
0.0-60.2 sec 180Mbytes 25.0 Mbits/sec
```

与测试一结果基本一致。