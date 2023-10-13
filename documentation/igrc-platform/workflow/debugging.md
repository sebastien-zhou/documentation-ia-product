---
layout: page
title: "Debugging"
parent: "Workflow"
grand_parent: "iGRC Platform"
nav_order: 12
has_children: true
permalink: /docs/igrc-platform/workflow/debugging/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

Debugging is an essential step when creating a workflow. The following article will present how to debug your workflow.

# Procedure

Those familiar with the collector debug mode will find themselves quite at ease with the debug mode of the workflow editor (see [Collecte]({{site.baseurl}}{% link docs/igrc-platform/collector/collector.md %}). As in the collector editor, it is possible to set breakpoints to wait on any given activity, inspect variable values, proceed forward step by step, etc. The workflow debugger, however, has been enriched with two major additions :   

- E-Mails view
- A main debug dialog.

## The Mails view

The workflow debugger provides an additional view that displays the notifications that have been sent during the process. This is only a simulation, as no notification are actually sent during debug.     

![The Mails view](./images/viewmail.png "The Mails view")

The e-mail view can be found in the debug perspective, alongside the Variables view. If for some reason it is no   t displayed in your interface, you can add it by selecting it in Eclipse menus, following the path:

Window \> Show view \> Other.  

Not only can you see how many emails have been sent for every activity of the process, but you can have a detailed list of the recipients, the errors (unfound recipients for example) and even a preview of the mail sent to any given recipient, with attachments.  

## The main debugging dialog

The first thing you will notice when launching a process in debug mode is the dialog that will immediately pop up and stay opened until the process is finished. This is in some way the 'command center' of the process, where you will be able to choose from available tasks, claim them as a selected candidate, fill variables as if you were in a page and perform various actions that will determine the path of execution.   

![The main debugging dialog](./images/debug.png "The main debugging dialog")    

The debugging dialog is very straightforward to use, with an input area that will contain either the list of candidates to the next available task or the variables to be filled. At the top of the window, the Actions section displays the current task and a toolbar that will highlight the actions that can be performed at a given time. Those actions are :      

- unclaim task (e.g. release it without completing it, making it available to other candidates again)
- unclaim task but save variables (same as above, but the variables you have changed will be saved, so that other candidates will start over from where you left off)
- send a reminder notification. This helps you simulate timed notifications, as no timers will be set in debug mode. If the task has escalated, the escalation reminder will be sent.
- force task to escalate. This will put the task in escalation mode, exactly as if the escalation timer had expired
- set the task to expire, as if the expiration timer had gone off. This will make the process branch on expiration links (those with red color)   

The checkbox to 'save scenario on exit' is always available during debug. See the pages on [Recording and replaying debug sessions using scenarios]({{site.baseurl}}{% link docs/igrc-platform/workflow/recording-and-replaying-debug-sessions-using-scenarios.md %}) for more information.

# See also

The following sub-pages will display a list of the common error that can occur during the creation and the execution of a workflow.
