---
layout: page
title: "Technical events"
parent: "Events"
grand_parent: "Logs"
nav_order: 1
permalink: /docs/igrc-platform/collector/collector-engine-operations/logs/events/technical-events/
---

In some situation the designer of the data collection line will need to generate technical events that will be used as path conditions. In this case an option has been added to allow the desinger to mark these events as technical and  avoid saving them in event the files. This action will reduce the logs I/O and it will allow you to optimize the data loading time.  

![Technical events](../images/tech_events_2.png "Technical events")   

To set an event as technical open the **Configuration** tab of the collect line where you defined your event and add the event code in **Technical events list** text field, if you have more than one event you have to separate them by comma.

![Technical events](../images/tech_events_1.png "Technical events")   




