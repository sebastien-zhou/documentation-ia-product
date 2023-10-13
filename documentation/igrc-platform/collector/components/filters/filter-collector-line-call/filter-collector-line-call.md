---
layout: page
title: "Collector line call"
parent: "Components : Filters"
grand_parent: "Components"
nav_order: 1
permalink: /docs/igrc-platform/collector/components/filter/collector-line-call/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

The collector line call componant is used to call another collect line.   
It it useful to reuse generic collect line and simplify the presentation of collect lines  

# The properties Tab

## Filter

In this property you can see/modify general parameters of the component. You will find:

- the "_Identifier"_ shown in Debug mode for example
- _the "Display name_" for the _collector line source_
- _Collector line: collect line to call_
- the "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Filter Collector line call]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/filter-collector-line-call/images/Collector_line_call_2018-04-04_12_00_17-.png "Filter Collector line call")

## Description

Comment regarding actions done by this source component.

![Description Collector line call]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/filter-collector-line-call/images/Collector_line_call_2018-04-04_12_01_10-.png " Description Collector line call")

## Configuration

In this section you can override variables values declared in the collector line that the component will call.

![Configuration Collector line call]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/filter-collector-line-call/images/Collector_line_call_2018-04-04_12_01_28-.png " Configuration Collector line call")
