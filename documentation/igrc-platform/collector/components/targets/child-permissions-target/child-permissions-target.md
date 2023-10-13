---
layout: page
title: "Child permissions target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 15
permalink: /docs/igrc-platform/collector/components/targets/child-permission-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

## Usage

This target is used to add hierarchical links between permissions after their creation. It can be used for file share (or SharePoint) permissions or for standard hierarchical permissions.  

## The properties Tab

### Target

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Support target_
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![The properties Tab]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/child-permissions-target/images/childperm1.png "The properties Tab")

### Description

This property allows adding comment regarding actions done by this component.

![The Description Tab]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/child-permissions-target/images/childperm2.png "The Description Tab")

### Permissions

This property allows to specify a permission code and application:  

- In the case of file share or SharePoint, this selected permission will be the child permission and its parent will be automatically constructed (for example for the /a/b permission, this target will create a link between /a and /a/b)
- In the case of permission hierarchy, this permission will be the parent permission of the ones specified in the Hierarchy tab.  

![The Permissions Tab]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/child-permissions-target/images/childperm3.png "The Permissions Tab")

### Folders

Check the _SharePoint or File share folder hierarchy collector_ checkbox to activate this mode. Here you can specify:  

- The separator between path components (/ for Unix file system paths and SharePoint URLs or \ for Windows file system paths),
- The event to be triggered when the parent permission code not part of the Ledger,
- The name of a boolean attribute indicating if the permission has some proper ACLs or if they are inherited from one of its ancestors,
- The event to be triggered when you specified that the ACLs of the permission are inherited but there does not exist an ancestor of the permission which has ACLs.  

![The Folders Tab]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/child-permissions-target/images/childperm4.png "The Folders Tab")

### Hierarchy

Check the _Permission hierarchy collector_ checkbox when you want to activate this mode. Here you can specify:  

- "_Attribute containing direct children_" is the name of a (possibly multi valued) attribute containing the code(s) of the children permissions,
- The event to be triggered when one of the permission codes in the children attribute cannot be found in the Ledger.  

![The Hierarchy Tab]({{site.baseurl}}/docs/igrc-platform/collector/components/targets/child-permissions-target/images/childperm5.png "The Hierarchy Tab")
