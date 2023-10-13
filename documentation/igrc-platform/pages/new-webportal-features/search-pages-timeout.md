---
layout: page
title: "How to add a timeout to Search Pages"
parent: "New Webportal Features"
grand_parent: "Pages"
nav_order: 11
permalink: /docs/igrc-platform/pages/new-webportal-features/how-to-add-timeout/
---
---

**_Version_**: 2015 R2 SP6 and upwards

In version 2015 of brainwave the webportal it is possible to create your own search rules.  
The effect is, that depending on the data collected, the execution of these search rules can take significant amounts of time before returning a result. During this time your navigator is frozen.   

In order to avoid these delays a timeout has been positioned.   

To configure the timeout you need to add to the following parameters to the source view of your technical configuration between the `<WebPortal></WebPortal>` tags, the property value is provided in seconds :   

```xml
<Property name="dataset.search.short-timeout" propertyvalue="15"/>
<Property name="dataset.search.long-timeout" propertyvalue="30"/>
```

- `dataset.search.short-timeout` corresponds to a first message. In this case after 15s a message will ask the user if he would like to continue or abandon the search
- `dataset.search.long-timeout` corresponds to the amount of time after which the search is aborted.

> **Note**: If the user decides to continue the search, then the webportal will re-execute it from scratch. As such it is required to increase the value of `dataset.search.long-timeout` in comparison to `dataset.search.short-timeout`.  
