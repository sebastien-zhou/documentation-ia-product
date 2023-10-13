---
layout: page
title: "Usage target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 14
permalink: /docs/igrc-platform/collector/components/targets/usage-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This target allows to register that a given account has used a resource, be it a permission, an application or a project specific tag.  

# The properties Tab

## Target

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Usage target_
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![The properties Tab](igrc-platform/collector/components/targets/usage-target/images/usage1.png "The properties Tab")

## Description

This property allows adding comment regarding actions done by this component.  

![The description Tab](igrc-platform/collector/components/targets/usage-target/images/usage2.png "The description Tab")

## Repository

This tab allows to specify the code of the (account) repository which contains the account specified in the next tab.  

![The Repository Tab](igrc-platform/collector/components/targets/usage-target/images/usage3.png "The Repository Tab")

## Usage

In this tab, you will specify:  

- "_Attribute containing account(s)_" is either the identifier or the login of an account in the repository specified earlier (mandatory, mono-valued),
- "_Attribute containing application_" is the code of an application (optional, mono-valued),
- "_Attribute containing permission_" is the code of a permission (optional, mono-valued), if specified the application must also be specified
- "_Attribute containing aggregate key_" is a project specific key identifying this particular set of usages, for example "Access".

![The Usage Tab](igrc-platform/collector/components/targets/usage-target/images/usage4.png "The Usage Tab")

## Parameters  

This property allows you to define mapping between attributes from dataset and usage properties. The available columns include "_Field_" and "_Attribute_".

- _"Field_" contains identity attribute available in Ledger
- _"Attribute"_ contains identity attribute in data set   

Available fields are :   

- first date
- last date  
- counter
- usage display name  
- custom 1 --\> 9

![The Parameters Tab](igrc-platform/collector/components/targets/usage-target/images/usage5.png "The Parameters Tab")

## User  

When you want to directly rattach an identity to this usage, you can indicate which attribute contains the identity HR code. You can also select two behaviors :   

- _Trigger an error if the identity is not found_ and indicate the event display name.
- _Trigger an error if several identities match_ and indicate the event display name.

![The User Tab](igrc-platform/collector/components/targets/usage-target/images/usage6.png "The User Tab")

If the HR code is not available (but you can access other identity attributes like mail, fullname,...) you can use the property below.

## Resolution  

Here you can select attributes that will fetch an identity for the import usage if HR code is not available.  

![The Resolution Tab](igrc-platform/collector/components/targets/usage-target/images/usage7.png "The Resolution Tab")

# Best practices

During the activation phase, if multiple usages are found with the same tuple (account, permission, application, aggregation key), they are merged in a single usage with the same tuple key, the minimum of their first date, the maximum of their last date and the sum of their counter. It is much more efficient to let the activation do this kind of merge than to do this in the collect line (for example using a Group filter).  
