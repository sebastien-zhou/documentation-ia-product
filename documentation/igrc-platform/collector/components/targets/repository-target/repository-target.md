---
layout: page
title: "Repository target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 13
permalink: /docs/igrc-platform/collector/components/targets/repository-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

With this target you will add Repository to the Ledger.

# Prerequisites

## Compatibility matrix

## Dependencies

Not applicable  

# Procedure

When editing a collect, select _Repository target_ in _Ledger targets_ (previously DataSet targets).  

![Repository target]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/repository-target/images/repository-target.PNG "Repository target")

# Properties

## Target

In this property you can see/modify general parameters of the component. You will find:

- the "_Identifier"_ shown in Debug mode for example
- the "_Display name_" for the _Repository target_  
- the "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Repository target properties]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/repository-target/images/repository-target_target.PNG "Repository target properties")

## Description

Comment regarding actions done by this component.

![Repository target description]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/repository-target/images/repository-target_description.PNG "Repository target description")

## Repository

With this property, you will define product behaviour when importing repository such as:

- _"Repository type"_ wich can be set to _Identity repository_ or _Account repository_.
- _"Attribute containing repository key"_ must contain the unique identifier for the _repository_.
- _"Attribute containing repository displayname"_ where you can add a displayname for the repository
- _"Repository custom type"_ where you can define a custom type to the _repository_ (different than the _Repository type_ attribute above)
- _"Trigger an error if repository is not found"_ option you can activate an event that will be generated when the attribute containing _repository_ code is null or empty (event shown in dedicated logs).

![Repository target repository]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/repository-target/images/repository-target_repository.PNG "Repository target repository")

## Parameters

With this property you will define mapping between attributes (from dataset) and _perimeter_ properties (Ledger).   

_Field_ contains _perimeter_ attribute available in Ledger, _Attribute_ contains _perimeter_ attribute in data set.

Available fields are :

- custom field 1--\>9

![Repository parameters]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/repository-target/images/repository_parameters.PNG "Repository parameters")

# Example

Not applicable  

# Known limitations

Not applicable
