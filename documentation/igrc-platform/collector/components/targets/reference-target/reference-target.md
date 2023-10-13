---
layout: page
title: "Reference target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 11
permalink: /docs/igrc-platform/collector/components/targets/reference-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

With this target you will add reference values to the Ledger

# Prerequisites

## Dependencies

Not applicable  

# Procedure

When editing a collect, select _Reference target_ in _Ledger targets_ (previously DataSet targets).  

![Reference target](igrc-platform/collector/components/targets/reference-target/images/reference-target.PNG "Reference target")

# Properties

## Target

In this property you can see/modify general parameters of the component. You will find:

- the "_Identifier_" shown in Debug mode for example
- the "_Display name_" for the _Reference target_  
- the "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Reference target properties](igrc-platform/collector/components/targets/reference-target/images/reference-target_properties_target.PNG "Reference target properties")

## Description

Comment regarding actions done by this component

![Reference target description](igrc-platform/collector/components/targets/reference-target/images/reference-target_properties_description.PNG "Reference target description")

## Title

Here you can add values referering to _title_ to the Ledger.   

When activated you will have to provide an attribute containing the _title_ code and an attribute containing the _title_ displayname.   

Also you can activate an option that triggers an error if the title is _null_ or _empty._   

![Reference target title](igrc-platform/collector/components/targets/reference-target/images/reference-target_properties_title.PNG "Reference target title")

## Employee type

Here you can add values referering to _employee type_ to the Ledger   

When activated you will have to provide an attribute containing the _employee type_ code and an attribute containing the _employee type_ displayname.   

Also you can activate an option that triggers an error if the _employee type_ is _null_ or _empty._   

![Reference target  employee type](igrc-platform/collector/components/targets/reference-target/images/reference-target_properties_employee_type.PNG "Reference target employee type")

## Job title

Here you can add values referering to _job title_ to the Ledger.   

When activated you will have to provide an attribute containing the _job title_ code and an attribute containing the _job title_ displayname.   

Also you can activate an option that triggers an error if the _job title_ is _null_ or _empty._   

## Expertise domain

Here you can add values referering to _expertise domain_ to the Ledger.

When activated you will have to provide an attribute containing the _expertise domain_ code and an attribute containing the _expertise domain_ displayname.   

Also you can activate an option that triggers an error if the _expertise domain_ is _null_ or _empty._   

![Reference target domain](igrc-platform/collector/components/targets/reference-target/images/reference-target_properties_expertise_domain.PNG "Reference target domain")

## Organization type

Here you can add values referering to _organization type_ to the Ledger.   

When activated you will have to provide an attribute containing the _organization type_ code and an attribute containing the _organization type_ displayname.   

Also you can activate an option that triggers an error if the _organization type_ is _null_ or _empty._

![Reference target Organization type](igrc-platform/collector/components/targets/reference-target/images/reference-target_organization_type.PNG "Reference target Organization type")

## Organization link type

Here you can add values referering to _organization link type_ to the Ledger.

When activated you will have to provide an attribute containing the _organization link type_ code and an attribute containing the _organization link type_ displayname.   

Also you can activate an option that triggers an error if the _organization link type_ is _null_ or _empty._

![Reference target organization link type](igrc-platform/collector/components/targets/reference-target/images/reference-target_organization_link_type.PNG "Reference target organization link type")

## Asset category  

Here you can add values referering to _asset category_ to the Ledger.

When activated you will have to provide an attribute containing the _asset_ _category_ code and an attribute containing the _asset_ _category_ displayname.   

Also you can activate an option that triggers an error if the _asset_ _category_ is _null_ or _empty._   

![Reference target asset category](igrc-platform/collector/components/targets/reference-target/images/reference-target_properties_asset_category.PNG "Reference target asset category")

## Reference type

If none of the above reference category meet needs of your project, you can add new reference type and value to the Ledger.   

When activated you will have to provide an attribute containing the _reference type_ code and an attribute containing the _reference type_ displayname.   

Also you can activate an option that triggers an error if the _reference type_ is _null_ or _empty._   

![Reference target reference type](igrc-platform/collector/components/targets/reference-target/images/reference-target_properties_reference_type.PNG "Reference target reference type")

## Reference value

When activated you will have to provide an attribute containing the _reference value_ code, the attribute containing the _reference type code_ and an attribute containing the _reference value_ displayname.

Also you can activate an option that triggers an error if the _reference value_ is _null_ or _empty._    

![Reference target reference value](igrc-platform/collector/components/targets/reference-target/images/reference-target_properties_reference_value.PNG "Reference target reference value")

# Example

Example of collect of reference target is provided in below attachment.

# Known limitations

Not applicable  
