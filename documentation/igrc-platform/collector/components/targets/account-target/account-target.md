---
layout: page
title: "Account target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 4
permalink: /docs/igrc-platform/collector/components/targets/account-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

This target allows you to create accounts in the ledger

# Procedure

From collect editor select _Account target_ in _Ledger targets._

![Account target](igrc-platform/collector/components/targets/account-target/images/2016-07-07_16_16_29-iGRC_Properties_-_demo_collectors_demo_070.AD_Accounts.collector_-_iGRC_Analytic.png "Account target")

# The properties Tab

## Target

In this property you can view/edit general parameters of the component. You will find the _Identifier_ (shown in Debug mode for example), _Display name_ for the _Account target_ and the _Follow just one link_ option.   

This option sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation assessed to true will be executed.

![Target](igrc-platform/collector/components/targets/account-target/images/account_target_properties.png "Target")

## Description

The description property permits a user to add comment regarding actions done by this component.

![Description](igrc-platform/collector/components/targets/account-target/images/49.png "Description")

## Data source

In this property, you can select the attribute containing the repository key. This repository will hold collected accounts, repository must exist in database.

![Account data source](igrc-platform/collector/components/targets/account-target/images/account_data_source.png "Account data source")

## Account

With this property, you will define the product behavior when importing account such as:

- _"Attribute containing account key"_ which must contain a unique identifier for the account in current used repository, for example _DistinguishedName_ in case of Active Directory accounts.
- _"Trigger an error if account key is null or empty"_ option to activate an event that will be generated when the attribute containing account key is null or empty (event shown in dedicated logs).

![Account property](igrc-platform/collector/components/targets/account-target/images/acount_property_account.png "Account property")


## Parameters

With this property you will define mapping between account properties (Ledger) and attributes from dataset.

- _Field:_  contains account attribute available in Ledger.
- _Attribute:_ contains account attributes in data set.

Available fields are login, guid, sid, profile, givenname, surname, username, employeenumber, mail, manager, creationdate, lastlogindate, passwordlastsetdate,expiredate, nextpwdchangedate, service, disabled, locked, logincount, badpasswordcount, passwordnotrequired, passwordcantchange, notnormalaccount, dontexpirepassword, passwordexpired, smartcardrequired, noownercode, noownerreason, custom 1--\>39, reference type 1 --\> 9, reference value 1--\>9

Below is presented an Example based on _ActiveDirectory_ account parameters:

![Account parameters](igrc-platform/collector/components/targets/account-target/images/account_parameters.png "Account parameters")

From **IGRC 2017 R3** the **notnormalaccount** attribute became **deprecated** and is replaced by the new attribute **privilegedaccount**.   
For new projects under IGRC 2017R3 and higher It is recommended to use privilegedaccount instead of notnormalaccount attribute.

## Manager

Here you can indicate wich attribute contains account manager. If enabled, the following options are available:

- "Manager data is an account identifier" : if enabled, a loaded manager will be assigned to the account
- "Copy manager information into the identity owning this account" : if additionnaly checked, the associated account manager will be also the manager of identity that owns the account identifier  
- _"Trigger an error if the manager account is not found"_ activates an event that will be generated when the attribute containing account manager does not exist in database (event shown in dedicated logs).

![Account manager](igrc-platform/collector/components/targets/account-target/images/account_manager.png "Account manager")

# Example

Example of file, discovery and collect of account target are provided in attachment below.  
ActiveDirectory add-on is a good example too for collecting accounts, groups and groups members, it is available in brainwave store.  
