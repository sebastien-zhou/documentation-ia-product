---
layout: page
title: "Recording and replaying debug sessions using scenarios"
parent: "Workflow"
grand_parent: "iGRC Platform"
nav_order: 13
permalink: /docs/igrc-platform/workflow/recording-and-replaying-debug-sessions/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

When debugging a process (see the pages on [Debugging](igrc-platform/workflow/debugging.md), you might have to input the same variable values or make the process take the same paths over and over.    
It would really be helpful if the process could step automatically up to a certain point, and then let you guide the rest of the execution.
It might also be very beneficial if you could store the whole debug session, with variable values, events that have occurred, etc, so that you can replay them at a later time to test the validity of certain paths even after the process definition has evolved.

# Procedure

Scenarios are project files where a debug session has been recorded, meaning the tasks that have been performed in order, the persons that claimed the tasks, the variables that have been input or computed at each step of execution and the events that have occurred (like an escalation or a task unclaimed by a user). The scenarios are automatically written at the end of the process if the option 'save scenario on exit' has been selected in the main debug window during the process execution. A new .scenario file in the /scenarios folder will then be created.   

This file type has its own editor where it can be reviewed and replayed at leisure. Here is what it looks like :   

![Workflow scenario](../images/scenario.png "Workflow scenario")    

The 'Action list' on the left side contains the list of all activities and events that have occurred during our debug session. The panel on the right side provides additional details about the selected activity, including the values of all the process variables at the end of the activity.     

There are two different modes in which the scenario can be replayed:   

- The first one will replay the scenario automatically, without prompting you for input. This mode is especially useful if you wish to quickly assert that your process still has the same behaviour regarding the paths of execution taken and the computed variables. In the top right table, you can select a subset of variables that will be tested in the new execution against their previous value. If the values does not match, the execution will stop with an error. Please bear in mind that there is no point in testing certain variables, for instance the dates when tasks are claimed (as they are bound to change from execution to execution), or the number of a ticket created by the process (which will depend on how many tickets are already present in the database).
- The second mode will display all the forms like in normal debug mode, but here the variable values are already filled (only waiting to be validated or changed), the next candidate selected and the next actions highlighted. This mode allows you to replay the process in interactive mode, enabling you to quickly proceed to the next step, but also to branch away from your previous choices at anytime. It is entirely possible to test variables in this mode as well, with the execution stopping as soon as some values differ.   

In both modes, if the scenario reaches a point where there are still active tasks to be performed which have not been previously recorded, it will automatically switch to interactive mode and open a debug window allowing to continue the process (you can even save this new session as a new scenario). It is thus possible to record a scenario up to a certain point, then terminate the process using the cancel button, and then to replay it in automatic mode to skip all the previous activities and begin where you left off.  

# Known limitations

Scenarios are dependent on the data present in the database (from the iGRC stand point) at the time of the creation of the scenario. As such, if a workflow debugging scenario was created and that the corresponding database was deleted then it will no longer be functional.
