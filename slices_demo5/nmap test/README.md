nmap test
=========

Description:

Using command nmap to catch the reachable hosts.

command:

```
nmap -sP 10.0.0.0/24
```

using `ping` to find the response hosts.

### Before slicing:

```
mininet> h1 nmap -sP 10.0.0.0/24
```

```
Starting Nmap 6.40 ( http://nmap.org ) at 2017-03-03 00:51 PST
Nmap scan report for 10.0.0.2
Host is up (0.16s latency).
MAC Address: 00:00:00:00:00:02 (Xerox)
Nmap scan report for 10.0.0.3
Host is up (0.17s latency).
MAC Address: 00:00:00:00:00:03 (Xerox)
Nmap scan report for 10.0.0.4
Host is up (0.92s latency).
MAC Address: 00:00:00:00:00:04 (Xerox)
Nmap scan report for 10.0.0.5
Host is up (0.92s latency).
MAC Address: 00:00:00:00:00:05 (Xerox)
Nmap scan report for 10.0.0.6
Host is up (0.31s latency).
MAC Address: 00:00:00:00:00:06 (Xerox)
Nmap scan report for 10.0.0.1
Host is up.
Nmap done: 256 IP addresses (6 hosts up) scanned in 58.39 seconds
```

### After slicing

```
mininet> h1 nmap -sP 10.0.0.0/24
```

```
Starting Nmap 6.40 ( http://nmap.org ) at 2017-03-03 00:55 PST
Nmap scan report for 10.0.0.1
Host is up.
Nmap done: 256 IP addresses (1 host up) scanned in 23.50 seconds
```