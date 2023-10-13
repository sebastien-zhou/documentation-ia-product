---
layout: page
title: "HasEvent method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 13
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/hasevent-method/
---
---

Verifies the presence of an event in the list   

**Signature:**   

- hasEvent(name): Boolean    

**Return value:**   

- true if the event is present in the list   

**Parameters:**    

- name: String Name of the event to verify.   

**Example call:**   

```
var EmptyUniqueID = dataset.hasEvent("no unique ID");

if (EmptyUniqueID) {
  print("Error: Identity has no unique ID");
}
```
