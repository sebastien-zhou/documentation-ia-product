---
layout: page
title: "ACL extraction script"
nav_order: 1
parent: "Extraction Scripts"
grand_parent: "Add-ons"
permalink: /docs/igrc-platform/add-ons/extraction-scripts/acl-extraction-script/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

This documentation explains howto use the extracrtACL script provided with the bw\_win\_sharedfolders add-on to retrieve the ACLs of your file servers.

# Prerequisites

## Compatibility matrix

| 2014 |  |  |  | 2015 |  |  2016 |  |
|  R1  | R2 |  R3 |  R4 |  R1 |  R2 |  R1 |  R2 |
|  No  | No |  No |  No |  No |  No | Yes | Yes |

Versions: bw\_win\_sharedfolders\_2.2 add-on

## ICF Compatibility

This script is compatible with brainwave ICF Powershell connector.

## Dependencies

- The extraction script extractACL.ps1 is located in in bw\_win\_sharedfolders add-on under /extractors/bw\_win\_sharedfolders/.
- ACLs extraction scripts can be executed on the file server or on a remote machine.
- PowerShell 3.0 or greater must be installed on the machine on which the script will be executed.
- The account used for extraction must have the ability to browse the entire tree of files on file server.
- Data ONTAP PowerShell Toolkit must be installed In the case of NetApp shares extraction.

# Procedure

This script takes as input the following parameters:

|-path|Path from where ACL will be extracted. <br>This parameter is required, it can contain either a drive letter or a UNC path or a local path.<br>example:<br>&emsp;-path R:\ <br> &emsp;-path \\fileserver1\share1 <br> &emsp;-path C:\shares\prod|
|-level|Numeric indicating the depth of extraction (default: 3).<br>example:<br>&emsp;-level 3|
|-extractFiles |This parameter contains a Boolean value. If this parameter is set to true, the ACLs of files are extracted, by default only folders ACLs are extracted.<br>**Attention** for performance reasons and volume we don't advise to browse the entire filer tree if the parameter "extractFiles' is set to 'true'.<br> example:<br>&emsp;-extractFiles false|
|-pathToExclude | Reference to a file that contains a list of paths to be excluded during extraction, each path is definedon a line as a string withwildcards (\*), the test is performed relative toabsolute path of mounted share.<br>example:<br>&emsp;-pathToExclude exclusion.txt<br>&emsp;avec exclusion.txt qui contient par exemple :<br>&emsp;&emsp;\*temp\*<br>&emsp;&emsp;R:\travail\*<br>&emsp;&emsp;\*\recycle.bin\*|
|-prefix |Prefix for the generated CSV files.<br>example<br>&emsp;-prefix fileshare|
|-filerType |It is necessary to enhance this parameter if we wish also extract rights positioned on share. In this case, it is imperative that the -path parameter refers to an UNC path.<br>This parameter specifies the filer type of server. Possible values are ' **windows**' or ' **netapp**'.<br> _Data ONTAP PowerShell Toolkit_ must be installed In the case of NetApp shares extraction.|
|-driveLetter |In case of an UNC path is provided in the path parameter,<br> it is necessary to insert an available drive letter. The UNC path will be temporarily mounted on the letter when extracting. |
|-credential |This parameter is required in case we want to extract rights on share and the current account does not have sufficient rights to do that. <br>In this case credential parameter have to reference a file containing the login/password to use to perform the extraction of share rights.<br> **Note** : For NetApp, this parameter is mandatory in all cases.<br> Forprivacy reasons, the username and password are not transmitted in clear text. It is protected in a "Credential" object created using Powershell security features.<br>This input parameter receives a file that contains the "serialized"  version of "Credential" object.<br>You will findin the next chapterof the documentationthe way to create these files.<br>exemple :<br>&emsp;-credential credentialsforserver1prod.xml|

# Expected result

The script generates a CSV file inUTF-8   
> -{prefix}\_FilesACL.csv contains the description of the access rights(ACLs) ofshares, directories and files.   
The script also produces a log file created in extraction directory. This file is namedextractACL\_{date}.logand contains details of theproblems encountered during extraction rights.   

The script sends an exit code:   
> -0: Extraction has been completed without errors   
> -1: Extraction has been completed but errorswere encountered. In this case the extractionisn't exhaustive,you must refer to theattached log fileto identify problems.   
For example:Insufficient privileges that limit the course of sometrees, incorrectURLs, ...

# Credentials file

Using the ExtractACL script may in some cases require the use of username/password pairs. For security reasons these are not transmitted in clear to script, they must first be stored as encrypted filesthen passed as a parameterto the script.   
The process of creating these filesis:   

Enter the command:   
> $credential=Get-Credential   
A dialog box appears, enter the username / password protection   

![Dialog](../images/credential_dialog.png "Dialog")

Enter the following command to save this information in the form:   
> $credential \| Export-CliXml credential.xml

The Information is stored in the credential.xml file, its format is as follows:   

![Credential xml format](../images/credential_xml_format.png "Credential xml format")

It is also possible to create this file without using the graphical interface, the commands used are then the following (creating a credential.xml  file with mylogin,mypassword)

![Create credential](../images/create_cred.png "Create credential")

# Example

Directory ACLs extraction up to level 3   
> .\extractACL.ps1 -path R:\ -level 3 -prefix PRE

Extracting the ACLs of directories and files up to Level 2, except somepaths     
> .\extractACL.ps1 -path R:\ -level 2 -extractFiles true -prefix PRE -pathToExclude exclude.txt

ExtractionACLs on share, directories and files up to level 3 of a windows server   
> ;.\extractACL.ps1 -path \\server\share -extractFiles true -prefix PRE -level 3 -filerType windows -credential sharecred.xml

Extraction ACLs for share, directories and files up to level 3 of a Windows server with a temporary mounted drive   
> .\extractACL.ps1 -path \\server\share -extractFiles true -prefix PRE -level 3 -filerType windows -driveLetter W

Extraction ACLs of a local drive   
> .\extractACL.ps1 -path c:\applications -prefix PRE -level 1

# Known limitations

Script can extract only shares rights for Windows and NetApp filers.

# See also

[Active Directory extraction script]({{site.baseurl}}{% link docs/igrc-platform/add-ons/extraction-scripts/ad-extraction-script.md %})
