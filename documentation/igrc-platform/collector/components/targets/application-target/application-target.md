---
layout: page
title: "Application target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 10
permalink: /docs/igrc-platform/collector/components/targets/application-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This target allows you to collect application in the ledger.  

# Procedure

From collect editor select _Application target_ in _Ledger targets._

![Application target](igrc-platform/collector/components/targets/application-target/images/2016-07-07_17_47_08-iGRC_Properties.png "Application target")

# The properties Tab

## Target

In this property you can view/edit general parameters of the application. You will find:

- the _Identifier_ (shown in Debug mode for example)
- the _Display name_ for the _Application target_  
- the _Follow just one link_ option

This option sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation assessed to true will be executed.

![Target](igrc-platform/collector/components/targets/application-target/images/app_prop_target.png "Target")

## Description

Here you can add comments regarding actions done by this component.

![Description](igrc-platform/collector/components/targets/application-target/images/2016-04-05_13_17_04-iGRC_Properties.png "Description")

## Repository

In this property, you can select the attribute that will contain the repository key. This repository will hold collected applications, repository must exist in database.

![Repository](igrc-platform/collector/components/targets/application-target/images/2016-07-07_17_51_53-iGRC_Properties.png "Repository")

## Application

With this property, you will define product behavior when importing application. The following optionsare set :

- _"Attribute containing application key"_ which must contain a unique identifier for the application in current used repository.
- "Application type" with which you can define application type by choosing from role or profile based application, Fileshare, Sharepoint, ... ) or set it to custom type.
- _"Trigger an error if application is not found"_ option from which you can activate an event that will be generated when the attribute containing application code is null or empty (event shown in dedicated logs).

![Application target](igrc-platform/collector/components/targets/application-target/images/Application_target_image3.png "Application target")

## Parameters

In this property you can define mapping between attributes from dataset and application properties (Ledger). Both définitions are relevant:

- _Field:_  contains application attribute available in Ledger.
- _Attribute:_ contains application attribute in data set.

Available fields are :

- displayname
- applicationtype
- applicationfamily  
- description  
- sensitivity reason
- category  
- custom1--\>9
- reference type 1--\>9
- reference value 1--\>9  

![Application target](igrc-platform/collector/components/targets/application-target/images/Application_target_image1.png "Application target")

## Permission

With this property you can create generic permission for the import application by defining the "_Permission identifier_" and the "_Permission displayname_".

![Permission](igrc-platform/collector/components/targets/application-target/images/2016-04-05_13_23_38-iGRC_Properties.png "Permission")

## Manager  

Here you can indicate which attribute contains application manager. For instance, you can indicate which "-attribute contains manager HR code-", the "-expertise domain-" as well as "-attribute containing comments-" related to application manager. You can as well fill delegation information such as the "_attribute containing the delegation flag_", the "_delegation priority_", the "_start date_", the "_end date_", and the "_reason_". More informations regarding manager property is available under the article: [Manager target](igrc-platform/collector/components/targets/manager-target/manager-target.md)   

![Application target](igrc-platform/collector/components/targets/application-target/images/Application_target_image2.png "Application target")

## Resolution  

This part enables you to set up attributes that will fetch direct manager of the import application whether the corresponding manager HR code is not available.

![Resolution](igrc-platform/collector/components/targets/application-target/images/07_resolution.png "Resolution")

# Example

Not applicable.  

# Known limitations

Not applicable.  

# See also

[Understanding the Brainwave Identity GRC data model](igrc-platform/getting-started/brainwave-data-model/brainwave-data-model.md)     
