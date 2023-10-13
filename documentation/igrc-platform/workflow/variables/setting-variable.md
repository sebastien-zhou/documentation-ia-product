---
layout: page
title: "Setting variable values for the process start page"
parent: "Variables"
grand_parent: "Workflow"
nav_order: 1
permalink: /docs/igrc-platform/workflow/variables/setting-variable/
---
---

A workflow corresponds to the execution of a series of tasks that are integrated to the iGRC web portal. During the process, variables can be modified by the users interacting with the process.   
Variables of a workflow instance are created in the configuration tab and can be declared in both the activities: "Start" or "Manual Activity".   

Created variables can have the following input:   

- An identifier,
- A display name,
- A type which can be:
  - number, string, date, boolean and File for variables that respect such format,
  - ledger for those that interact with the main concepts of the iGRC ledger such as Ledger Identity, Account, Permission, Application, Asset, Repository, Organization and Group. Once a variable is as a ledger type, the returning attribute contains the "UIDs" of the corresponding loaded concepts; for example all the application UID loaded into the ledger if the variable is of "ledger application" type,
  - Process Actor or Process Actor organisation. Such type of variable defines the identity who start the process also known as the process owner,  
- The variable can be mono or multivalued
- Has visibility, which corresponds to the validity perimeter of the variable. The visibility can be:
  - "Local" when the parameter is only used in the current process
  - "In/Out" when the parameter is passed trough several processes or subprocesses,
- A description
- An initial value if needed,
- Some constraints, such as filling the current created variable value with a one coming from an existing variable or a list of declared values or even using a regular expression

There is also a possibility to choose whether the variable value is stored or not in the database once the process is terminated. This can be used to ensure that the value of the variable is available for audit once the process is completed. This is also useful when discarding temporary variables.   

![New variable](../images/WF_newVariable.png "New variable")    
