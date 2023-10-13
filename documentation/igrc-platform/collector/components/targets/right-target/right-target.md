---
layout: page
title: "Right target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 7
permalink: /docs/igrc-platform/collector/components/targets/right-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

The Right target allows to collect right information into the ledger.  

# Procedure

From the collect editor select _Right target_ in _Data set targets._

![Right target](igrc-platform/collector/components/targets/right-target/images/2016-07-07_17_08_35-iGRC_Properties_-_demo_collectors_demo_190.png "Right target")

# The properties Tab

## Target

In this property tab of the _Right target_ you can view/edit general parameters of the rights. You will find the following definition:

- the _Identifier_ (shown in Debug mode for example)
- the _Display name_   
- the _Follow just one link_ option to set the transition mode
  - If it is checked, only the first transition with an activation condition evaluated to true will be executed.  
  - If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Target](igrc-platform/collector/components/targets/right-target/images/right_prop_target.png "Target")

## Description

This property allows to add Comments regarding actions done by this component.

![Description](igrc-platform/collector/components/targets/right-target/images/right_prop_desc.png "Description")

## Domain

Here you can define information about repository holding accounts or even groups having access to the collected rights. This property enables three options:

- "_Separator in account_" specifies repository where the account or group member is located, this option is useful for FileShare, Sharepoint, Exchange, .... For example using separator "\\"  to retrieve repository from "INTRA\\Administrator", in this case "INTRA" is the repository used to found an account having as login Administrator.
- "_Default repository code_" specifies a repository that will be used to found accounts and groups having access to the collected rights.
-  "_Account or group identifier" is unique among repositories of identical type_" specifies a repository type reference to expand accounts and groups search. For instance, searching all repositories having specified type. Note that, it is mandatory to configure type when collecting _"Active Directory"_ with multi-domain architecture likeSharepoint site shared with accounts and groups from external AD domains,  MailBox delegated to external account in case of Microsoft Exchange,.... One can specify repository type option when creating a repository using repository target.

![Domain](igrc-platform/collector/components/targets/right-target/images/right_pro_domain.png "Domain")

## Right

Here you can made the association between a permission and an account or group.

- With "Attribute containing account or group" you can specify an attribute who will contain account or group identifier (DN, Domain\\Login, ...)
- With "Attribute containing application" you can indicate the application that contain permissions related to the collected right
- With "Attribute containing permission list" you can specify permissions having the collected right (sites in case of Sharepoint, MailBox in case of Exchange)
- With "Attribute containing perimeter" you can define perimeter
- With "Attribute containing the propagation flag" you can specify that the right group will not be propagated to child group members, only direct members accounts will inherit the right, mapped variable can be a boolean or a string with 'true'/'false' value
- With "Trigger an event if account or group does not exist" option you can activate an event that will be generated when a group or account having this right don't exist in database (event shown in dedicated logs).
- With "Trigger an event if a permission is not found" option you can activate an event that will be generated when a permissions is not found in the mapped application, if not activated an error will be thrown
- With "Trigger an event if application is not found" option you can activate an event that will be generated if the application is not found in the ledger, if not activated an error will be thrown


![Right](igrc-platform/collector/components/targets/right-target/images/right_prop_right.png "Right")

## Parameters

With this property you will define mapping between attributes from dataset and account properties (Ledger).

- _Field:_  contains right attribute available into the Ledger.
- _Attribute:_ contains right attribute from the data set.

Available fields are :

- displayname
- action
- limit
- custom 1 --\>9

![Parameters](igrc-platform/collector/components/targets/right-target/images/Right_target_review.png "Parameters")

# Example

Sharepoint add-on is a good example for collecting accounts, groups groups members and rights, it is available in brainwave store.  

# Known limitations

Not applicable  
