---
layout: page
title: "Certified Operating Environment for Brainwave Identity GRC Version 2015"
parent: "Brainwave Identity GRC's Certified Environments"
grand_parent: "Installation and deployment"
nav_order: -1
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

Following you will find the list of certified operating environements for Brainwave GRC.    
The following operating systems, databases and web browsers are valid for all versions of the 2015 major release of the product.    

# Operating Systems  

Brainwave GRC product can be separated into three distinct categories:    

- The studio (or back office)
- The batch  
- The web portal     

The OS support matrix is the following :

| **OS**         | **Version** | **Studio** | **Batch** | **Webportal** |
|:---------------|:------------|:----------:|:---------:|:-------------:|
| Windows        | 8           |   **X**    |   **X**   |     **X**     |
|                | 10          |   **X**    |   **X**   |     **X**     |
| Windows server | 2012 R2     |   **X**    |   **X**   |     **X**     |
| Centos         | 7           |            |   **X**   |     **X**     |
| Debian         | 8           |            |   **X**   |     **X**     |

---

<span style="color:grey">**Note:**</span> Please note that 32bit versions of each operating system are provided for development platforms only. It is not recommended to use a 32 bit version of the product in a Production environment.

---

# Databases

The following databases are supported by Brainwave GRC:     

- Microsofts SQL server
- Oracle
- Postgres

The database support matrix, detailed operating systems, is as following :   

| **Database**         | **Version** | **Window 10** | **Window Server 2012** | **Centos 7** | **Debian** |
|:---------------------|:------------|:-------------:|:----------------------:|:------------:|:----------:|
| Oracle               | 11g         |               |                        |    **X**     |   **X**    |
| Oracle               | 12c         |     **X**     |         **X**          |              |            |
| Microsoft SQL server | 2012        |               |         **X**          |              |            |
| Microsoft SQL server | 2014        |     **X**     |                        |              |            |
| Postgresql           | 9.5         |     **X**     |                        |    **X**     |   **X**    |

| **Note**: <br><br> Please note that Postgresql support is provided for development platforms only. It is not recommended to use Postgresql in a production environment.|

## Database drivers  

The following database drivers have been certified by Brainwave GRC :      

- sqljdbc4.jar
- ojdbc14.jar
- postgresql-9.0-801.jdbc4.jar
- jtds-1.2.5.jar

---

<span style="color:grey">**Note:**</span> Oracle's OCI driver is not supported by Brainwave GRC

---

# Java  

The only version of Java supported by Brainwave GRC is Oracle JVM 1.7 64 bits.  
Oracle Java 1.8 is not supported  

# Application server

Apache Tomcat 7 is the only application server supported by Brainwave GRC.  
The certified versions range from: 7.0.61 to 7.0.67  

# Web browsers

The only web bowsers supported by Brainwave GRC are the "long term support" or the "For work" versions. As such, following you will find the list of the supported web browsers.  

## Firefox

The current version of Firefox ESR is supported (Extended Support Release). For more information please refer to the following link:   
[https://www.mozilla.org/en-US/firefox/organizations/faq/](https://www.mozilla.org/en-US/firefox/organizations/faq/)

## Chrome

The supported version of chrome is the current version of the Chrome Browser for Businesses. See the following link for more information:   
[https://www.google.com/work/chrome/chrome-browser/](https://www.google.com/work/chrome/chrome-browser/)

## Microsoft Edge

The portal is supported of v41 of the web-brower.   
Internet explorer is no longer recommended se : [https://techcommunity.microsoft.com/t5/Windows-IT-Pro-Blog/The-perils-of-using-Internet-Explorer-as-your-default-browser/ba-p/331732](https://techcommunity.microsoft.com/t5/Windows-IT-Pro-Blog/The-perils-of-using-Internet-Explorer-as-your-default-browser/ba-p/331732)
