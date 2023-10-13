---
layout: page
title: "Hierarchy and Naming Rules"
parent: "Tips and Best Practice"
grand_parents: "Views"
nav_order: 1
permalink: /docs/igrc-platform/views/tips-and-best-practice/heararchy-and-naming-rules/
---
---

Audit views are found in the `/views` folder of your audit project.   

- `/views/account`: Views based on accounts
- `/views/application`: Views based on applications
- `/views/asset`: Views based on assets
- `/views/custom`: Directory containing custom views for the project
- `/views/filesystem`: Views based on file system
- `/views/group`: Views based on group
- `/views/identity`: Views based on identities
- `/views/job`: Views based on job title
- `/views/organisation`: Views based on organisation
- `/views/permission`: Views based on permissions
- `/views/physicalaccess`: Views based on physical access
- `/views/repository`: based on reference to repositories
- `/views/rules`: Views referring to rules
- `/views/usage`: Views based on usage status   

Views provided by Brainwave are given an identifier prefixed by `br_` .   
File names of Audit Views are based on the view identifier but do not feature a prefix.   
File names start with the main concept that the view processes.     
The '_Notes_' tab of the Audit View contains the description of the view. This information is displayed when selecting an Audit View from the Report Editor.     
The names of concepts that are linked to the View's main concept are prefixed by the name of that concept  
The system modifies the names of attributes to which a mathematical operator has been applied to reflect the operation carried out.   
Your own views must be placed in the `/views/custom` subfolder.   
