---
layout: page
title: "Identity target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 1
permalink: /docs/igrc-platform/collector/components/targets/identity/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

With this target you will add identities to the Ledger  

# Prerequisites

## Dependencies

Not applicable  

# Procedure

When editing a collect, select _Identity target_ in the _Ledger targets_ (previously _Data set targets_).  

![Identity target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/identity-target/images/2016-07-07_15_19_18-iGRC_Properties_-_demo_collectors_demo_040.Contractors.collector_-_iGRC_Analytic.png "Identity target")

# Properties

## Target

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Identity target_
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Target property]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/identity-target/images/02_target_property.png "Target property")

## Description

This property allows adding comment regarding actions done by this component.

![Description property]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/identity-target/images/03_description_property.png "Description property")

## Data source

In this property, you select the attribute name that contains the repository key. This repository will hold added identities. Note that the mentioned repository must exist in database.

![Data source]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/identity-target/images/04_data_source.png "Data source")

## Identity

With this property, you will define product behaviour when importing identity such as:

- _"Attribute containing HR code"_ option which must contain the unique identifier for the identity to add if available.  
- _"Trigger an error if HR code is nul or empty"_ option with which you can activate an event that will be generated when the attribute containing HR code is null or empty (event shown in dedicated logs).
- _"Trigger an error if several identities match when no HR code is given"_ option to activate an event that will be generated when several identities are found in database. If no HR code is given, the product use identity parameters (described in below section) with a _key_ flag positionned to True to search an existing identity in order to keep the same _uid_ (unique and intemporal identifier) between timeslots.
- _"Do not create identities who left the company if they exist in a previous timeslot"_ is the last option you should use if both conditions are achieved: the current and archived identities are always available in extracted files and archived identities are not filtered in Discovery.

![Identity target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/identity-target/images/Identity_target3.png "Identity target")

## Parameters

This property allows you to define mapping between attributes from dataset and identity properties (Ledger). The available columns include "_Field_", "_Attribute_", "_Key_" and "_Override_".   

- _"Field_" contains identity attribute available in Ledger
- _"Attribute"_ contains identity attribute in data set
-  _"Key"_ is used to fetch identity in database if none HR code is available (for example you can use surname and givenname to define a matching key)
- _"Override"_ option is used if you want to override the given attribute when several data sets are available for a given identity.    

Available fields are :   

- alternate name
- departure date
- arrival date
- email address
- employee type
- expertise domain
- fullname
- given name
- internal identity flag
- job title (must exist in reference tables to see allocation in Ledger : see dedicated page)
- middle name
- mobile number
- nickname
- organization (must exist in database to see allocation in Ledger : allocation is the combination of job and organization)
- phone number
- surname
- title
- custom 1 --\> 19
- reference type 1 --\> 9
- reference value 1 --\> 9

![Parameters]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/identity-target/images/05_parameters.png "Parameters")

## Manager

Here you can indicate wich attribute contains direct manager HR code. You can also select two behaviours:   

- _Trigger an error if the identity is not found_ and indicate the event display name.
- _Trigger an error if several identities match_ and indicate the event display name.

![Manager]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/identity-target/images/06_manager.png "Manager")

If manager HR code is not available (but you can access other manager attribute like mail, fullname,...) you can use the property below (_cf. Resolution section_)

## Resolution

Here you can select attributes that will fetch direct manager for the import identity if HR code is not available.

![Resolution]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/identity-target/images/07_resolution.png "Resolution")

# Example

Example of file, discovery and collect of identity target are provided in attachments below.  

# Known limitations

Not applicable
