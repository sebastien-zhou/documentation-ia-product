---
layout: page
title: "Handling managers"
parent: "Components"
grand_parent: "Workflow"
nav_order: 8
permalink: /docs/igrc-platform/workflow/components/handling-managers/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

The 'Update manager information' activity allows to set, change or delete the manager information on one or more entities.    

Entities that may have managers are:    

- Organizations
- Applications
- Permissions
- Accounts
- Groups
- Repositories
- Assets
- Identities  

# Procedure

The 'Update manager information' activity can be used to set (or update or delete) the manager of one or more entities, for example in:  

![Update manager information](images/08-01.png "Update manager information")         

The first tab of configuration of this activity is:   

![configuration](images/08-02.png "configuration")         

**Where** :      

- in the top left combo box, you can choose the type of entity you want to update the management information on
- identifiers is a variable containing the entity(ies) timeless identifier. It can be mono or multi-valued (see below)  
- `expertise_domains` is a variable containing the expertise domain code of the manager. It can be mono or multi-valued (see below)
- `managers` is a variable containing the new manager(s) for the entities. It can be mono or multi-valued (see below)
- `comments` is a variable containing the comment of the manager information. It is optional and can be mono or multi-valued (see below)
- `delegation_flags` is a variable indicating whether the manager is a delegated manager or not. It is optional and can be mono or multi-valued (see below)
- `delegation_priorities`, `delegation_begin_dates`, `delegation_end_dates` and `delegation_reasons` are variables containing respectively the priority, begin date, end date and reason of the manager delegation. They are all optional and can be mono or multi-valued (see below)

The second tab of this activity is:     

![variables](images/08-03.png "variables")         

where results is an optional multi-valued variable which will contains, once the activity has been executed, an entry for each database operation done. Possible values for each entry is:    

- `C` if a manager has been added
- `U` if some information on a manager has been updated
- `D` if the manager information has been deleted
- `N` if no operation was to be done (for example if we tried to add a manager which was already present)

These variables should be declared in a way similar to:    

![variables](images/08-04.png "variables")         

Note that all these variables can be mono or multi-valued independently from each other. Here are some possible use cases:      

- if they are all mono-valued, only one manager information will be updated (or deleted)
- if `identifiers` is multi-valued and `managers` is mono-valued, the same identity will be manager of all the entities from `identifiers`  
- if `managers` and `expertise_domains` are multi-valued and `identifiers` is mono-valued, multiple managers will be affected to the entity, each with a possibly different expertise domain  
- if `identifiers` and `managers` are both multi-valued, the first entry of `managers` will be the manager of the first entry of `identifiers`, the second entry of `managers` will be the manager of the second entry of `identifiers`, and so on.

# Actions

## Add
To set a new manager or add several managers to the same resource you need to select the Action "_Add managers_"
![Add manager](images/add_managers.png "Add manager")         

## Update
To update manager information you need to leave the Action field empty
![Update manager](images/update_manager.png "Update manager")         

## Delete
To delete one or several managers link you need to provide the list of managers links RecordUid
![Delete managers](images/delete_managers.png "Delete managers")         

---

<span style="color:red">**Warning:**</span> When deleting managers of identity resource, only direct managers links are allowed to be deleted the indirect links are calculated and updated automatically by the product.

---

<span style="color:red">**Warning:**</span> An empty multi-valued variable is not the same thing as a mono-valued variable whose value is the empty string. Furthermore, if, during the activity execution, any of the identifiers, managers or expertise\_domains variable is found to be an empty multi-valued variable, the activity will have no effect at all.

---
