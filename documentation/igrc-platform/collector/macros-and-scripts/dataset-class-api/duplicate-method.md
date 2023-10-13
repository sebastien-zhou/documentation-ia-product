---
layout: page
title: "Duplicate method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 4
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/duplicate-method/
---
---

Duplicates an attribute present in the dataset under a new name.
The new name must be unique. The set of values is duplicated so that the two do not share any attribute value. Note that both attributes are now considered different by the equals method because of their name.  

**Signature:**   

- duplicate(oldName, newName): Attribute

**Return value:**   

- The duplicated attribute or null if the duplication failed

**Parameters:**   

- oldName: String. Name of attribute to be duplicated.
- newName: String. New name of duplicated attribute.

**Example call:**   

```
var newAttr = dataset.duplicate("old", "new");

if (newAttr == null) {
  print("Error: the dataset does not contain the attribute 'old' or
  it already contains an attribute 'new'");
}
```
