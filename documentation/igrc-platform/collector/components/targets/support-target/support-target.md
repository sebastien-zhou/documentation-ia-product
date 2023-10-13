---
layout: page
title: "Support target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 17
permalink: /docs/igrc-platform/collector/components/targets/support-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

With this target you can create a link between an asset and a permission.

# The properties Tab

## Target

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Support target_
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Target](igrc-platform/collector/components/targets/support-target/images/2018-04-03_14_11_17-support1.png "Target")

## Description

This property allows adding comment regarding actions done by this component.

![Description](igrc-platform/collector/components/targets/support-target/images/2018-04-03_14_13_33-comment.png "Description")

## Support

In this tab, you will specify:  

- _"Attribute containing asset"_ is the code of the asset (mandatory, mono-valued),
- _"Attribute containing application"_ is the code of the application to which the permission specified below belong to (mandatory, mono-valued),
- _"Attribute containing permission_" is the code of the permission (mandatory, mono-valued),
- "_Attribute containing displayname_" is the display name of this support object (optional, mono-valued),
- "_Attribute containing comment_" is a comment associated to this support object (optional, mono-valued).

![Support](igrc-platform/collector/components/targets/support-target/images/2018-04-03_14_16_08-support3.png "Support")

# Error handling

If one of the key attributes (asset, application or permission) cannot be found in the import tables, the creation of this support object is silently cancelled and a line is written to the log file:  
`No writing of asset-permission link because one of the key attributes (..., ... or ...) contains an unknown value in the database`  
