---
layout: page
title: "Theoretical rights target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 18
permalink: /docs/igrc-platform/collector/components/targets/theoritical-right-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---
# Usage

Theoretical rights define the entitlements of identities or group of identities (eg. by job or by organization) regarding permissions and applications.   
The **Theoretical Rights** target component allows to write a matrix of theoretical rights to the Ledger database.   
The rights data can come directly from a spreadsheet file, or be based on manual right reviews.    
Theoretical rights are then resolved to individual theoretical identity-permission rights, through _Entitlement model policies and rules._   
Theoretical rights data can then be compared against actual permissions and rights to detect over or under allocations and perform other controls.

![Target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/theoretical-rights-target/images/target.png "Target")

# The properties Tab

## Target

the **Target** property tab allows to view/modify general parameters of the component:

- **Identifier** internal identifier of the component, useful in debug mode or for reading collect log files.
- **Display name**  for the **Theoretical rights**  **target** , to be displayed in the collector editor.
- **Follow just one link**  option defines how multiple transition collects are being processed.   
If checked, only the first transition with an activation condition evaluated to true will be executed.   
If unchecked, all transitions with an activation condition evaluated to true will be executed.

![Rights Target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/theoretical-rights-target/images/rights_target.png "Rights Target")

## Description

The **Description** property Tab allows adding notes on the component, such as description of what the component is doing.

![Description]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/theoretical-rights-target/images/rights_desc.png "Description")

## Theoretical rights

The **Theoretical Rights** tab allows to define mandatory attributes of the theoretical  rights.

- **Attribute containing application** defines the collect attribute that will hold the **application code**.  
This is usually an attribute from the discovery or source of the collect.  
The application code must correspond to an existing application code in the Ledger or no right will be written for this entry.  
- **Attribute containing permission** defines the collect attribute that will hold the **permission code**.  
This is usually an attribute from the discovery or source of the collect.  
The application code must correspond to an existing permission code in the Ledger or no right will be written for this entry.  
- **Trigger an error if permission or application does not exist / Event**  : option to log an error to the event file whever an application code or permission code referenced in the rights target cannot be found in the Ledger.   
If the option is checked, you have to specify an id for the event to trigger.   
If the option is unchecked , any missing permission or application will be logged to the general collect log files.

![Theoretical rights]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/theoretical-rights-target/images/rights_rights2.png "Theoretical rights")

## Parameters

The **Parameters** tab allow to define secondary fields for the theoretical rights.

There are 4 secondary fields or category of fields

- **rule type** : This is a selector determining the type of theoretical rights to be written in this target. It determines the semantics of the generic parameter fields. The type is also used to determine which _Entitlement Model rule_ to apply to resolve the rights.  
This is usually a computed attribute in the collect with a static value, such as "byhrcode".
- **role** : optional field to define precisely the kind of profile / role for this right permission/identity pair. It could be something like read,modify,admin,etc..
- **comment** : optional description of the theoretical right to be written
- **param1 - param9** : these generic fields will hold secondary references of the theoretical right, such as account login, identity hrcode, job title, organization code.  
There is no semantic attached to these fields, so no check will be done against the Ledger database.
- **custom1 - custom9** : optional additional custom fields, if needed.

![Parameters2]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/theoretical-rights-target/images/rights_params2.png "Parameters2")

![Parameters3]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/theoretical-rights-target/images/rights_params3.png "Parameters3")

# Best practices

- Always set ruletype for theoretical rights in Entitlement model policy must be applied and to help determine the semantics of the rights, if there are more than one.  
- If the Theoretical rights source is a manually produced spreadsheet ( that may contain spelling errors on permission or application codes), it's recommended to turn on the _trigger an error if permission or application do not exist_ option so that any errors can easily be tracked.   

# Error handling

As stated above, it's recommanded to turn on the **Trigger error** option.   
For each missing application or permission, an event will be written to an event file in the logs directory.

# Examples

Download theoretical rights examples from Brainwave Marketplace at the following location:

[Theoretical rights examples - collect](https://marketplace.brainwavegrc.com/package/bw_theoreticalrights/)  

(You must be a registered user to download)
