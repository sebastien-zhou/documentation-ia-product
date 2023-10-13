---
layout: page
title: "Source : Script source"
parent: "Components : Sources"
grand_parent: "Components"
nav_order: 3
permalink: /docs/igrc-platform/collector/components/sources/script-source/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This source can be used to programmatically generate datasets from JavaScript functions. It can be used to access external resources or parse files whose format is not supported by the discovery source.  

# The properties Tab

## Source

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Support target_
- _File to analyze_ is an optional path to a file  
- _onScriptInit_ is the initialization JavaScript function. It can take a parameter which will be the file specified just above. It is called only once per collect line  
- _onScriptReset_ is a function which will only be called if this component is the secondary source of a join filter having its cache disabled. In this case, it will be called once for each record of the main source  
- _onScriptRead_ is the function which will be called to get the next record. It can manipulate the dataset, adding or removing attributes, changing values. It must return true if there are more records to read, false otherwise  
- _onScriptTerminate_ is the function called when the collect line ends successfully  
- _onScriptDispose_ is the function called at the end of the collect line. It is always called, whether the line ends successfully or not, and should be used to free all the resources allocated during the initialization phase (close files, database connections and so on)  
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Script source1]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/script-source/images/script_src1.png "Script source1")   
Note that all the _onScript..._ functions are optional.  

# Description

This property allows adding comment regarding actions done by this component.

![Script source2]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/script-source/images/script_src2.png "Script source2")

## Attributes

This property can be used to declare additional attributes to include in the collect line schema, for example when attributes are injected to the dataset by the JavaScript read function.

![Script source3]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/script-source/images/script_src3.png "Script source3")

## Request

_SQL syntax request_: is an sql-like select query to filter source records.   

The query may check values from current record by using dataset variable as if it was a table.   

For example, `SELECT * FROM dataset WHERE dataset.hrcode <> 'VIP'` keeps only records which have a HR code attribute with a value different from 'VIP'.

![Script source4]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/script-source/images/script_src4.png "Script source4")

## Sort

In this section you can configure a multi-criteria sort. You will find:

- _Sort number 1_ (main sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- _Sort number 2_ (Second sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- _Sort number 3_ (Third sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  

The sort direction can also be changed (A-Z for ascending or Z-A for descending).

![Script source5]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/script-source/images/script_src5.png "Script source5")

## Limits

In this section you can configure a limitation on the selected records from the source, You will find:

- Skip the <u>_nb_</u> first records: Used to select a subset of the records by skipping the first records.  
- Select a maximum of <u>_max_</u> records: Used to select a subset of the records by reading only a specified number of records.

![Script source6]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/script-source/images/script_src6.png "Script source6")

# Best practices

This source should only be used in very specific cases where a discovery source is not suitable. These include (but are not limited to) external resources such as a REST API, a database connection or some "flat" XML files.

In the other cases, a filtered source (discovery) will be much more efficient and maintainable.

# Error handling  

Any exception raised during the execution of one of the JavaScript functions will cause the collect engine to stop. The exception is logged in the collect log file.  
