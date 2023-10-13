---
layout: page
title: "Script filter"
parent: "Components : Filters"
grand_parent: "Components"
nav_order: 6
permalink: /docs/igrc-platform/collector/components/filter/script-filter/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This source can be used to programmatically update datasets using JavaScript functions.

# The properties Tab

## Filter

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Support target_
- _onScriptInit_ is the initialization JavaScript function. It is called only once per collect line
- _onScriptWrite_ is the function which will be called for each record of the main source. It can manipulate the dataset, adding or removing attributes, changing values
- _onScriptFlush_ is a function which is called when no more record is available from the main source. It must return true if it populated the dataset, false otherwise  
- _onScriptTerminate_ is the function called when the collect line ends successfully  
- _onScriptDispose_ is the function called at the end of the collect line. It is always called, whether the line ends successfully or not, and should be used to free all the resources allocated during the initialization phase (close files, database connections and so on)  
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Script filter 1](igrc-platform/collector/components/filters/script-filter/images/script_filt1.png "Script filter 1")   
Note that all the _onScript..._ functions are optional.

## Description

This property allows adding comment regarding actions done by this component.  

![Script filter 2](igrc-platform/collector/components/filters/script-filter/images/script_filt2.png "Script filter 2")   

## Attributes

This property can be used to declare additional attributes to include in the collect line schema, for example when attributes are injected to the dataset by the JavaScript write function.  

![Script filter 3](igrc-platform/collector/components/filters/script-filter/images/script_filt3.png "Script filter 3")   
