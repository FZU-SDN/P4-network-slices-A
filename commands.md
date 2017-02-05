## commands.txt

流表的基本操作：

```
- table_set_default <table name> <action name> <action parameters>
- table_add <table name> <action name> <match fields> => <action parameters> [priority]
- table_delete <table name> <entry handle>
```

寄存器的基本操作：

```
register_read register_count $index
register_write register_count $index $value
```

计数器的基本操作：

```
counter_read

```
```
    def do_counter_read(self, line):
        "Read counter value: counter_read <name> <index>"
        args = line.split()
        self.exactly_n_args(args, 2)
        counter_name = args[0]
        counter = self.get_res("counter", counter_name, COUNTER_ARRAYS)
        index = args[1]
        try:
            index = int(index)
        except:
            raise UIn_Error("Bad format for index")
        if counter.is_direct:
            table_name = counter.binding
            print "this is the direct counter for table", table_name
            # index = index & 0xffffffff
            value = self.client.bm_mt_read_counter(0, table_name, index)
        else:
            value = self.client.bm_counter_read(0, counter_name, index)
        print "%s[%d]= " % (counter_name, index), value

    def complete_counter_read(self, text, line, start_index, end_index):
        return self._complete_counters(text)

```