---
layout: page
title: "Exchange extraction script"
nav_order: 3
parent: "Extraction Scripts"
grand_parent: "Add-ons"
permalink: /docs/igrc-platform/add-ons/extraction-scripts/exchange-extraction-script/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

This documentation describes how to use the scripts provided by Brainwave Identity GRC to extract permissions on mailboxes and distribution groups and mailboxFolders on an Exchange server.   
This documentation applies to Exchange Server 2010 and  2013.

# Prerequisites

## Compatibility matrix

| 2014 |  |  |  |  2015 |  | 2016 |  |
| R1 | R2 | R3 | R4 | R1 | R2 | R1 |  R2 |
| No | No | No | No | No | No | Yes| Yes |

Versions: bw\_exchange\_4.1 add-on

## ICF Compatibility

This script is compatible with brainwave ICF Powershell connector.

## Dependencies

- Requires PowerShell 2.0 or greater
- The extraction script is located in the /extractors/bw\_exchange/.
- This file is installed by the Exchange add-on.
- Requires role group Organization Management
- Requires Remote powershell or Microsoft Exchange Management Shell in case of remote execution.

# Procedure

This script takes as input the following parameters:   

|-prefix |Prefix for the CSV generated files.<br>example<br>&emsp;-prefix Exchange|
|-servers |File that contains the names of servers to do extraction of their mailboxes, if the file is not specified,<br>the script will extract all Mailboxes related to users in the current AD forest. |
|-mailbox |This parameter contains a Boolean value. If this parameter is set, mailboxes rights will be extracted.|
|-distributionGroups | This parameter contains a Boolean value. If this parameter is set, distributions groups <br>  (static,dynamic) rights will be extracted. |
|-publicFolders |This parameter contains a Boolean value. If this parameter is set, public folders rights will be extracted. |
|-mailboxFolders | This parameter contains a Boolean value. If this parameter is set, mailbox folders (Calendar,Contacts,Inbox,...)<br> rights will be extracted. |
|-mailboxFoldersConfigFile |  Path to CSV  file containing a list of Folder Scope  with level to export, possible scopes <br> values are :_("All","Calendar","Contacts","ConversationHistory",<br>"DeletedItems","Drafts","Inbox","JunkEmail", "Journal","LegacyArchiveJournals",<br>"ManagedCustomFolder","NonIpmRoot","Notes","Outbox", <br>"Personal","RecoverableItems","RssSubscriptions","SentItems","SyncIssues","Tasks").<br>Csv headers must be "Scop;Level".<br><br>&emsp;csv file example:<br>&emsp;&ensp;&nbsp; Scop;Level<br>&emsp;&emsp;Calendar;2<br>&emsp;&emsp;Inbox;3<br>&emsp;&emsp;Outbox;4|
|-mailboxFilter | Filter to applie on mailboxes (example filter= "mail -like 'VIP\_\*" ).<br> Filter value will be used on filter parameter of get-aduser cmdlet<br><br> > - get-aduser -filter "value"|
|-distributionGroupsFilter | Filter to applie on distributionGroups (example filter= "mail -like 'ADMIN\_\*" ).<br>Filter value will be used on filter parameter of get-adgroup cmdlet<br><br>&emsp;- get-adgroup -filter "value"|
|-log\_level |To enable this feature you must enter the value to be 'error' to retrieve the error messages or 'message'<br>to retrieve all the information about the script. The default value is 'error'.<br> The log file is named 'extractExchange\_{current\_date}.log', it will be created in the execution directory. |

# Expected result

The script will create 4 files:

- {prefix}\_Mailboxes.ldif: contain mailbox informations.
- {prefix}\_DistributionGroups.ldif contain distribution group information.
- {prefix}\_Rights.csv: contains users rights on mailboxes.
- {prefix}\_MailBoxFolder.csv: contain users rights on mailboxes folders.

The script sends 2 values of exit code:   
> -0: Extraction has been completed without errors   
> -1: Extraction has been completed but errors were encountered. In this case the extraction isn't exhaustive, you must refer to the attached log file to identify problems.   
For example: user have't mailbox, incorrect server name, ...

# Example

- .\extractExchange.ps1 -prefix PRE  -servers servers\_list.txt
- .\extractExchange.ps1 -prefix PRE  -servers servers\_list.txt -mailbox true -distributionGroups false -mailboxFolders true -publicFolders true
- .\extractExchange.ps1 -prefix PRE  -servers servers\_list.txt -mailbox true -distributionGroups false -mailboxFolders true -publicFolders true -mailboxFoldersConfigFile config.csv -log\_level error

# Known limitations

No known limitations.

# See also

[Active Directory extraction script](igrc-platform/add-ons/extraction-scripts/ad-extraction-script.md)
