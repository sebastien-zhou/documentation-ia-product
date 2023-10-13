---
layout: page
title: "GetEvents method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 16
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/getevents-method/
---
---

Retrieves the list of events.    

**Signature:**   

- getEvents(): Array   

**Return value:**   

- A table containing the events   

**Parameters:**   

- none   

**Example call:**   

```
var events = dataset.getEvents();
if (events != null) {
    for (var event in events) {
    print("Event " + event + " detected");
    }
}
```
