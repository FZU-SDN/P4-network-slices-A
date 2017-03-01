P4 Dependency Graph Generator
==========

The relationships between tables of more complex P4 program can be difficult to comprehend. The p4-graphs utility parses through the the P4 program and generates a dependency graph using graphviz. The dependency graph can be generated with the following command:

```
p4-graphs <p4 code>
```

The resulting files can be viewed using xdot or with a PNG viewer.

In our repo, you can cd to the dir `slices_demo5` and run:

```
p4-graphs p4src/slices_demo5.p4
```

Then it will generate some graphs that describe the logic of P4 program.