---
layout: page
title: "Length property"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 2
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/length-property/
---
---

The length property returns the number of attributes present in the dataset. An attribute can be empty or contain one or more values.     
This property may be used to list the attributes of the dataset using a for loop as in the following example:  
    
```javascript
for (var i = 0; i < dataset.length; i++) {
  var attr = dataset.get(i);
  print(attr);
}
```

An easier way to list the attributes of the dataset is to use another variant of the for loop like this:    

```javascript
for (var attr in dataset) {
  print(attr);
}
```
