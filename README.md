# P4-network-slices-A

Fuzhou University SDN Lab | P4language

Environment Requirements
环境要求：

1.Ubuntu 14.04 64bit

2.P4 related repo: 

a.bmv2 

b.p4c-bm

c.p4factory 

## Hint 注意：

**1.Please copy the demo in this repo into the dir `bmv2/target` before using it.**

**请将demo复制至目录`bmv2/target/`下运行！**

```
cp -r [demo_name] [your_dir]/bmv2/target
```

**2.Please using the command showed below once you exit the mininet:**

**在每一次退出mininet之后，请执行：**

```
sudo mn -c
```

**3.Don't add redundant blank spaces to the content of commands.txt. It'll cause the exception "duplicate entry".**

**在编写commands.txt的过程中，请不要加入多余的空行，这会导致`DUPLICATE_ENTRY`错误。**

> 2017.2 Wasdns