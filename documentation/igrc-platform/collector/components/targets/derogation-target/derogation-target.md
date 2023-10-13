---
layout: page
title: "Derogation target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 25
permalink: /docs/igrc-platform/collector/components/derogation-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This component allow to create a derogation between an identity and a permission in the **theoretical rights** context.  
For the same concept in regards to **control discrepancies**, see [exceptions]({{site.baseurl}}{% link docs/igrc-platform/workflow/exception-management.md %}).  

# The properties Tab

## Target

In this section you can see/modify general parameters of the component. You will find:
- the "_Identifier"_ shown in Debug mode for example
- _the "Display name_" for the _collector line source_
- the "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/derogation-target/images/derogation_2018-04-05_16_25_33-.png "Target")

## Description

Comment regarding this route component.

![Description]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/derogation-target/images/derogation_2018-04-05_16_26_08-.png "Description")

## Derogation

In this section you will find:

_"Attribute containing permission"_: here you have to map an attribute that containing the permission code (mandatory, mono-valued)   

_"Attribute containing application"_: here you need to map an attribute that contain an application code of the permission (mandatory, mono-valued)

![Derogation]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/derogation-target/images/derogation_2018-04-05_16_26_22-.png "Derogation")

## Parameters

In this section you have to map derogation parameters, somme parameters are mandatory(issuername, validfromfate).  

![Parameters]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/derogation-target/images/derogation_2018-04-05_16_26_37-.png "Parameters")

## User

In this section you have to map the attribute who hold the HR code of the identity.   

you can also configure event if identity is not foud or several identities match

![User]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/derogation-target/images/derogation_2018-04-05_16_26_50-.png "User")

## Resolution

In this section you can map optional attributes that will be used to find the identity if no HRcode is provided.

Example: mail, full name,...   

![Resolution]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/derogation-target/images/derogation_2018-04-05_16_27_03-.png "Resolution")

# Error handling

If permission cannot be found in the import tables, the creation of derogation object is silently cancelled and a line is written to the log file:  
```
No writing of derogation because the permission (...)
contains an unknown value in the databasein the database
```

If one of the key attributes (application or permission) is empty, the creation of this derogation object is silently cancelled and a line is written to the log file:
```
No writing of derogation because one of the key attributes
is empty or missing in the target component configuration
```
