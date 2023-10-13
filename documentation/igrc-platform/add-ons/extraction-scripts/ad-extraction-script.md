---
layout: page
title: "Active Directory extraction script"
nav_order: 2
parent: "Extraction Scripts"
grand_parent: "Add-ons"
permalink: /docs/igrc-platform/add-ons/extraction-scripts/ad-extraction-script/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

This documentation explains how to use the ExtractAD script provided with the add-on bw\_activedirectoryto retrieve groups, organizational units and user accounts of an Active Directory.

# Prerequisites

## Compatibility matrix

|  2014 |  |  |  |  2015 |  |  2016 |  |
|  R1 |  R2 |  R3 |  R4 |  R1 |  R2 |  R1 |  R2 |
|  No | No | No | No | No | No | yes | yes |

Versions: bw\_activedirectory\_4.3 add-on

## ICF Compatibility

This script is compatible with brainwave ICF Powershell connector.

## Dependencies

- Requires PowerShell 2.0 or greater.
- ActiveDirectory module: if extraction isn't executed from an ActiveDirectory domain, AD administration tools must be installed to allow extraction(eg: windows 7,8).
- Requires LDIFDE command.

# Procedure

This script takes as input five parameters:   

|-filter|an LDAP filter by default it is: ((\|objectcategory=Person)(objectclass=group))|
|-attributesfile | File that contains the attribute names to exclude or include in the extraction according to the mode parameter<br> (by default, "attributes.cfg"<br>example:<br>&emsp;- attributesfile attributes.txt<br>attributes.txt contain an attribute in each line  for example:<br>&emsp;- dn<br>&emsp;- objectclass<br>&emsp;-accountexpires<br>&emsp;- givenname<br><br>By default this parameters contain mandatory attributes for AD add-on:<br>_"dn","objectclass","accountexpires","badpwdcount","displayname","givenname","lastlogon",<br>"logoncount","lastlogontimestamp","mail","manager","pwdlastset",<br>"samaccountname","sn","whencreated","useraccountcontrol","createtimestamp",<br>"description","grouptype","managedby","modifytimestamp","legacyexchangedn"_ |
|-mode|can be 'include' or 'exclude', by default it's include. If mode is include, <br>only the attributes present in the attributesfile will be taken and if not set script will include mandatory attribute for AD add-on.<br> If mode is exclude, all attributes except the attributesfile will be taken. |
|-servers|File that contains in each line a name of an AD server, <br>if the file is not specified, the script will extract all the ActiveDirectory domains data in the current forest. |
|-ldifde\_port|TCP Port  number used by LDIFDE command ( LDAP(default): <br>tcp 389 ; LDAP SSL: tcp 636 ; GC: 3268 ; GC SSL: 3269 ). |

# Expected result

ActiveDirectory script generates two LDIF files by AD domain

- {DomainNetBiosName}.ldif : generated using AD cmdlet to avoid LDIFDE limitation (1500 group members limit, encoded SID and GUID).
- ldifde\_{DomainNetBiosName}.ldif : generated using LDIFDE command.

The script also produces a log file created in extraction directory. This file is named ExtractAD{date}.log and contains details of the problems encountered during extraction.

# Example

Command example to extract AD data using default mode (include), default attribute list (mandatory attributes for AD add-on) and default filter (extract only users and groups):   
> ./ExtractAD.ps1 -servers 'servers.cfg'   


# Known limitations

No known limitations.

# See also

- [FileShare extraction script](igrc-platform/add-ons/extraction-scripts/acl-extraction-script.md)
- [Sharepoint extraction script](igrc-platform/add-ons/extraction-scripts/sharepoint-extraction-script.md)
- [Exchange extraction script](igrc-platform/add-ons/extraction-scripts/exchange-extraction-script.md)
