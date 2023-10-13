---
layout: page
title: "Source : Collector line source"
parent: "Components : Sources"
grand_parent: "Components"
nav_order: 1
permalink: /docs/igrc-platform/collector/components/sources/collector-line-source/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage  

The collector line source allows the product to read data that will be filtered by an existing collect line.

# The properties Tab

## Source

In this sub-tab it is possible to see/modify general parameters of the component. You will find:

- The "_Identifier"_ shown in Debug mode for example
- The _"Display name_" for the collector line source
- _Collector line:_ collect line to use as a data source
- The "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Collector line source]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/collector-line-source/images/collector_line_source.png "Collector line source")   

## Description

This section allow the configuration of comments regarding actions done by this source component.

![Description]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/collector-line-source/images/description.png "Description")   

## Configuration

This section allows the user to override variables defined in the collector line.

![Configuration]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/collector-line-source/images/config.png "Configuration")   

## Request

_SQL syntax request_: is an sql-like select query to filter source records.

The query may check values from current record by using dataset variable as if it was a table.

For example, `SELECT * FROM dataset WHERE dataset.hrcode <> 'VIP'` keeps only records which have a HR code attribute with a value different from 'VIP'.   

![Request]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/collector-line-source/images/request.png "Request")

## Sort

In this section you can configure a multi-criteria sort. You will find:

- Sort number 1 (main sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 2 (Second sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 3 (Third sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  

The sort direction can also be changed (A-Z for ascending or Z-A for descending).

![Sort]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/collector-line-source/images/sort.png "Sort")

## Limits

In this section you can configure a limitation on the selected records from the source, You will find:

- Skip the <u><i>nb</i></u> first records: Used to select a subset of the records by skipping the first records.  
- Select a maximum of <u><i>max</i></u> records: Used to select a subset of the records by reading only a specified number of records.

![Limits]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/collector-line-source/images/limits.png "Limits")

# Best practices

You may have a performance issue when using a limit and/or a sort.
