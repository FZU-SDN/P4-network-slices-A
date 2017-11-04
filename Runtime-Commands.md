## Runtime Commands

### Introduction

This file introduced the formats of the runtime commands that we used for our repo and demo.

If you are interested in it, you can refer to the script that opensourced in the repo p4language, or you can run the commands below after starting the script runtime_CLI to learn more about it:

```
1.start the runtime CLI by specifing the thrift port number:

./runtime_CLI --thrift-port [port_number]

2.Using the command below in the CLI to check the formats of runtime commands.

RuntimeCmd> ?
```

```
Documented commands (type help <topic>):
========================================
act_prof_add_member_to_group       set_crc16_parameters                   
act_prof_create_group              set_crc32_parameters                   
act_prof_create_member             set_queue_depth                        
act_prof_delete_group              set_queue_rate                         
act_prof_delete_member             shell                                  
act_prof_dump                      show_actions                           
act_prof_dump_group                show_ports                             
act_prof_dump_member               show_tables                            
act_prof_modify_member             swap_configs                           
act_prof_remove_member_from_group  switch_info                            
counter_read                       table_add                              
counter_reset                      table_delete                           
get_time_elapsed                   table_dump                             
get_time_since_epoch               table_dump_entry                       
help                               table_dump_entry_from_key              
load_new_config_file               table_dump_group                       
mc_dump                            table_dump_member                      
mc_mgrp_create                     table_indirect_add                     
mc_mgrp_destroy                    table_indirect_add_member_to_group     
mc_node_associate                  table_indirect_add_with_group          
mc_node_create                     table_indirect_create_group            
mc_node_destroy                    table_indirect_create_member           
mc_node_dissociate                 table_indirect_delete                  
mc_node_update                     table_indirect_delete_group            
mc_set_lag_membership              table_indirect_delete_member           
meter_array_set_rates              table_indirect_modify_member           
meter_get_rates                    table_indirect_remove_member_from_group
meter_set_rates                    table_indirect_set_default             
mirroring_add                      table_indirect_set_default_with_group  
mirroring_delete                   table_info                             
port_add                           table_modify                           
port_remove                        table_num_entries                      
register_read                      table_set_default                      
register_reset                     table_set_timeout                      
register_write                     table_show_actions                     
reset_state                        write_config_to_file                   
serialize_state                  

Undocumented commands:
======================
EOF  greet
```

### Command Format

The basic operations of flow table:

```
set the default action of the flow table:

- table_set_default <table name> <action name> <action parameters>

add an entry:

- table_add <table name> <action name> <match fields> => <action parameters> [priority]

delete an entry:

- table_delete <table name> <entry handle>
```

The basic operations of counter:

```
read the information from the counter instance:

counter_read $index_of_cell

reset the value of counter instance:

counter_reset $index_of_cell
```

Multicast:

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
