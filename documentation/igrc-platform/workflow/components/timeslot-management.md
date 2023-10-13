---
layout: page
title: "Timeslot management"
parent: "Components"
grand_parent: "Workflow"
nav_order: 4
permalink: /docs/igrc-platform/workflow/components/timeslots-management/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

The Timeslot management activity allows administration of the timeslots life-cycle.    
A timeslot can undergo different operations within a workflow activity:   

- Validate
- Hide/Show
- Rename
- Delete

# Procedure

The Timeslot management component can be added to the workflow through drag and drop in the workflow editor. This component allows you to manage the life-cycle of a timeslot.   

![Procedure](../images/03-01.png "Procedure")      

to manage the life-cycle of a timeslot.   
The configuration of this activity is :   

![Procedure](../images/03-02.png "Procedure")      

In this panel:   

- the variable timeslotUid must contain the unique identifier of the timeslot to operate on (it must not be empty and must reference an existing timeslot).  
- the variable action is the action to be performed. Admissible values are :
  - validate: To validate an activated timeslot.
  - hide: To hide in the webportal a validated timeslot. This can be usefull to hide corrupted data from validated timeslots
  - show: To show in the webportal a hidden timeslot
  - rename: to rename the current timeslot
  - delete: To delete an activated or sandbox timeslot
- In the case of a rename action, the last variable will contain the new display name of the timeslot (in which case it must not be empty, its value is ignored for any other action).     

The possible values for the action variable depending on the current status of the timeslot (as well as its new status) is as follows:     

| Status \ action  | **validate**  | **hide**  | **show**  | **rename**  | **delete**  |
|  :--- |     :----:   |     :---:  |    :---:  |     :---:     |  :---:     |
| **Validated** | | X (Hidden)  |  | X |  |
| **Old** | | X (Hidden)  |  | X  |  |
| **Activated** | X (Validated)  |  |  | X  | X  |
| **Hidden**  | ||X (Validated or Old)  | X  ||
| **Sandbox**  |||| X||  
