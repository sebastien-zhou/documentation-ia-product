---
layout: page
title: "Variable types explained"
parent: "Variables"
grand_parent: "Workflow"
nav_order: 3
permalink: /docs/igrc-platform/workflow/variables/variable-types-explained/
---
---

The workflow engine allows you to use the same variables type as in the discoveries or collectors:    

- Boolean ![Boolean](../images/bool.png "Boolean")    
- Date ![Date](../images/date.png "Date")
- Number ![Number](../images/nb.png "Number")
- String ![String](../images/str.png "String")    

But also provides new variables types:    

- Ledger Account ![Ledger Account](../images/account.png "Ledger Account")
- Ledger Application ![Ledger Application](../images/application.png "Ledger Application")
- Ledger Asset ![Ledger Asset](../images/asset.png "Ledger Asset")
- Ledger Group ![Ledger Group](../images/group.png "Ledger Group")
- Ledger Identity ![Ledger Identity](../images/identity.png "Ledger Identity")
- Ledger Organisation ![Ledger Organisation](../images/organization.png "Ledger Organisation")
- Ledger Permission ![Ledger Permission](../images/permission.png "Ledger Permission")
- Ledger Repository ![Ledger Repository](../images/repository.png "Ledger Repository")
- Process Actor ![Process Actor](../images/actor.png "Process Actor")
- Process Actor Organisation ![ Process Actor Organisation](../images/pa_org.png " Process Actor Organisation")
- File ![File](../images/fil.png "File")

Technically, these new types are Strings, they contain the corresponding concept uid. But you will **need** to use them since some **interfaces filter** the list of available attributes to a certain type, as illustrated here :   

![Variable](../images/var_types_1.png "Variable")    

_Event if the process above has many variables, only the correct variable type is available when retrieving the "Person starting the process"._   

All the types can be used for mono- or multi-valued attributes.   
The types will also be leveraged by the pages wizard.
