---
layout: page
title: "Transmitting a DataSet"
parent: "Data Flow"
grand_parent: "Operation of the collector engine"
nav_order: 2
permalink: /docs/igrc-platform/collector/collector-engine-operations/data-flow/transmitting-dataset/
---
---

While the collector line runs, a dataset is created by the main source and then transmitted to other components following the various transitions. There is a variable called 'dataset' which always contains the current dataset.   
In reality, the same dataset does not flow between components. Whenever a component must pass the dataset to another component through a transition, the dataset is duplicated and the next component receives a copy of the dataset. This copy becomes the current dataset available through the 'dataset' variable.   
The impact of this relates to the forks when two transitions start from the same component. For example, component A has two outgoing transitions to components B and C. When running, component A is executed and has a dataset. The dataset is duplicated and transmitted to component B. Once B has been processed, component A duplicates the dataset a second time and sends it to component C. It is important to understand in this example that component C receives dataset from component A and not from component B even if component B was run before it. If component B modifies the dataset by adding an 'attrb' attribute, component C receives a dataset that does not contain the 'attrb' attribute. For component C to receive the component B's changes in the dataset, we must review the design of the collector line to bind A to B and B to C.
