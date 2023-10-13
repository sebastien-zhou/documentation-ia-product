---
layout: page
title: "Equals method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 5
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/equals-method/
---
---

Checks equality with another object. A dataset is considered equal to another if the two datasets have the same attributes (characteristics and list of values)  

**Signature:**   

- equals(object): Boolean   

**Return value:**   

- true if the object passed as a parameter is a dataset with the same attributes

**Parameters:**     

- object: Object The object to compare with the dataset.

**Example call:**

```
var same = dataset.equals(otherDataset);

if (! same) {
  print("The two datasets are different");
}
```
