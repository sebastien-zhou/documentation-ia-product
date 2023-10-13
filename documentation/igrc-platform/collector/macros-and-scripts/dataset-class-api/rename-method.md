---
layout: page
title: "Rename method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 8
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/rename-method/
---
---

Renames an attribute. The new name must be unique.  

**Signature:**   

- `rename(oldName, newName): Attribute`

**Return value:**   

- The renamed attribute or null if the renaming failed

**Parameters:**    

- oldName: String Name of the attribute to rename.
- newName: String New attribute name.

**Example call:**    

```
var attr = dataset.rename("old", "new");

if (attr == null) {
  print("Error: the dataset does not contain the attribute 'old' or
  it already contains an attribute 'new'");
}
```
