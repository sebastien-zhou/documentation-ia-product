---
layout: page
title: "Asset target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 16
permalink: /docs/igrc-platform/collector/components/targets/asset-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This target allows to create an asset and its manager in the ledger.

# The properties Tab

## Target

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Usage target_
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/asset-target/images/asset_2018-04-06_19_07_06-.png "Target")

## Description

This property allows adding comment regarding actions done by this component.  

![Target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/asset-target/images/asset_2018-04-06_19_07_18-.png "Target")

## Asset

In this tab, you will specify:  

- _"Attribute containing asset"_ is the code of the asset (mandatory, mono-valued),
- _Trigger an error if asset is not found_ and indicate the event display name.

![Target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/asset-target/images/asset_2018-04-06_19_07_36-.png "Target")

## Parameters  

In this section you can define the mapping between attributes from the dataset and asset properties:

- displayename
- category  
- custom 1 --\> 9

![Target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/asset-target/images/asset_2018-04-06_19_07_58-.png "Target")

## Manager

In this section, you can specify:

"Attribute containing manager HR code": is the attribute who hold the manager HR code of the asset.   

"Expertise domain attribut": is the attribute holding expertise domain of the manager, if the domain attribute is nt set or empty, a default domain 'owner' will be created.   

"Attribute conattning comment": is the attribute holding comment for the manager.   

"Attribute containing delegation flag"   

"Attribute containing delegation priority"   

"Attribute containing the reason"   

"Attribute containing the start date"   

"Attribute containing the end date"  

![Target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/asset-target/images/asset_2018-04-06_19_08_31-.png "Target")

## Resolution

Here you can select attributes that will fetch manager identity for the asset if HR code is not available.

![Target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/asset-target/images/asset_2018-04-06_19_08_11-.png "Target")

### Links with permissions and organisations

To create a link between an asset and a permission, you will need to use the Support Target;   

In order to create an association between an asset and an organization, you will need to use the Actor Target.
