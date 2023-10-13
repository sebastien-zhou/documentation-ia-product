---
layout: page
title: "Group filter"
parent: "Components : Filters"
grand_parent: "Components"
nav_order: 3
permalink: /docs/igrc-platform/collector/components/filter/group-filter/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

The data grouping component is useful for gathering several values that were initially separated into several different records in a multivalued attribute. For example, a sharepoint group extraction can provide a CSV file with one line per group member. If a sharepoint group has several members, the group appears on multiple lines with all the information repeated and a different member on each line. To reconstitute a single dataset with a multivalued attribute member from multiple CSV records, you must use the grouping component.   

The grouping component works by detecting ruptures. An expression based on the content of the dataset is set in the component in order to allow it, during the execution of the collector line, to determine when a rupture occurs. In the example with the job, the rupture is when first name and last name change. In this case, enter the expression as follows:  
{ dataset.GroupID.get() }  

![Sharepoint group](igrc-platform/collector/components/filters/filter-group/images/2018-04-06_17_15_03-sharepoint-Groups.csv_-_Excel.png "Sharepoint group")

For each dataset arriving in the grouping component, the expression is evaluated. If the result is different from the result of the expression in the previous dataset, this means that the new dataset relates to a different group, otherwise the dataset completes the previous dataset as it is for the same group(same Group ID). This detection is called rupture detection.     

The algorithm used to group the attribute values is as follows:   

-  For each dataset received by the component
> -  Calculate the rupture expression
> -  If no break is detected (same group in the above example)
>> -  Aggregation of values of this new dataset (member attribute in the example) in the previous dataset
>> -  Removal the new dataset to send nothing to the following components
> -  Otherwise (new group in the example)
>> -  Emission of the previous dataset towards the following components
>> -  Memorization of the new dataset as a starting point for the attributes aggregation

This mechanism introduces a desynchronization between the datasets received by the component and the datasets issued after grouping the job attribute to the following components. Indeed, while the second dataset arrives in the component group, the group outputs the first dataset to other components, and so on. With this mechanism, when the last dataset is received, the component emits the next-to-last dataset to the following components. It is only when the collector engine goes into the Flushing state that the grouping component can transmit the last dataset which was waiting for rupture detection.  

According to the example the group component will issue the following data sets to next components  

Dataset1  

| SamAccountName  | GroupID |  GroupName |
|  BRAINWAVE\cpion18 \| BRAINWAVE\jtourneu14 \| BRAINWAVE\mheritie10 |  c5142604-7e3c-4cbc-940d0eaad1b35856#1011 | Sales Managers |

Dataset2

|SamAccountName | GroupID |  GroupName |
| BRAINWAVE\jtourneu14 | c5142604-7e3c-4cbc-940d-0eaad1b35856#1012 |Pre-Sales |

# The properties Tab

## Filter

In this section you can see/modify general parameters of the component. You will find:

- the "_Identifier"_ shown in Debug mode for example
- _the "Display name_" for the _discovery source_
- _the "Follow just one link" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed._

![Group filter](igrc-platform/collector/components/filters/filter-group/images/Group_filter.png "Group filter")

## Description

Comment regarding actions done by this component.

![Group filter description](igrc-platform/collector/components/filters/filter-group/images/Group_filter_description.png "Group filter description")

## Criterion

In this section you can specify the expression that will be used to agreggate data

![Group filter criterion](igrc-platform/collector/components/filters/filter-group/images/Group_filter_criterion.png "Group filter criterion")

## Aggregation

In this section you have to choose attributes where values will be grouped, attributes chosen must be multivalued.

![Group filter aggregation](igrc-platform/collector/components/filters/filter-group/images/Group_filter_aggregation.png "Group filter aggregation")

# Best practices

The data must be sorted by attributes used in the creterion, for example if your creterion is _{dataset.name().get()} + ' ' +dataset.surname().get()}_, you must order your source by name than by surname.  
