## Runtime Commands

### Introduction

This file introduced the formats of the runtime commands that we used for our repo and demo.

If you are interested in it, you can refer to the script that opensourced in the repo p4language, or you can run the commands below after starting the script runtime_CLI to learn more about it:

```
1.start the runtime CLI by specifing the thrift port number:

./runtime_CLI --thrift-port [port_number]

2.Using the command below in the CLI to check the formats of runtime commands.

Runtimecmd> ?
```

### Command Format

The basic operations of flow table:

流表的基本操作：

```
set the default action of the flow table:

- table_set_default <table name> <action name> <action parameters>

add an entry:

- table_add <table name> <action name> <match fields> => <action parameters> [priority]

delete an entry:

- table_delete <table name> <entry handle>
```

The basic operations of counter:

计数器的基本操作：

```
read the information from the counter instance:

counter_read $index_of_cell

reset the value of counter instance:

counter_reset $index_of_cell
```

Multicast-Related:

多播组：

```
Create a multicast group:

mc_mgrp_create [group_number]


Create a multicast node:

mc_node_create [v1] [v2]

v1 == multicast node id

v2 == host id

eg. mc_node_create 0 1


Associate a multicast node to a multicast group:

mc_node_associate [v1] [v3]

v3 == multicast node id 

eg. mc_node_associate 1 0
```
