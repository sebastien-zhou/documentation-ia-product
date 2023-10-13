---
layout: page
title: "Source : Start"
parent: "Components : Sources"
grand_parent: "Components"
nav_order: 5
permalink: /docs/igrc-platform/collector/components/sources/start/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

The Start component is used to start a collector line without necessarily having a data source, it is useful when using collection sequences.   

Example: to create model object, such as repositories, applications and so on, that are based on data declared in the project or in a silo and not in import files.  

# The properties Tab

## Source

In this sub-tab you can see/modify general parameters of the component. You will find:

- The "_Identifier"_ shown in Debug mode for example
- The _"Display name_" for the discovery source
- The "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Start source](igrc-platform/collector/components/sources/start/images/start_source.png "Start source")

## Description

Allows the addition of comments regarding actions done by this source component.

![Description](igrc-platform/collector/components/sources/start/images/description.png "Description")

## Configuration

In this section you can override the values of variables used in the collector line.

![Configuration](igrc-platform/collector/components/sources/start/images/config.png "Configuration")

## Request

_SQL syntax request_: is an sql-like select query to filter source records.

The query may check values from current record by using dataset variable as if it was a table.

For example, `SELECT * FROM dataset WHERE dataset.hrcode <> 'VIP'` keeps only records which have a HR code attribute with a value different from 'VIP'.

![Request](igrc-platform/collector/components/sources/start/images/request.png "Request")

## Sort

In this section you can configure a multi-criteria sort. You will find:

- Sort number 1 (main sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 2 (Second sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 3 (Third sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  

The sort direction can also be changed (A-Z for ascending or Z-A for descending).

![Sort](igrc-platform/collector/components/sources/start/images/sort.png "Sort")

## Limits

In this section you can configure a limitation on the selected records from the source, You will find:

- Skip the <u>_nb_</u> first records: Used to select a subset of the records by skipping the first records.  
- Select a maximum of <u>_max_</u> records: Used to select a subset of the records by reading only a specified number of records.

![Limits](igrc-platform/collector/components/sources/start/images/limits.png "Limits")

# Best practices

You may have a performance issue when using a limit and/or a sort.
