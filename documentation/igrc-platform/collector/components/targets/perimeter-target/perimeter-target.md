---
layout: page
title: "Perimeter target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 12
permalink: /docs/igrc-platform/collector/components/targets/perimeter-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

With this target you will add _Perimeter_ to the Ledger.     

_Right_ plays the role of link between the access account and the permission. It can carry the information linked to the instantiation of the permission (for example, access to the directory type permission in a single reading, access to the transaction type payment permission with a limit of 10,000€ and on the _Perimeter_ (transaction authorised with regard to Europe clients only etc).  

# Prerequisites

## Dependencies

Not applicable.  

# Procedure

When editing a collect, select _Perimeter target_ in _Ledger targets_ (previously DataSet targets).  

![Perimeter target](igrc-platform/collector/components/targets/perimeter-target/images/perimeter-target.PNG "Perimeter target")

# Properties

## Target

In this property you can see/modify general parameters of the component. You will find:

- the "_Identifier"_ shown in Debug mode for example
- the "_Display name_" for the _Perimeter target_  
- the "_Follow just one link_" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Perimeter target properties](igrc-platform/collector/components/targets/perimeter-target/images/perimeter-target_properties_target.PNG "Perimeter target properties")

## Description

Comment regarding actions done by this component.

![Perimeter target description](igrc-platform/collector/components/targets/perimeter-target/images/perimeter-target_properties_description.PNG "Perimeter target description")

## Perimeters

With this property, you will define product behaviour when importing _perimeter_ such as:

- _"Attribute containing perimeter"_ must contain the unique identifier for the _perimeter_ to add.
- _"Attribute containing application identifier"_ must contain the unique identifier for the _application_ on wich the _perimeter_ relies on.
- _"Trigger an error if perimeter code is null or empty"_ option you can activate an event that will be generated when the attribute containing _perimeter_ code is null or empty (event shown in dedicated logs).

![Perimeter target perimeters](igrc-platform/collector/components/targets/perimeter-target/images/perimeter-target_properties_perimeters.PNG "Perimeter target perimeters")

## Parameters

With this property you will define mapping between attributes (from dataset) and _perimeter_ properties (Ledger).

_Field_ contains _perimeter_ attribute available in Ledger, _Attribute_ contains _perimeter_ attribute in data set.

Available fields are :

- displayname
- custom field 1--\>9

![Perimeter target parameters](igrc-platform/collector/components/targets/perimeter-target/images/perimeter-target_properties_parameters.PNG "Perimeter target parameters")

# Example

Not applicable  

# Known limitations

Not applicable

# See also

See [Right target](igrc-platform/collector/components/targets/right-target/right-target.md) to explain where to use _perimeter_  
