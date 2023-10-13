---
layout: page
title: "Variable modification and email notification components"
parent: "Components"
grand_parent: "Workflow"
nav_order: 7
permalink: /docs/igrc-platform/workflow/components/variable-modification-and-email-notification-components/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

This document presents both the " variable modification" and the "email notification" components with their associated configuration. Such two components are described together in this chapter but have completely different meanings. The variable modification component allows the insertion or update of a workflow process variables values during its execution. Instead, the email notification component is used to configure email notifications during the execution or the end of a workflow process.   

# Procedure

## Variable modification component

This component configures the corresponding attributes values which require to be updated depending on the associated workflow process need.    

![Variable modification component](../images/Image_Documentation49_bis.png "Variable modification component")         

The variable modification configuration is realised into three sub tab such as "Activity", "Description", "Updates" and available via the "properties" tab.    

The variable modification configuration is carried out into three subs tab including "Activity", "Description", "Updates" available under its "properties" tab.  

### Activity  

The activity component of the variable modification component allows user to define the display name.   

![Activity](../images/Image_Documentation51.png "Activity")         

### Description  

As its name indicates, this sub tab is an editable field allowing user to add textual descriptions to the variable modification component.    

![Description](../images/Image_Documentation52.png "Description")         

### Updates  

The updates sub-tab allows user to perform if necessary modification on workflow variables values including filling variables with the columns of an audit view (ledger data), clean or resize multivalued variables, etc. The full list is provided in the chapter on the [Start or Manual activity component](igrc-platform/workflow/components/start-or-manual-activity-composants.md). Below is an example of configuration from which a workflow variable named "ticketloguid" is filled with the columns of a view.    

![Updates](../images/Image_Documentation50_bis.png "Updates")         

## Email notification component

To send emails to workflow actors including synthesis reports, user needs to add and configure email notification component. An example could be sending an email notification at the end of a workflow process (review campaign/access request) including attachment of synthesis reports.   

![Email notification component](../images/Image_Documentation53.png "Email notification component")         

The configuration of an email notification component includes configuring the following sub tabs: "Activitity", "Description", "Output" and "Iteration".  

### Activity

This tab enables the setting of the component display name as well as the process email. The process email implementation is available under the chapter on [E-mail notifications](igrc-platform/workflow/email-notifications.md).  

![Activity](../images/Image_Documentation54.png "Activity")         

### Description

It allows user to add text to describe the component function.   

![Description](../images/Image_Documentation55.png "Description")         

### Output  

Under the output sub tab, user can retrieve from the task associated to the current workflow some information related to emails such as:    

- list of emails for whom : a message was successfully sent/ any message could not be sent,
- list of person without email address.   

![Output](../images/Image_Documentation56.png "Output")         

Note that the "List of persons for which no mail address could be found" item references a Process Actor variable type.   

### Iteration  

As detailed in the chapter on [Iterations and subprocesses](igrc-platform/workflow/iterations-and-subprocesses.md), the iteration sub tab in this component will permit to configure notifications with the possibility of enabling multiple instances of the same activity based on a multivalued variable.     

![Output](../images/Image_Documentation57.png "Output")         
