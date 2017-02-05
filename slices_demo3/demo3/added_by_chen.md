add_entry send_frame 1 rewrite_mac 00:aa:bb:00:00:00

add_entry send_frame 2 rewrite_mac 00:aa:bb:00:00:01

add_entry forward 10.0.0.10 set_dmac 00:04:00:00:00:00

add_entry forward 10.0.1.10 set_dmac 00:04:00:00:00:01

add_entry ipv4_lpm 10.0.0.10 32 set_nhop 10.0.0.10 1

add_entry ipv4_lpm 10.0.1.10 32 set_nhop 10.0.1.10 2

```
# added by chen

add_entry Match_Table 10.0.0.10 _noop

add_entry Match_Table 10.0.1.10 _noop

add_entry Apply_Drop 10.0.1.10 _noop

add_entry Apply_Drop 10.0.1.10 _noop

```

