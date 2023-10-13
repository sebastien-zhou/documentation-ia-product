---
layout: page
title: "Actor target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 24
permalink: /docs/igrc-platform/collector/components/actor-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

Actor target allows creation of association between an asset and an organization.  

# The properties Tab

## Target

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Support target_
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Target](igrc-platform/collector/components/targets/actor-target/images/actor_2018-04-06_15_48_40-.png "Target")

## Description  

This property allows adding comment regarding actions done by this component.  

![Description](igrc-platform/collector/components/targets/actor-target/images/actor_2018-04-06_15_48_53-.png "Description")

## Actor

In this tab, you will specify:

_"Attribute containing organization"_ is the code of the organization (mandatory, mono-valued)
_"Attribute containing asset"_ is the code of the asset (mandatory, mono-valued)

![Actor](igrc-platform/collector/components/targets/actor-target/images/actor_2018-04-06_15_49_10-.png "Actor")

# Error handling

If one of the key attributes (organization or asset) cannot be found in the import tables, the creation of this actor object is silently cancelled and a line is written to the log file:  
```
No writing of asset-organization link because one of the key attributes
(_organization_ or _asset_) contains an unknown value in the database
```

If one of the key attributes (organization or asset) is empty, the creation of this actor object is silently cancelled and a line is written to the log file:
```
No writing of asset-organization link because one of
the key attributes is empty or missing in the target component configuration
```
