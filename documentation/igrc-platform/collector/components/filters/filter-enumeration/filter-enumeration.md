---
layout: page
title: "Enumeration filter"
parent: "Components : Filters"
grand_parent: "Components"
nav_order: 2
permalink: /docs/igrc-platform/collector/components/filter/enumeration-filter/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

Filtrer enumerate component is used to iterate on multivalued attributes.   
It is helpful when you have aggregate data in data source file and you need to enumerate before collecting this data in brainwave database.  

# The properties Tab

## Filter

In this section you can see/modify general parameters of the component. You will find:

- the "_Identifier"_ shown in Debug mode for example
- _the "Display name_" for the _discovery source_
- _the "Follow just one link" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed._

![Enumeration](igrc-platform/collector/components/filters/filter-enumeration/images/enumerate_2018-04-04_18_55_10-.png "Enumeration")

## Description

Comment regarding actions done by this component.

![Description](igrc-platform/collector/components/filters/filter-enumeration/images/enumerate_2018-04-04_18_54_59-.png "Description")

## Enumeration

In this section you have to choose multivalued attributes that the component will iterate on, you can also specify if you like to iterate on duplicate values or not.

![Enumeration](igrc-platform/collector/components/filters/filter-enumeration/images/2018-04-05_12_13_54-.png "Enumeration")


**<u>Example with iterating on several multivalued attributes:</u>**  

Let suppose that the enumeration component will receive the following dataset.   

| Login | Name | Domain | Localization |
|  UA12B \| UA15C \| UA19K |  Mark \| Aldo | Alta.local | France |

_"Login_" is a multivalued attribute having 3 elements.  
_"Name"_ is a multivalued attribute having 2 elements.  
_"Domain"_ is a monovalued attribute (1 element).  
_"Localization"_ is a monovalued attribute (1 element).  

In the _"Enumeration"_ section we will put _"Login"_ and _"Name"_ attributes in "_Attribute to enumerate values_" table.   

In this case enumeration component will iterate three times, three is the size of biggest multivalued attribute, in this example it is Login attribute.   
The enumeration will send to the next component three separated dataset as below.  

Dataset1  

| UA12B | Mark | Alta.local | France |

Dataset2  

| UA15C | Aldo |  Alta.local | France |

Dataset3  

| UA19K |  |  Alta.local | France |
