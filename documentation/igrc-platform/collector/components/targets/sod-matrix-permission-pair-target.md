---
layout: page
title: "SOD matrix permission pair target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 20
permalink: /docs/igrc-platform/collector/components/targets/sod-matrix-permission-pair-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# usage

The SOD target matrix is composed of cells where some of them are toxic if one single identity owns both permissions. This target is used to define a cell in the SOD matrix. Only cells corresponding to toxic permission pairs should be defined.   
Each cell is considered a a SOD control in the Brainwave terminology. During the activation step, the discrepancies are computed by examining the identity rights. If an identity owns a toxic pair, a discrepancy is stored in the Ledger as a control result. It means that a toxic permission pair is defined not only by the permission pair but also by many attributes related to risk and remediation.   
The permission pair can be composed of real application permissions (like roles or transactions in SAP) or business ativities. Activities are defined using the Activity permission pair target. It is recommended to use only one kind of permission in the whole matrix.

# The properties Tab

## The SOD control tab

Attribute containing matrix name should be filled with the matrix identifier given in the SAD matrix target.   
Attribute containing control identifier is where you define a unique ID for this control. A cell containing a permission pair is saved by the product as a control. Each control must have a unique ID among all the project controls. It means that the control ID given in this field must not collide with a project control defined using .control files or with another SOD control of another matrix. This field has a maximum size of 64 bytes.   
Result type is the kind of results which will be stored as discrepancies. Allowed values are Account and Identity but Identity is the recommended choice as it allows the SOD controls to detect problems with identity having toxic permissions in different applications.  
Model validation is used to find model discrepancies (not related to a specific user). Such discrepancies can occur when a role contains toxic permissions. Giving this role to an identity will automatically show this identity in the discrepancy list for this control, whoever is the identity. Choose the model validation according to the kind of permission pairs in the matrix: Permission type validation if the matrix is composed of real application permissions or Activity type validation if the matrix is composed of activities  
The reamining fields are used to point to the first and the second permission and select a behaviour if one permission is not found in th Ledger. All permissions (or activities) should have been collected in the Ledger before starting to collect the matrix permission pairs.  

## The Parameters tab

This tab contains all the attributes found in a control (same fields and same meaning as in the control editor). These fields are only used by the product to display information to the user when a discrepancy is found.   
The risk level should be a number between 1 and 5, 5 being the highest risk level.  
None of these fields are mandatory but it is recommended to fill them if available to help the user in the remediation.  

## The Tags tag

This tab contains information used to filter control discrepancies when displaying them in the portal. It allows the users to filter the discrepancies on different categories like type, application, or custom criteria.   
None of these fields are mandatory.

# Best practices

Use both the SOD matrix target and SOD matrix permission pair target instead of the deprectated SOD control target. This deprecated target was used to generate a project file (a .control) for each matrix cell. The SOD matrix targets share the same goal but the matrix cells are stored in the Ledger.  
You should use only one kind of permission in the SOD matrix (real application permissions or activities).  
It is recommended to activate the model validation. It allows the cleaning of the model before cleaning the discrepancied identity per identity.

# Error handling

The attribute containing the control identifier is used to determine if this is a new control or if it is already in the database and an update should be performed. If 2 controls have the same control identifier, the database will only keep one as the identifier is the key for each control.  
The only possible error is if the permission codes (or activity codes) are unknown in the Ledger. In such a case, an exception is raised.
