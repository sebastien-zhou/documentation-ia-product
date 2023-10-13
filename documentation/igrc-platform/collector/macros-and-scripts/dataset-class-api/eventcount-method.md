---
layout: page
title: "EventCount method"
parent: "Dataset class API"
grand_parent: "Macros et scripts"
has_children: true
nav_order: 14
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-class-api/eventcount-method/
---
---

Retrieves the number of events present in the list.    

**Signature:**   

- eventCount(): Number   

**Return value:**   

- The number of events in the list   

**Parameters:**   

- none   

**Example call:**     

 ```
 var nb = dataset.eventCount();

 if (nb == 0) {
   print("No event detected");
 }
 ```
