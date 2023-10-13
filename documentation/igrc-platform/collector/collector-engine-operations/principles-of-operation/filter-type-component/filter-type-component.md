---
layout: page
title: "Filter type component and target type component"
parent: "Principles of operation"
grand_parent: "Operation of the collector engine"
nav_order: 2
permalink: /docs/igrc-platform/collector/collector-engine-operations/principles-of-operation/filter-type-component/
---
---

Filter type components are used to modify the contents of the current dataset while the target type components provide data to the ledger from the current dataset without modifying anything. In both cases, components accept a dataset as input, process it, and then go to the next component according to the transitions.   
It is important to note that a target type component is not a terminal element in the collector line, but it may have one or more outgoing transitions to other filter or target type components as shown in the following example:

![Target type](./images/worddav15d9665a2b9b5d2161dab2b26e48729f.png "Target type")   

**_Sequencing several targets_**

Only filter type components are involved in the formation of the data pattern. For example, adding an attribute calculated from another one in the modification component automatically declares the new attribute in the collector line pattern. Target type components never modify the dataset and, therefore, have no effect on the pattern.
