---
layout: page
title: "Data grouping"
parent: "Data Flow"
grand_parent: "Operation of the collector engine"
nav_order: 4
permalink: /docs/igrc-platform/collector/collector-engine-operations/data-flow/data-grouping/
---
---

The data grouping component is useful for gathering several values that were initially separated into several different records in a multivalued attribute. For example, an HR extraction can provide a CSV file with one line per identity. If an identity has several jobs, the identity appears on multiple lines with all the information repeated and a different job on each line. To reconstitute a single dataset with a multivalued attribute _job_ from multiple CSV records, you must use the grouping component.   

The grouping component works by detecting ruptures. An expression based on the content of the dataset is set in the component in order to allow it, during the execution of the collector line, to determine when a rupture occurs. In the example with the job, the rupture happens when first name and last name change. In this case, enter the expression as follows:   

{ dataset.first\_name.get() + ' ' + dataset.last\_name.get() }   

For each dataset arriving in the grouping component, the expression is evaluated. If the result is different from the result of the expression in the previous dataset, this means that the new dataset relates to a different identity, otherwise the dataset completes the previous dataset as it is for the same identity (same first and last name). This detection is called rupture detection.   
The algorithm used to group the attribute values is as follows:   

- For each dataset received by the component
- Calculate the rupture expression
- If no break is detected (same identity in the above example)
- Aggregation of values of this new dataset (_job_ attribute in the example) in the previous dataset
- Removal the new dataset to send nothing to the following components
- Otherwise (new identity in the example)
- Emission of the previous dataset towards the following components
- Memorization of the new dataset as a starting point for the attributes aggregation

This mechanism introduces a desynchronization between the datasets received by the component and the datasets issued after grouping the _job_ attribute to the following components. Indeed, while the second dataset arrives in the component group, the group outputs the first dataset to other components, and so on. With this mechanism, when the last dataset is received, the component emits the next-to-last dataset to the following components. It is only when the collector engine goes into the Flushing state that the grouping component can transmit the last dataset which was waiting for rupture detection.
