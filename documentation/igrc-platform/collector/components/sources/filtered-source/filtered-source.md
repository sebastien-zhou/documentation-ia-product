---
layout: page
title: "Source : Filtered source (discovery)"
parent: "Components : Sources"
grand_parent: "Components"
nav_order: 2
permalink: /docs/igrc-platform/collector/components/sources/filtered-source/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

The Filtered discovery source allows the product to read data that will be filtered by an existing discovery.   
This is the main source type to use when building your collector lines as the modification of the input data is done in the the discovery file, and the collector line can they simple be used to map the various imported data to the concepts of Brainwave GRC's model.  

# The properties Tab

## Source

In this property you can see/modify general parameters of the component. You will find:

- The "_Identifier"_ shown in Debug mode for example
- The _"Display name_" for the discovery source
- _Discovery file:_ the discovery file to use as a data source
- _Data file_ is the absolute path of data file to load. This parameter allow the use of macros such as `{config.projectPath}`. This parameter is optional, and if empty then the file defined in the discovery file is used.  
- The "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Filtered discovery source](igrc-platform/collector/components/sources/filtered-source/images/filtered_discovery_source.png "Filtered discovery source")

## Description

This property allows adding comment regarding actions done by this component.

![Filtered discovery source description](igrc-platform/collector/components/sources/filtered-source/images/filtered_discovery_source_description.png "Filtered discovery source description")

## Request

_SQL syntax request_: is an sql-like select query to filter source records.

The query may check values from current record by using dataset variable as if it was a table.

For example, `SELECT * FROM dataset WHERE dataset.hrcode <> 'VIP'` keeps only records which have a HR code attribute with a value different from 'VIP'.

![Filtered discovery source request](igrc-platform/collector/components/sources/filtered-source/images/filtered_discovery_source_request.png "Filtered discovery source request")

## Sort

In this section you can configure a multi-criteria sort. You will find:   

- _Sort number 1_ (main sort criteria): is attribute name used to sort all source records before delivering them to the collector line in the right order.  
- _Sort number 2_ (Second sort criteria): is attribute name used to sort all source records before delivering them to the collector line in the right order.  
- _Sort number 3_ (Third sort criteria): is attribute name used to sort all source records before delivering them to the collector line in the right order.  

The sort direction can also be changed (A-Z for ascending or Z-A for descending).

![Filtered discovery source sort](igrc-platform/collector/components/sources/filtered-source/images/filtered_discovery_source_sort.png "Filtered discovery source sort")

## Limits

In this section you can configure a limitation on the selected records from the source, You will find:

- _"Skip the <u>nb</u> first records"_: Used to select a subset of the records by skipping the first records.  
- _"Select a maximum of <u>max</u> records"_: Used to select a subset of the records by reading only a specified number of records.

![Filtered discovery source limit](igrc-platform/collector/components/sources/filtered-source/images/filtered_discovery_source_limit.png "Filtered discovery source limit")

## Constraints

In this section you can define contraintes to not use the file, You will find:

- _"If file size is less than <u>size</u> kilo bytes_": Triggers an exception and stops collector line if the source file size is less than a specified number of kilo-bytes. Used to prevent from reading an incomplete file in automatic mode because of an error during a file transfer for example.  

- _"If last modification date is older than <u>modifDate</u> hour(s)_": Triggers an exception and stops collector line if the source file last modification date is older than a specified number of hours. Used to prevent from reading an obsolete file in automatic mode because of an error during the export process for example.  

- _"If a column is missing in the file"_: Triggers an exception and stops collector line if the file schema is diferent from the schema defined in the source component. Used to prevent from reading a file with a bad format in automatic mode because of a format or layout change in the exported data for example.

![Filtered discovery source constraints](igrc-platform/collector/components/sources/filtered-source/images/filtered_discovery_source_constraints.png "Filtered discovery source constraints")

# Best practices

You may have a performance issue when using a limit and/or a sort.  
