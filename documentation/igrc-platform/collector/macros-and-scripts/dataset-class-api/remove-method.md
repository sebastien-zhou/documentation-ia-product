---
layout: page
title: "Remove method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 7
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/remove-method/
---
---

Deletes an attribute from the dataset by its name.  

**Signature:**   

- remove(name): Attribute

**Return value:**   

- The deleted attribute, or null if the deletion failed

**Parameters:**    

- name: String Name of the attribute to delete.

**Example call:**    

```
var attr = dataset.remove("myAttribute");

if (attr == null) {
  print("The attribute 'myAttribute' does not exist in the dataset");
}
```
