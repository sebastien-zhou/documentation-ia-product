---
layout: page
title: "Lifecycle when a join is present"
parent: "Collector engine states and it's components"
grand_parent: "Operation of the collector engine"
nav_order: 2
permalink: /docs/igrc-platform/collector/lifecycle-with-join/
---
---

When the collector line contains a join to a secondary source, the kinematics are slightly different. Indeed, whenever the join sees a dataset pass, it asks the secondary source to list all the records. From a notification point of view, the join receives a dataset through the OnWrite notification. It then loops back to sending OnRead notifications to the source in order to retrieve all of the records until there is no more data.   
An additional notification exists to indicate to the source that it should start the list again from the beginning. The onReset notification is sent by the join to the source before each list of records. In the case of a file type source, this allows the source to reposition itself at the beginning of the file when it receives the onReset notification, then to return a record each time it receives the OnRead notification.
