---
layout: page
title: "Manager target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 3
permalink: /docs/igrc-platform/collector/components/targets/manager-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

With this target you will add management information to the Ledger

# Prerequisites

## Dependencies

The concepts (Identity, application, organization for example) on which you want to add on management information must exist in database. For more information, please refer to the article [Understanding the Brainwave Identity GRC data model]({{site.baseurl}}{% link docs/igrc-platform/getting-started/brainwave-data-model/brainwave-data-model.md %}).  

# Procedure

When editing a collect, select _Manager target_ in _Ledger targets_.  

![Manager Target](images/14.png "Manager Target")

# Properties

## Target

In this property you can see/modify general parameters of the component. You will find :

- the _Identifier_ (shown in Debug mode for example)
- the _Display name_ for the _Manager target_  
- the _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation assessed to true will be executed.

![Target](images/02_target.png "Target")

## Description

This property allows adding comment regarding actions done by this component.

![Description](images/03_description.png "Description")

## Management

Here you can select the _"Managed entity type"_ between _"Organization", "Repository", "Account", "Group", "Permission", "Application"_ or _"Asset"._

| **Warning** <br><br> _In order to improve the collect consistency, as of version 2017 R3 SP3, the collect will stop on error if an entity code/identifier is not found in the current collect. If you don't want the Execution Plan to stop, please check the box "Trigger an error if <entity> is not found". Thus, an event will be added to the collector event file, and the collect will go on._|

### Organization

When selecting -"Organization" as managed entity type- you will have to define the "-Attribute containing organization code".- The latter must be the same identifier than the one given in the -Organization- target (see [Organization target]({{site.baseurl}}{% link docs/igrc-platform/collector/components/targets/organization-target/organization-target.md %}) for detail).   

You can also "_Trigger an error if organization is not found_" and define a customised event.

![Organization](images/04_organization.png "Organization")

### Repository

When selecting _"Repository_" as managed entity type, you will have to define the "_Attribute containing repository code"._ It must be the same identifier than the one given in the _Repository_ target (see dedicated page for detail).    

You can also "_Trigger an error if repository is not found_" and even define a customised event.

![Repository](images/05_repository.png "Repository")

### Account

When selecting _"Account_" as managed entity type, you will have to define "_Attribute containing account identifier"_ as well as "_Attribute containing repository code"_. Both mentioned information must be respectively in the same identifiers than those given in the _"Account target_" and in the "_Repository target_" (see dedicated pages for detail).   

You can additionally "_Trigger an error if account is not found_".

![Account](images/06_account.png "Account")

### Group

When selecting _Group_ you will have to define "_Attribute containing group identifier"_ and _"Attribute containing repository code"_. Both highlighted information must be respectively in the same identifiers than those given in the _"Group target"_ and in the _"Repository target"_ (see dedicated pages for detail).   

You can also "_Trigger an error if group is not found_".

![Group](images/07_group.png "Group")

### Permission

When selecting _"Permission"_ you will have to define _"Attribute containing permission code"_ and _"Attribute containing application code"_. Both information must be properly in the same identifiers than those given in the _"Permission target"_ and in the _"Application target"_ (see dedicated pages for detail).   

You can additionally "_Trigger an error if permission is not found_".

![Permission](images/08_permission.png "Permission")

### Application

When selecting _"Application"_ you will have to define the _"Attribute containing application code"._ Both information must be properly in the same identifiers than those given in the _"Application" target_ (see dedicated page for detail).   

You can also "_Trigger an error if application is not found_".

![Application](images/09_application.png "Application")

### Asset

When selecting _"Asset"_ you will have to define the _""Attribute containing asset code"_. It must be in the same identifier than the one given in the _"Asset target"_ (see dedicated page for detail).   

You can also "_Trigger an error if asset is not found_".

![Asset](images/10_asset.png "Asset")

### Identity

When selecting _"Identity"_ you will have to define the _""Attribute containing managed Identity HR code"_. It must be the same identifier than the one given in the _"Identity target"_ (see dedicated page for detail).   

You can also "_Trigger an error if identity is not found_".

![Identity](images/15_managed_identity.png "Identity")

## Domain

In this property you will select the _"Expertise domain attribute"_. Note that the expertise domain must exist in reference tables. Such expertise domain describes the link between _Identity_ and the managed concept (_Organization_, _Application_,...). For an application, it can be "Technical owner", "Business owner"...

> On an IAP or IAS project, use the defaults `technicalowner` or `businessowner` expertise domains for best compatibily  

![Expertise domain](images/11_expertise_domain.png "Expertise domain")

## Manager

Here you can indicate which attribute contains direct manager HR code to fetch Identity in database. You can also add comment with _"Attribute containing comment"_.    

_"Delegation information"_ can additionally be configured. This property is very **useful** when several identities can be considered manager of the concept (identity, account, organisation, application, etc.) : principal manager and delegates. This delegation feature enables the product to represent for example an application review where the principal manager is accountable and delegates are responsible.   

You can set several informations about the delagation :   

- _Attribute containing delegation flag_ : this is useful when delegation information comes from HR system and not all delegation are active  
- _Attribute containin delegation priority :_ this is useful when you want to import several delegates for the same concept (same application for example) while ordering them
- _Attribute containing the start date_
- _Attribute containing the end date_
- _Attribute containing the reason_  

![Delegation](images/12_delegation.png "Delegation")

## Resolution

Here you can select attributes that will fetch manager for the managed concept if HR code is not available.   

You can define two types of attributes :   

- One that can fetch an identity directly (through fullname, mail,...)
- One that can be used by the _manager policy_ (see [dedicated page](https://documentation.brainwavegrc.com/Curie/docs/igrc-platform/manager-policy/) to fetch corresponding identiy(ies); for example to represent the case : business managers of application ELYXO are people who are accountants for the Financial Division.  

![Resolution](images/13_resolution.png "Resolution")

