---
layout: page
title: "File share target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 8
permalink: /docs/igrc-platform/collector/components/targets/right-share-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---
# Usage

File share rights also known as ACLs (_Access Control Lists_) are collected in the ledger using the "_File share target_" component. It is recomanded to use this target for collecting file share ACLs like (Windows shares, Google Drive, NetApp shares, ...)_._

# Procedure

From collect editor select _File share target_ in _Ledger targets._  

![File share target](igrc-platform/collector/components/targets/file-share-target/images/2016-07-07_17_18_56-iGRC_Properties.png "File share target")

# The properties Tab

## Target

In this property you can view/edit general parameters of the ACLs. You will find :

- the _Identifier_ (shown in Debug mode for example)
- the _Display name_ for the _File share target_  
- the _Follow just one link_ option to set the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Target](igrc-platform/collector/components/targets/file-share-target/images/file_prop_target.png "Target")

## Description

This property allows user to add comment regarding actions done by this component.

![Description](igrc-platform/collector/components/targets/file-share-target/images/file_prop_desc.png "Description")

## File share

Here you can made the association between a permission (folder or file) and an account or group. The following options are availables:  

- "Attribute containing recipient (account or group)" to specify an attribute who will contain account or group identifier (DN, Domain\Login, ...).
-  "Attribute containing application" to indicate the application containing permissions related to the collected ACL.
-  "Attribute containing folder or file" to set an attribute that contains permission code (file path) having the collected ACL .
-  "Trigger an error if account or group does not exist" option to activate an event that will be generated when a group or account having this ACL does not exist in database. Such event is shown in dedicated logs.
- "Trigger an error if domain does not exist" option to activate an event that will be generated when the repository used to search group or account does not exist in database (event shown in dedicated logs).

![Fileshare](igrc-platform/collector/components/targets/file-share-target/images/fileshare.png "Fileshare")

## Parameters

With this property you will define mapping between attributes (from dataset) and account properties (Ledger).

- _Field:_  contains file share attribute available in Ledger.
- _Attribute:_ contains file share attribute in data set.

Available fields are :    

- Action: must contain windows access mask; for more detail see [Microsoft Documentation](https://msdn.microsoft.com/en-us/library/windows/desktop/aa374896(v=vs.85).aspx).
- Negative: Boolean value, if true is mean that ACL represent deny access, otherwise it represent allow access.

_Example from FileShare Facet parameters_   

![Parameters](igrc-platform/collector/components/targets/file-share-target/images/file_prop_params.png "Parameters")

## Replace

Here you can define a mapping of ACL recipient to a list of replacement recipient. For instance, for windows file share, we can map "_Tout le monde","Everyone",_ windows group on known SID "_S-1-1-0_" to found associated group in the ledger. SID known as Security Identifiers is a unique identifier but group name can change according to system language, case of windows default groups. Below is presented an example _from FileShare Facet replace._  

![Replace](igrc-platform/collector/components/targets/file-share-target/images/file_prop_replace.png "Replace")

# Example

FileShare add-on is a good example for collecting files and folders, it is available in brainwave store.  

# Known limitations

Not applicable  

# See also

[ACL extraction script](igrc-platform/add-ons/extraction-scripts/acl-extraction-script.md)      
[Windows Access Control Lists](https://msdn.microsoft.com/en-us/library/windows/desktop/aa374872(v=vs.85).aspx)     
[Understanding the action right field when loading file shares](how-to/collectors/how-to-understand-FS-right-action.md)       
