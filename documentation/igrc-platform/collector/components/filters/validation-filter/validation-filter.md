---
layout: page
title: "Validation filter"
parent: "Components : Filters"
grand_parent: "Components"
nav_order: 8
permalink: /docs/igrc-platform/collector/components/filter/validation-filter/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This filter component allows to add validation rules to some dataset. When one of these rules fails for a dataset, it will be possible to emit an event (but will still pass the filter).

# The properties Tab

## Filter

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Validation filter_
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Validate filter]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/validation-filter/images/valid1.png "Validate filter")

## Description

This property allows adding comment regarding actions done by this component.  

![Validate filter2]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/validation-filter/images/valid2.png "Validate filter2")

## Mandatory

This property allows to specify that some given attributes of the dataset must be present and not empty.  

![Validate filter3]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/validation-filter/images/valid3.png "Validate filter3")   

An attribute can be added with the following dialog:  

![Dialog]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/validation-filter/images/valid-dlg1.png "Dialog")   
Here you specify which attribute must not be empty, the name of the event (will default to "_error_" if not specified) and if the event should appear in the event file or not.  

## Syntax

This property allows to specify that some attributes must match some regular expressions.  

![Validate filter4]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/validation-filter/images/valid4.png "Validate filter4")   

A condition can be added with the following dialog:  

![Dialog2]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/validation-filter/images/valid-dlg2.png "Dialog2")      
Here you specify the attribute, the regular expression it must match, the name of the event (will default to "_error_" if not specified) and if the event should appear in the event file or not.   
The field _Sample value_ can be used to test the regular expression.  

## Uniqueness

In this property, you can specify up to 3 attributes whose values must be unique among the source.  

![Validate filter5]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/validation-filter/images/valid5.png "Validate filter5")      
You can also indicate the name of the event (will default to "_error_" if not specified) and if the event should appear in the event file or not.  

## Condition

Here you can specify a condition on the dataset as a JavaScript function returning a boolean.  

![Validate filter6]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/validation-filter/images/valid6.png "Validate filter6")      

Validation Function is the name of a JavaScript function written in the .javascript file associated with this collector line.   
You can also indicate the name of the event (will default to "_error_" if not specified) and if the event should appear in the event file or not.  

## Multiplicity

Using this property, you can specify a maximum or minimum number of records propagated by this filter.  

![Validate filter7]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/validation-filter/images/valid7.png "Validate filter7")      
