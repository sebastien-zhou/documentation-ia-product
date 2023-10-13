---
layout: page
title: "Roles"
parent: "Workflow"
grand_parent: "iGRC Platform"
nav_order: 4
permalink: /docs/igrc-platform/workflow/role/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Why Roles

The roles in the workflow allow you to define the candidate(s) for manual actions. For instance:     

- who can launch a new Review Campaign (ex: the Security Team)
- who can review an organization (ex: its manager(s))
- who receives the list of remediations once a campaign is completed (ex: the service desk)

Roles can be static (ex: the Security Team) or dynamic (ex: the Manager(s) of the organization DCOM).     

Roles are used for:     

- Start components: to list people authorized to start the process
- Manual tasks: to list the candidates
- Notifications: to list the identities that will receive an email

# Role Definitions  

Roles correspond to the people that can perform the manual activity, or that should be involved in reminders and/or escalations. They have to be defined before hand in the Process Role section of the workflow configuration tab:    

![Role Definitions](../images/wf_roles.png "Role Definitions")     

The definition of roles are based on rules. For more information on how to create rules please consult the corresponding documentation.

# Adding/modifying a role

Adding and modifying a role will open a new window (see below) where all the configuration is done.   
The mandatory fields are : Display name, Description and Rules.   

If your rule requires an input parameter you have the possibility to pass said parameters to your rule in the parameter section. The product will automatically see if an input parameter is expected by the rule and allow you to select what is the corresponding parameter.   

![Adding/modifying a role](../images/RolesParameters.png "Adding/modifying a role")     

Identities within Role can also be calculated using javascript (via the onComputeRole field present each time a role can be set in the workflow).     
You can use javascript to modify the array of identities provided by the role to compute advanced roles.

# Start

In the start component, the role is defined in "Role" tab:   

![Start](../images/wf_role_start.png "Start")     

| **Note**: <br><br> It is **not** recommended to use a rule that requires a parameter for roles positioned on the start component. As the workflow is not initiated it is not possible to pass the parameter to the rule. This will systematically result in an error in the logs. <br><br>Furthermore, when calling a **sub-process** , the role defined in the start component of the subprocess is not relevant. As a result for performance reasons it is recommended to use a rule that returns no identities using a false criteria (for example : uid is null) and that is rapidly calculated.|  

# Manual Tasks

In the Manual Task, Roles are defined in the "Role/Reminder" tab:   

![Manual Tasks](../images/role_reminder.png "Manual Tasks")     

You can also use roles in the "Escalation" tab (optional):   

![Start](../images/escalation.png "Start")     

| **Note**: <br><br> if you check the option "Include initial role", once the escalation starts, the people in the initial role can still take the task.<br>See the [Manual Tasks]({{site.baseurl}}{% link docs/igrc-platform/workflow/manual-tasks.md %}) section for more information on this subject. |

# Notifications

Roles for notifications are configured via a drop-down list:   

![Notifications](../images/role_notification.png "Notifications")     

| **Note**: <br><br> if you select the option "Add the role of the current task (if manual task)", you can dynamically pass the role configured in the manual task (see above) to the notification. |

See the notification section for more information on this subject.    
[Workflow email notification]({{site.baseurl}}{% link docs/igrc-platform/workflow/email-notifications.md %}).
