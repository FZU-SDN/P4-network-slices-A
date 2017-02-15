```
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 3, port_out: 3

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, port_in: 3
type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, port_in: 3
type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, port_in: 3

type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5909, copy_id: 4, port_out: 4

type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, table_id: 0 (smac), entry_hdl: 1
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5910, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5910, copy_id: 4, port_out: 4

type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, table_id: 0 (smac), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5911, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 1, port_out: 1

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, port_in: 3

type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 2, pipeline_id: 1 (egress)

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, port_in: 3

type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5911, copy_id: 4, port_out: 4

type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, table_id: 0 (smac), entry_hdl: 3
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5912, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 5912, copy_id: 4, port_out: 4

type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, table_id: 0 (smac), entry_hdl: 2
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5913, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 5913, copy_id: 4, port_out: 4

type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, table_id: 0 (smac), entry_hdl: 1
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 5914, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 5914, copy_id: 4, port_out: 4

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, port_in: 3
type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 5916, copy_id: 0, port_in: 3
type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 5917, copy_id: 0, port_in: 3

type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, table_id: 0 (smac), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 5915, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 5915, copy_id: 2, deparser_id: 0 (deparser)

type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6097, copy_id: 4, port_out: 4

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, port_in: 3
type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, table_id: 0 (smac), entry_hdl: 1
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6098, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6098, copy_id: 4, port_out: 4

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, port_in: 3
type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, table_id: 0 (smac), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6099, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6099, copy_id: 4, port_out: 4

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, port_in: 3
type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, table_id: 0 (smac), entry_hdl: 3
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6100, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 428584625336497208, id: 6100, copy_id: 4, port_out: 4

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, port_in: 3
type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, table_id: 0 (smac), entry_hdl: 2
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 13164442230443910137, id: 6101, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 3478714474507809774, id: 6101, copy_id: 4, port_out: 4

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, port_in: 3
type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, table_id: 0 (smac), entry_hdl: 1
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 15309147182895934544, id: 6102, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 17608102135634003032, id: 6102, copy_id: 4, port_out: 4

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, port_in: 3
type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, table_id: 0 (smac), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, action_id: 4 (_nop)
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, table_id: 1 (dmac)
type: ACTION_EXECUTE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, action_id: 3 (broadcast)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1245808593706828623, id: 6103, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 1, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 1, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 1, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 1, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 1, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 1, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 1, port_out: 1
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 2, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 2, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 2, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 2, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 2, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 2, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 2, port_out: 2
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 3, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 3, condition_id: 0 (_condition_0), result: True
type: TABLE_MISS, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 3, table_id: 2 (mcast_src_pruning)
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 3, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 3, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 3, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 3, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 3, port_out: 3
type: PIPELINE_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 4, pipeline_id: 1 (egress)
type: CONDITION_EVAL, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 4, condition_id: 0 (_condition_0), result: False
type: PIPELINE_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 4, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 4, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 4, header_id: 1 (ethernet)
type: DEPARSER_DONE, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 4, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id: 0, sig: 1431955739140458655, id: 6103, copy_id: 4, port_out: 4

type: PACKET_IN, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6104, copy_id: 0, port_in: 3
type: PARSER_START, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6104, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6104, copy_id: 0, header_id: 1 (ethernet)
type: PARSER_DONE, switch_id: 0, cxt_id: 0, sig: 9423436195876621694, id: 6104, copy_id: 0, parser_id: 0 (parser)
```