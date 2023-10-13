---
layout: page
title: "Permission target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 9
permalink: /docs/igrc-platform/collector/components/targets/permission-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

This target allow you to collect permissions in the ledger.  

# Prerequisites

## Compatibility matrix

|  2014 |  |  |  |  2015 |  |  2016 |  |
|  R1 |  R2 |  R3 |  R4 |  R1 |  R2 |  R1 |  R2 |
|  N/A | N/A|  N/A |  N/A |  N/A |  N/A |  X |  X |

## Dependencies

Not applicable.

# Procedure

From collect editor select _Permission target_ in _Ledger targets._

![Permission target](igrc-platform/collector/components/targets/permission-target/images/2016-07-07_17_29_31-iGRC_Properties.png "Permission target")

# Properties

## Target

In this property you can view/edit general parameters of the permission. Such features are:

- the _Identifier_ ; shown in Debug mode too.
- the _Display name_ for the _Permission target_  
- the _Follow just one link option to_ set the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation assessed to true will be executed.

![Properties target](igrc-platform/collector/components/targets/permission-target/images/prop_target.png "Properties target")

## Description

Here you can add comment regarding actions done by this component.

![Description target](igrc-platform/collector/components/targets/permission-target/images/prop_desc.png "Description target")

## Permissions

With this property, you will define product behavior when importing permission. The following options are available:   

- _"Attribute containing permission key"_ which must contain the unique identifier for the permission to add.
- _"Attribute containing application identifier"_ which must contain an application identifier existing in database.
- "_Permission type_" with which you can define permission type like "profile", "transaction" or even set it to "custom type". The type field could then mapped in parameters tab presented in below section.  
- _"Trigger an error if permission code is null or empty"_ allows you to activate an event that will be generated when the attribute containing permission code is null or empty (event shown in dedicated logs).

![Permissions target](igrc-platform/collector/components/targets/permission-target/images/prop_permission.png "Permissions target")

## Parameters

The "Parameters" property is used to define mapping between attributes from dataset and permission properties (Ledger). Both definitions are relevant:   

- _Field:_  contains permission attribute available in Ledger.
- _Attribute:_ contains permission attribute in data set.

Available fields are :

- displayname
- permissiontype
- action
- nickname
- depth in three
- lastmodifydate
- lastaccessdate
- totalsize
- numberoffiles
- managed
- sensitivityreason
- description
- custom 1--\>9
- reference type 1--\>9
- refernece value 1--\>9

![Permissions target1](igrc-platform/collector/components/targets/permission-target/images/permission_target_image1.png "Permissions target1")

## Folders

With this property you will define relations between the permissions and parent permissions to create hierarchy. Those only concern SharePoint and file share (ACL).   

To use this option you must check "_SharePoint or File share folder hierarchy collector_" option. You additionally can configure:

- "Separator between items" with which you can specify separator that will be used to build links between the permission and parents permissions.
- "_Trigger an error if a permission has no parent_" option which allows you to activate an event that will be generated when the permission has no parent (event shown in dedicated logs).
- "_Attribute containing inheritance flag_" is a boolean attribute to notify that the permission rights are inherited from a parent permission (parent can be direct or indirect).
- "_Trigger an error if no parent permission owns rights_" option with which you can activate an event that will be generated when the permission is marked as inherited and no parent permission owning rights is found (event shown in dedicated logs).  

![Permissions target2](igrc-platform/collector/components/targets/permission-target/images/permission_target_image2.png "Permissions target2")

## Hierarchy

With this property you will define the hierarchy of roles, profiles or transactions. Note that this configuration does not concern SharePoint or File share (ACL) import. To use this option you must check the box "_Concerns the hierarchy of roles, profiles or transactions. Do NOT fill for Sharepoint or File share (ACL)_". Additional setting includes configuring:   

- "_Attribute containing direct children_" with which you can specify an attribute containing direct child.
- "_Trigger an error if one of the children is not found_" option which allows activating an event that will be generated when the one of the children permission is not found (event shown in dedicated logs).

![Permissions target3](igrc-platform/collector/components/targets/permission-target/images/permission_target_image3.png "Permissions target3")

# Example

Not applicable.  

# Known limitations

Not applicable.  

# See also

[Understanding the Brainwave Identity GRC data model](igrc-platform/getting-started/brainwave-data-model/brainwave-data-model.md)
