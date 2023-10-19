---
layout: page
title: "Patch Apache Log4j"
parent: "iGRC Analytics"
grand_parent: "Installation and deployment"
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

> <span style="color:red">**Important:**</span> As of **Curie R3**, Log4j has been updated to version 2.17.2 as a result the following patch is **ONLY** relevant for clients using a version prior to Curie R3.
>  
> For more information on the updated libraries please refer to the following page:  
>
> [Updated libraries](downloads/updated-libraries.md)  

# Context

Many questions have risen following the discovery of the vulnerability CVE-2021-44832. Please note that the version currently used of apache Log4j is **NOT** affected by this version.  

Brainwave has decided to fork the current version of Log4j to correct the following vulnerabilities:  
- CVE-2022-23302
- CVE-2022-23305
- CVE-2022-23307
- CVE-2019-17571
- CVE-2020-9488
- CVE-2021-4104

Please find bellow the official communication from Brainwave GRC:  

[letter Log4j (EN)](./pdf/letter_Log4J_20220207.pdf)  

[courrier Log4j (FR)](./pdf/courrier_Log4J_20220207.pdf)

The following page details the procedure necessary to patch the Log4j.  

> <span style="color:red">**Important**</span> Before upgrading your environment it is **recommended**  to **backup**  your iGRC directory (Studio) and webapp.  

# Prerequisites

:warning: The bat script **MUST** be executed on the same drive as the home installation of the product.

## Compatibility matrix

This process is valid from the ADER to Curie R1 versions. The new version of log4j 1.2.17 is embedded in Curie R2 version.  

> Please note that if you upgrade to a later SP it is **necessary** to re-apply the patch.  

## Limitations

The following patch can **ONLY** be applied to the studio in Windows. As a result the patched WAR file can **ONLY** be generated in a Windows environment. It is not possible to generate a patched WAR file in linux.  

> Please note that a WAR file generated in a Windows environment can be deployed on a tomcat installed on a Linux server.  

# Procedure

To patch the desired version please apply the following steps:  

1.  Download [br_patch_log4j_v2.zip](./scripts/br_patch_log4j_v2.zip) file
2.  Unzip the `br_patch_log4j.zip` file into the desired directory
3.  In a CMD or Powershell window Run from within this directory the following command where `IGRC_HOME` is the installation directory containing the `igrcanalytics.exe` binary file:
```
./patch_log4j.bat <full path to IGRC_HOME>
```
4.  Export and deploy the new webapp in the tomcat application server

# Patch validation

The patch replaces all occurrences of `org.apache.log4j_1.2.XX.jar` with the following file: `org.apache.log4j_1.2.17.br20220208.jar`  

In order to validate the changes to the file you can use the following hashes:  

```
Algorithm : SHA256
Hash      : AB9ABB7EEC0FDF66EF12B09809ECC60AF79E6AAC19FA831D3EEE8517F8CA4BF3

Algorithm : SHA512
Hash      : ED9838DAFCBC5D44E3A139E95DCFD61EA1B1275D1371DBFB0FC7CB40FBD73DE1291478986B680F1823442A7CD2DAD26AFA82672AAA5E8EF269734983A84D7659

Algorithm : MD5
Hash      : 4FCCB311B6693FCD9507F9793A534349
```
