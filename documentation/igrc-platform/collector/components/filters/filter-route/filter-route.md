---
layout: page
title: "Route filter"
parent: "Components : Filters"
grand_parent: "Components"
nav_order: 5
permalink: /docs/igrc-platform/collector/components/filter/route-filter/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage
The route component does nothing, but it allows to add an ending point to follow the dataset content returned by the source collector line.

# The properties Tab

## Filter

In this section you can see/modify general parameters of the component. You will find:

- the "_Identifier"_ shown in Debug mode for example
- _the "Display name_" for the _collector line source_
- the "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Filter]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/filter-route/images/Route_2018-04-04_15_46_35-.png "Filter")

## Description

Comment regarding this route component.

![Description]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/filter-route/images/Route_2018-04-04_15_46_49-.png "Description")

## Events  

In this section you can configure the route component to trigger an event each time a dataset is transmitted and forward that event to the next component if desired  

![Events]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/filter-route/images/Route_2018-04-04_15_47_02-.png "Events")
