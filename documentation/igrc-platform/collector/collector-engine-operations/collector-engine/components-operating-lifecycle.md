---
layout: page
title: "Components operating lifecycle"
parent: "Collector engine states and it's components"
grand_parent: "Operation of the collector engine"
nav_order: 1
permalink: /docs/igrc-platform/collector/components-operating-lifecycle/
---
---

The notion of state relates to the collector engine. From the components' point of view, state changes are made evident by notifications sent by the collector engine to the components. The notifications received are identical regardless of the type of component (source, target or filter) except when the collector engine is in the Executing state. In this case, the source receives an OnRead notification while other types of components receive an OnWrite notification. The following table shows the correspondence between the changes of state of the collector engine and notifications received by the components:

|**State of the collector engine**|**Notification of the components**|
|Initialising|onInit|
|Starting|onStart|
|Executing|For each dataset:<br><br>- onRead (main source) <br>- onWrite (other components) until there is no more data at the source|
|Flushing|onFlush|
|Terminating|onTerminate|
|Disposing|onDispose|

In the Executing state, the collector engine sends the OnRead notification to the main source so that it returns a dataset. As long as a dataset is available, the engine loops on the onRead notification to the same main source so it will list the records one by one in the form of datasets. Whenever a dataset is returned by the source, the collector engine sends it progressively to the following components, observing the path drawn by the transitions, through an OnWrite notification. When the main source has no more datasets, the collector engine goes into the Flushing state.
