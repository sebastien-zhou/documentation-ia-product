---
layout: page
title: "Properties corresponding to the pattern"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 1
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/properties/
---
---

All the attributes of the dataset are available in the form of properties. This allows syntax like `dataset.attribute` as shown in the following example for the _first\_name_ attribute:   

`var attr =dataset.first_name;`

Note that the returned value is an `Attribute`type object, not the value of the attribute. So to retrieve the first name, you must use the `get`method like this:
```
var attr = dataset.first_name;

if (attr != null) {
  print(attr.get());

```

| **Important** <br><br> If the attribute does not exist in the dataset, the value returned is `null`. It is therefore necessary to test whether the returned value is a valid attribute (not null) before using the `get` method.|   

Properties are read- and write-accessible. In write mode, the attribute is replaced by the new attribute. If the attribute does not exist in the dataset, it is added. The following example shows how to add a new single-valued `String` type attribute to the data set:   
```
var attr = new Attribute("myAttribute", "String", false);

attr.set("Paul");
dataset.myAttribute = attr;
```

The first line creates a new attribute called _myAttribute_ but which is not yet added to the dataset. The second line sets the value of the attribute. The third line adds the attribute to the dataset. Note that the attribute name is repeated in the third line. This syntax allows you to replace or add an attribute regardless of whether the dataset contained an attribute with the same name or not.   

Syntax using the `dataset` APIs allows you to obtain the same result, as shown in the following code:   
```
var attr = new Attribute("myAttribute", "String", false);

attr.set("Paul");
dataset.remove("myAttribute");
dataset.add(attr);
```

The `add` method of the `dataset` object adds an attribute to the dataset only if it does not already exist. You must therefore remove the attribute with the `remove` method before adding it to process a replacement.    

It is also possible to add or replace an attribute by just providing a value, like this:   

`dataset.myAttribute = "Paul";`

Note that this is only a shortcut. In reality, the value is not added directly to the dataset. An attribute is created with the name `myAttribute`, then the value is stored in the attribute, then the attribute is added to the dataset.
