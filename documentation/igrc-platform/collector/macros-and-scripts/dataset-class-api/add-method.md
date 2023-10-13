---
layout: page
title: "Add method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 3
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/add-method/
---

---

Adds an attribute in the dataset. The dataset does not accept duplicate attribute names. If an attribute with the same name already exists, the operation fails. To replace an attribute with the same name, you must first delete the data set with the `remove` method. The `add` method accepts either an `Attribute` type object or an attribute name. In the case of a call with an attribute name, the attribute will be created with the type declared in the pattern. If the pattern does not know the name, the created attribute is a `String` type, and single-valued. To change these characteristics, it is possible to pass two additional parameters.   

**Signature** :   

- add(name\_or\_attribute, [type], [multivalued]): Attribute

**Return value** :   

- The attribute added or null if the add failed

**Parameters** :   

- `name_or_attribute`: `Attribute` or `String.
                `Name of the attribute or `Attribute` type object. If this parameter is a string, two additional parameters can specify the type and whether the attribute is multivalued.
- `type`: `String` (optional) Attribute type (`String, Boolean,
                Number` or `Date`). Ignored if the parameter name\_or\_attribute is an `Attribute` type.
- `multivalued: Boolean` (optional). Indicates whether the attribute to be created should be multivalued. Ignored if the parameter name\_or\_attribute is an `Attribute` type.   

**Example call** :

```
var attr = new Attribute("myAttribute", "String", false);

attr.set("Paul");
dataset.add(attr);
```
