---
layout: page
title: "SharePoint extraction script"
nav_order: 4
parent: "Extraction Scripts"
grand_parent: "Add-ons"
permalink: /docs/igrc-platform/add-ons/extraction-scripts/sharepoint-extraction-script/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

This documentation describes how to use the scripts provided by Brainwave Identity GRC to extract the user's access rights to resources AD (accounts and groups) and Sharepoint (sites, lists, documents ...).

This documentation applies to Active Directory Version 2003, 2008 or 2012 and Sharepoint version of MOSS 2007, 2010 or 2013.

# Prerequisites

## Compatibility matrix

|  2014 |  |  |  |  2015 |  |  2016 |  |
|  R1 |  R2 |  R3 |  R4 |  R1 |  R2 |  R1 |  R2 |
|  No |  No |  No |  No |  No |  No |  Yes |  Yes |

Versions: bw\_sharepoint\_2.1 add-on

## ICF Compatibility

This script is compatible with brainwave ICF Powershell connector.

## Dependencies

- The script must be executed on sharepoint server.
- The script must be run in a PowerShell prompt.
- The extraction script is located in SharePoint add-on under /extractors/bw\_sharepoint/.
- The script must be executed using an account having administrative privileges on Sharepoint.

# Procedure

This script takes as input five parameters:

|-prefix | Prefix to be used for the output files.<br>Example: sharepoint |
|-withItems | Boolean indicating whether the rights on  items should be extracted. <br>The possible values are 'true' and 'false'.<br> **Please note** , due to the volume generated, it is recommended to set this parameter to false. |
|-siteList <br>or<br>-url<br>or<br>-webAppsUrlFilename | Indicates the site collection to extract. One of the three following parameters can be used: <br><br>- **url** specifies a site collection by indicatingthe corresponding URL,eg -urlhttp://mysitecollection.com/intranet/collection\_1<br><br>- **webAppsUrlFilename** Must point to a file that contains several key URLs<br> (The script will run multiple times: once for each line)<br>example: - webAppsUrlFilename appstocrawl.txt appstocrawl, the .txt file contains for example:<br>&emsp;http://www.sharepoint1.local/<br>&emsp;http://www.sharepoint2.local/<br>&emsp;http://www.sharepoint3.local/<br>&emsp;http://www.sharepoint4.local/<br><br>- **siteList** Needs to point to a file that contains several URLs of sites collections. (Principal URL + URI)<br>example: -siteList sitestocrawl.txt the sitestocrawl.txt file contains for example:<br>&emsp;http://www.sharepoint1.local/intranet/collection\_1<br>&emsp;http://www.sharepoint2.local/intranet/collection\_2<br>&emsp;http://www.sharepoint3.local/intranet/collection\_3<br>&emsp;http://www.sharepoint3.local/intranet/collection\_4<br>&emsp;http://www.sharepoint4.local/intranet/collection\_1|
|-siteLevel |Indicates the depth of extraction to be applied . The default value is 1.<br>**Attention** for performance reasons andvolume we don't advise to browse theentire tree if the parameter <br>"withItems'is set to 'true'. |
|-LogLevel |To enable this feature you must enter the value to be 'error' to retrieve <br>the error messages or 'message' to retrieve all the information about the script. The default value is 'error'.<br> The log file is named 'ExtractSharePoint\_script.log', it will be created in the execution directory. |

# Expected result

The scriptproduces three CSV files:   
> -{prefix}\_Nodes.csv: contain the description of theSharepoint tree (Sites, Lists, Documents).   
> -{prefix}\_Groups.csv: contain descriptions of groups defined in Sharepoint.   
> -{prefix}\_Roles.csv: contain the description of the access rights of accounts and groups on the Sharepointdocument tree.

The script sends an exit code:   
> -0: Extraction has been completed without errors     
> -1: Extraction has been completed but errors were encountered. In this case the extraction isn't exhaustive, you must refer to the attached log file to identify problems.   
For example: Insufficient privileges that limit the course of certain trees, incorrect URLs, ...

# Example

Extraction of one site collection of web application   
.\extractSharepoint -prefix mysharepoint -withItems true -url http://mysitecollection.com

Extraction of several sites collections   
.\extractSharepoint -prefix mysharepoint -withItems false -siteList mylistofsites.txt

Extraction of several web applications   
.\extractSharepoint -prefix mysharepoint -withItems false -webAppsUrlFilename webApplications.txt

# Known limitations

Script don't extract data related to local groups and accounts.   
Due to the volume generated, it is recommended to set "_withItems"_ parameter to false.   
For performance reasons and volume we don't advise to browse the entire tree if the parameter "_withItems_' is set to 'true'.

# See also

[Active Directory extraction script](igrc-platform/add-ons/extraction-scripts/ad-extraction-script.md)
