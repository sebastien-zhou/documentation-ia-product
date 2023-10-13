---
layout: page
title: "IsEmpty method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 9
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/isempty-method/
---
---

Verifies if the attribute contains a non-empty value   

**Signature:**   

- `isEmpty(name_or_attribute): Boolean`

**Return value:**   

- `true` if the attribute contains at least non-empty value

**Parameters:**    

- name\_or\_attribute: String or Attribute. Name of the attribute or Attribute type object.

**Example call:**   

```
var vide = dataset.isEmpty("myAttribute");

if (vide) {
  print("The attribute 'myAttribute' of the dataset is empty");
}
```
