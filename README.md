# P4-network-slices-A

Using P4 to slice the substrate network.

## Dependencies

- bmv2;
- p4c-bm;
- p4c(option).

## Roadmap

This repo maintains our previous efforts on using P4 langauge, including five demos:

- Demo1: Add a register and a flow table to original source_routing.p4;
- Demo2: Add a counter to a simple P4 program and leverage runtime command to get the counter information;
- Demo3: With the experience acquired from demo2, we take a further step that apply the mechanism of droping packets as soon as the total packet number exceed the threshold;
- Demo4: Apply slicing mechanism in terms of droping packets on a simple topologic;
- Demo5: The final example that illustrates the whole mechanism of slicing the substrate network with P4 language.

## Questions

Mail: wasdnsxchen@gmail.com

2017.2 Wasdns. Rewrite on 2017.11.
