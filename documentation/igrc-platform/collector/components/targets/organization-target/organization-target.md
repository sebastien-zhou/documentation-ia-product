---
layout: page
title: "Organization target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 2
permalink: /docs/igrc-platform/collector/components/targets/organisation-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

With this target you will add organizations to the Ledger

# Prerequisites

## Dependencies

Not applicable  

# Procedure

When editing a collect, select _Organization target_ in _Ledger targets_ (previously DataSet targets).  

![Organisation target](images/organisation-target.png "Organisation target")

# Properties

## Target

In this property you can see/modify general parameters of the component. You will find:

- the "_Identifier"_ shown in Debug mode for example
- _the "Display name_" for the _Organization target_   
- the "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Target](images/02_target.png "Target")

## Description

Comment regarding actions done by this component.

![Description](images/03_description.png "Description")

## Organization

With this property, you will define product behaviour when importing organization such as:   

- _"Attribute containing code"_ must contain the unique identifier for the organization to add.  
- _"Trigger an error if organization code is null or empty"_ option you can activate an event that will be generated when the attribute containing organization code is null or empty (event shown in dedicated logs).

## Parameters

With this property you will define mapping between attributes (from dataset) and organization properties (Ledger).   

_Field_ contains organization attribute available in Ledger, _Attribute_ contains organization attribute in data set.   

Available fields are :

- displayname
- organisationType (must exist in reference tables : see dedicated page
- shortname
- custom field 1--\>9
- reference type 1 --\> 9
- reference value 1 --\> 9

![Parameters](images/04_parameters.png "Parameters")

## Parent links

With this property you will define elements that enable product to build organizational model (hierarchical, financial,..). The below options are configured with respect of:

- _"Parent organization link attribute_" must contain identifier of the parent organization. Parent organization has not to be already in database.
- _"Parent link type(s) attribute"_ must contain the link type between organizations. Most of the time, the link type is hierarchical. Link type must exist in reference tables and this can be done within this property.  

Product behaviour can as well be defined "_If the parent link does not exist_" in database. You can choose between "_Do nothing_", "_Trigger an error_" while choosing the event that will be generated or "_Create parent link type in the database_".

![Parent links](images/05_parent_links.PNG "Parent links")

Note that parent links are effectively resolved during activation, so that no event will be generated in the collect phase if the parent does not exist.  

# Example

Example of file, discovery and collect of organization target are provided in below attachment.  

# Known limitations

Not applicable.  
