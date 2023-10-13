---
layout: page
title: "Group target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 5
permalink: /docs/igrc-platform/collector/components/targets/group-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This target allow you to create groups in the ledger.

# Procedure

From collect editor select _Group target_ in _Ledger targets._  

![Group target](igrc-platform/collector/components/targets/group-target/images/2016-07-07_16_36_19-iGRC_Properties.png "Group target")

# The properties Tab

## Target

In this property you can view/edit general parameters of the Group. You will find the _following:_

- _Identifier_ (shown in Debug mode for example),
- _Display name_ for the _Group target_
- _Follow just one link_ option for setting the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation assessed to true will be executed.

![Group target](igrc-platform/collector/components/targets/group-target/images/2016-07-07_16_38_15-iGRC_Properties.png "Group target")

## Description

This property allows adding comments regarding actions done by this component.

![Description](igrc-platform/collector/components/targets/group-target/images/2016-07-07_16_38_35-iGRC_Properties.png "Description")

## Repository

In this property, you can select the attribute that will contain the repository key. This repository will hold collected groups and must exist in database.

![Repository](igrc-platform/collector/components/targets/group-target/images/2016-07-07_16_38_58-iGRC_Properties.png "Repository")

## Group

With this property, you will define product behavior when importing groups, such as:   

- _"Attribute containing group key"_ which must contain a unique identifier for the group in current used repository, for example _DistinguishedName_ in case of Active Directory groups.
- _"Trigger an error if groupkey is null or empty"_ option to activate an event that will be generated when the attribute containing group key is null or empty (event shown in dedicated logs).

![Group import](igrc-platform/collector/components/targets/group-target/images/group_pro_group.png "Group import")

## Parameters

With this property you will define mapping between attributes from dataset and group properties (Ledger).

- _Field:_ contains group attribute available in Ledger.
- _Attribute:_ contains group attribute in data set.

Available fields are :   

- guid
- sid
- displayname
- comment
- grouptype
- dynamic
- filter
- manageraccount
- creationdate
- modificationdate
- custom 1--\>9

Example of an ActiveDirectory group parameters:  

![Group parameters](igrc-platform/collector/components/targets/group-target/images/group_pro_params.png "Group parameters")

## Content

With this property, you will define group content such as:   

- -"Attribute containing group member"- to specify attribute that contain list of accounts and groups identifiers that are members of collected group. For performance reasons, we advise using group member target to collect group members separately from collecting groups, see -[Group Members target](igrc-platform/collector/components/targets/group-members-target/group-members-target.md)_ documentation for more details.
- "_Group containing all accounts_" this option is deprecated.
- _"Trigger an error if one of the children is not found"_ option to activate an event that will be generated when a group member is not found in database (event shown in dedicated logs).

![Group content import](igrc-platform/collector/components/targets/group-target/images/group_pro_contetnt.png "Group content import")

## Domain

Here you can define how to find accounts and groups who are members of a group. The following options are available:

- "_Separator in account_" with which you can specify a repository where the account or group member is located, this option is useful for FileShare, Sharepoint, Exchange,...,. For example using separator "\"  to retrieve repository from "INTRA\Administrator", in this case "INTRA" is the repository used to found an account having as login Administrator.
- "_Default repository code_" which specifies a repository that will be used to found accounts and groups who are members of collected group.
- "_Account or group identifier is unique among repositories of identical type_" in which ou can specify a repository type reference to expand accounts and groups searching (search on all repositories having specified type). Note that, it is mandatory to configure type when collecting _ActiveDirectory_ with multi-domain architecture (a group containing members from external domains, files shared with users from external domains, ...). You can set repository type when creating the repository.

![Group domain](igrc-platform/collector/components/targets/group-target/images/group_pro_domain.png "Group domain")

# Example

ActiveDirectory add-on is a good example for collecting accounts, groups and groups members, it is available in brainwave store.

# Known limitations

Not applicable  
