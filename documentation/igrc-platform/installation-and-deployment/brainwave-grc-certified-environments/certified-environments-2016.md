---
layout: page
title: "Certified Operating Environment for Brainwave Identity GRC Version 2016"
parent: "Brainwave Identity GRC's Certified Environments"
grand_parent: "Installation and deployment"
nav_order: -2
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

Following you will find the list of certified operating environements for Brainwave Identity GRC.      
The following operating systems, databases and web browsers are valid for all versions of the 2016 major release.    

# Operating Systems  

Brainwave Identity GRC is composed of three major components:

- Studio (Brainwave Analytics)
- Batch  
- Web portal  

The OS support matrix is as follows:

| **OS**         | **Version** | **Studio** | **Batch** | **Webportal** |
|:---------------|:------------|:----------:|:---------:|:-------------:|
| Windows        | 8           |   **X**    |   **X**   |     **X**     |
|                | 10          |   **X**    |   **X**   |     **X**     |
| Windows server | 2012 R2     |   **X**    |   **X**   |     **X**     |
| Centos         | 7           |            |   **X**   |     **X**     |
| Debian         | 8           |            |   **X**   |     **X**     |

---

<span style="color:grey">**Note:**</span> Please note that 32bit versions of each operating system are provided for development platforms only. Only 64-bit versions of the Software must be used in a Production environment.

---

# Databases

The following databases are supported with Brainwave Identity GRC:  

- Microsofts SQL server
- Oracle
- Postgres

The database support matrix, detailed operating systems, is as follows:

| **Database**         | **Version** | **Window 10** | **Window Server 2012** | **Centos 7** | **Debian** |
|:---------------------|:------------|:-------------:|:----------------------:|:------------:|:----------:|
| Oracle               | 11g         |               |                        |    **X**     |   **X**    |
| Oracle               | 12c         |     **X**     |         **X**          |              |            |
| Microsoft SQL server | 2012        |               |         **X**          |              |            |
| Microsoft SQL server | 2014        |     **X**     |                        |              |            |
| Postgresql           | 9.5         |     **X**     |                        |    **X**     |   **X**    |

| **Note**: <br><br> Please note that Postgresql support is provided for development platforms only.|

## Database drivers  

The following database drivers are supported with Brainwave Identity GRC :   

- sqljdbc4.jar
- ojdbc6.jar
- ojdbc7.jar  
- postgresql-9.0-801.jdbc4.jar
- jtds-1.2.5.jar

---

<span style="color:red">**IMPORTANT:**</span> Oracle's OCI driver is not supported with Brainwave Identity GRC

---

Oracle and Microsoft drivers are Third-Party Software which are not provided with the Brainwave Identity GRC and must be downloaded separately.

# Java  

The only version of Java supported with Brainwave Identity GRC is Oracle JVM 1.7 64 bits.   
Oracle Java 1.8 is not supported  

# Application server

Apache Tomcat 7 is supported with Brainwave Identity GRC.   
The certified versions ranges from: 7.0.61 to 7.0.67  

# Web browsers

Brainwave Identity GRC supports "long term support" or "For work" versions of major browsers.   
As such, following you will find the list of the supported web browsers:  

## Firefox

The current version of Firefox ESR is supported (Extended Support Release). For more information please refer to the following link:    
[https://www.mozilla.org/en-US/firefox/organizations/faq/](https://www.mozilla.org/en-US/firefox/organizations/faq/)

## Chrome   

The supported version of chrome is the current version of the Chrome Browser for Businesses. See the following link for more information:   
[https://www.google.com/work/chrome/chrome-browser/](https://www.google.com/work/chrome/chrome-browser/)

## Microsoft Edge

The portal is supported of v41 of the web-brower.   
Internet explorer is no longer recommended se : [https://techcommunity.microsoft.com/t5/Windows-IT-Pro-Blog/The-perils-of-using-Internet-Explorer-as-your-default-browser/ba-p/331732](https://techcommunity.microsoft.com/t5/Windows-IT-Pro-Blog/The-perils-of-using-Internet-Explorer-as-your-default-browser/ba-p/331732)
