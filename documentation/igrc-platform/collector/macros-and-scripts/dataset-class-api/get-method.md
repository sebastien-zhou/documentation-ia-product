---
layout: page
title: "Get method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 6
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/get-method/
---
---

Retrieves an attribute by its name.  

**Signature:**   

- get(name): Attribute   

**Return value:**   

- The attribute or null if no attribute corresponds to the name sent as a parameter

**Parameters:**    

- name: String Name of the attribute sought.

**Example call:**   

```
var attr = dataset.get("myAttribute");

if (attr == null) {
  print("The attribute 'myAttribute' does not exist in the dataset");
}
```
