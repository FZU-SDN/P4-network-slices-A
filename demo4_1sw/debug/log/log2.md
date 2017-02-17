```
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17673452583133829274, id: 14506, copy_id: 4, port_out: 4

type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 1616123624501953912, id: 14507, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 1616123624501953912, id: 14507, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1616123624501953912, id: 14507, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1616123624501953912, id: 14507, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 1616123624501953912, id: 14507, copy_id: 0, table_id: 0 (smac), entry_hdl: 1
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1616123624501953912, id: 14507, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 1616123624501953912, id: 14507, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1616123624501953912, id: 14507, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1616123624501953912, id: 14507, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 4927514388315285705, id: 14507, copy_id: 4, port_out: 4

type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 11268008854624801441, id: 14508, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 11268008854624801441, id: 14508, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 11268008854624801441, id: 14508, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 11268008854624801441, id: 14508, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 11268008854624801441, id: 14508, copy_id: 0, table_id: 0 (smac), entry_hdl: 2
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 11268008854624801441, id: 14508, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 11268008854624801441, id: 14508, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 11268008854624801441, id: 14508, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 11268008854624801441, id: 14508, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 12971561170180656713, id: 14508, copy_id: 4, port_out: 4

type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 3743839640928961760, id: 14509, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 3743839640928961760, id: 14509, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3743839640928961760, id: 14509, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3743839640928961760, id: 14509, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 3743839640928961760, id: 14509, copy_id: 0, table_id: 0 (smac), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 3743839640928961760, id: 14509, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 3743839640928961760, id: 14509, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 3743839640928961760, id: 14509, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3743839640928961760, id: 14509, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 11505129450399727498, id: 14509, copy_id: 2, deparser_id: 0 (deparser)
```