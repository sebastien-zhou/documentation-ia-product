---
layout: page
title: "Overview"
parent: "Notification rules"
grand_parent: "iGRC Platform"
nav_order: 1
permalink: /docs/igrc-platform/notification-rules/overview/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Pre-requisits

The notification rule functionality is available in all versions above 2014.

# Context

iGRC Analytics offers a functionality to send Emails by using a notification rule. The notification rule contains the content of the email and and includes attachments as well as the list of recipients.    Notification rules rely on concepts already existing in the product, as selecting recipients is done via a view, and attachments rely on Birt reports.    
The main characteristics of Email notifications are as follows:    

- Possibility to customize Emails
- Possibility to target a customized set of recipients
- Possibility to customize attachments in PDF, Excel or OpenOffice formats
- Possibility to preview notifications before sending them
- Manual sending to one recipient or mass sending
- Follow up of campaigns via log files
- Automatic split into multiple emails if the maximum size is reached
- Possibility to compress Excel files using .zip format
- Compatible with SMTP and SMTP over SSL

You can customize the mail content. This means that you can dynamically modify the subject, the content and attachments for each recipient. To do so, the body of the mail uses macros. For instance the content of the mail sent to abourget@acme.com can start with "Dear Adrien Bourget" whereas the one sent to mdupont@acme.com starts with "Dear Marc Dupont". Attachments can also be modified depending on the current recipient, by passing information on the current recipient to the Brit report (for instance you could list the current recipient's team members).   

![Notification rules]({{site.baseurl}}/docs/igrc-platform/notification-rules/images/notification-overview-dynamicAttachements.png "Notification rules")

Notification rules can be used in three situations : independently, during workflows or through the Web Portal.  

## Independent Emails  

In this context, the user opens the notification rule editor in the Studio. The editor allows to modify the notification rule (set the subject, body, recipients and attachments) and to preview the result as a list of emails (screen capture above). For each email, the editor displays the email as it will be sent, including attachments. The user can then choose between actually sending the emails or saving all the emails and attachments on the hard drive.   

iGRC Analytics also provides a command line (igrc\_notify.cmd or igrc\_notify.sh) allowing to send or save emails through batch mode. This would, for example, allow the user to send reports once the execution plan has been completed.

## Workflow Emails  

In this context, notifications are used to notify candidates of manual tasks that they have a pending task. The email can contain a link to the portal so that the user is directly led (after authentication) to the corresponding task. Notification rules are also used for reminders and escalation.

## Webportal execution  

You can also send emails from Webportal, click [here]({{site.baseurl}}{% link docs/igrc-platform/pages/events-and-actions.md %})

# See also

Notification rules for Workflows : [Notifications par mail]({{site.baseurl}}{% link docs/igrc-platform/workflow/email-notifications.md %})
