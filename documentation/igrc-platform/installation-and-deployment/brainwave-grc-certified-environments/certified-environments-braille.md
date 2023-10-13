---
layout: page
title: "Certified Operating Environment for Brainwave Identity GRC Version Braille"
parent: "Brainwave Identity GRC's Certified Environments"
grand_parent: "Installation and deployment"
nav_order: -5
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

Following you will find the list of certified operating environments for Brainwave GRC.    
The following operating systems, databases and web browsers are valid for all versions of the Braille major release.  

# Operating Systems  

Operating Systems are Third Party Software not provided with Brainwave Identity GRC.
Brainwave Identity GRC is composed of three main modules:

- The studio (or back office)
- The batch  
- The web portal  

The OS support matrix is the following:

| **OS**          | **Version** | **Studio** | **Batch** | **Webportal** |
|  :---           |     :---    |     :---:  |    :---:  |     :---:     |
| Windows         | 8           | **X**      | **X**     | **X**         |
| Windows         | 10          | **X**      | **X**     | **X**         |
| Windows server  | 2012 R2     | **X**      | **X**     | **X**         |
| Windows server  | 2016        | **X**      | **X**     | **X**         |
| Windows server  | 2019        | **X**      | **X**     | **X**         |
| Centos          | 7           |            | **X**     | **X**         |
| Centos          | 6           |            | **X**     | **X**         |
| Debian          | 9           |            | **X**     | **X**         |
| Debian          | 8           |            | **X**     | **X**         |

# Database Servers

Database servers are Third Party Software not provided with Brainwave Identity GRC.   

The following database servers are supported by Brainwave GRC:    

- Microsofts SQL server
- PostgreSQL
- Oracle[^1]

The database support matrix, per operating systems, is as follows:   

| **Database**         | **Version** | **Window 10** | **Window Server 2012** | **Windows server 2016** | **Windows server 2019** | **CentOS 7** | **Debian 8** |
|:---------------------|:------------|:-------------:|:----------------------:|:-----------------------:|:-----------------------:|:------------:|:------------:|
| Microsoft SQL server | 2012        |               |         **X**          |                         |                         |              |              |
| Microsoft SQL server | 2014        |     **X**     |         **X**          |                         |                         |              |              |
| Microsoft SQL server | 2016        |               |         **X**          |          **X**          |                         |              |              |
| Microsoft SQL server | 2017        |               |                        |          **X**          |                         |              |              |
| Microsoft SQL server | 2019        |               |                        |                         |          **X**          |              |              |
| PostgreSQL           | 10          |               |                        |                         |                         |    **X**     |    **X**     |
| PostgreSQL           | 11          |               |                        |                         |                         |    **X**     |    **X**     |
| PostgreSQL           | 12          |               |                        |                         |                         |    **X**     |    **X**     |
| Oracle[^1]           | 12c         |     **X**     |         **X**          |                         |                         |    **X**     |              |
| Oracle[^1]           | 19c         |     **X**     |         **X**          |                         |                         |    **X**     |              |


> <span style="color:red">**IMPORTANT:**</span> Please note that as of version Braille, Oracle is only supported in the case of existing and deployed projects. In the case of a new project only Microsoft SQL server and PostgreSQL are supported.

## Database drivers  

The following database drivers have been certified with Brainwave GRC:    

- mssql-jdbc-7.4.1.jre8.jar
- ojdbc8.jar
- postgresql-42.0.0.jar
- jtds-1.2.5.jar

> <span style="color:red">**IMPORTANT:**</span> Oracle's OCI driver is not supported by Brainwave GRC

Oracle and Microsoft SQL JDBC drivers are Third Party Software not provided with Brainwave Identity GRC.
Please refer to the following pages for information on how to download and install the drivers :
- [How-To install and use Microsofts SQL server official driver](how-to/database/sqlserver/install-sql-server-driver.md)
- [How-to install and use the official Oracle database driver](how-to/database/oracle/install-orcl-database-driver.md)

# Java Runtimes  

Java Runtimes are Third Party Software not provided with Brainwave Identity GRC.   
Please see the following table for more information on the support version of JAVA :    

|                        | **Windows**[^2] | **Linux  Centos 7** | **Linux  Debian 8** |
|:----------------------:|:---------------:|:-------------------:|:-------------------:|
|   **Java SE JDK 8**    |      **X**      |                     |                     |
|   **Java SE JRE 8**    |      **X**      |                     |                     |
|     **Open JDK 8**     |                 |        **X**        |        **X**        |
|     **Corretto 8**     |      **X**      |                     |                     |
| **AdoptOpenJDK 8 LTS** |      **X**      |                     |                     |

As a reminder the product only runs on the version 8 of Java regardless of the editor.

> Note: When downloading AdoptOpenJDK only the HotSpot JVM is supported

# Java Application Server

The Java Application Server is Third Party Software not provided with Brainwave Identity GRC.   
Apache Tomcat 8.5 (all Operating Systems) is the only application server supported by Brainwave GRC.    

# Web browsers

Web Browsers are the only web browsers supported by Brainwave GRC are the "long term support" or the "For work" versions. As such, following you will find the list of the supported web browsers.   

## Firefox

The current version of Firefox ESR is supported (Extended Support Release). For more information please refer to the following link:    
[https://www.mozilla.org/en-US/firefox/organizations/faq/](https://www.mozilla.org/en-US/firefox/organizations/faq/)  

## Chrome

The supported version of chrome is the current version of the Chrome Browser for Businesses. See the following link for more information:   
[https://www.google.com/work/chrome/chrome-browser/](https://www.google.com/work/chrome/chrome-browser/)

## Microsoft Edge

The portal is supported starting version v41 of the web-brower.   
Internet explorer is no longer recommended see : [https://techcommunity.microsoft.com/t5/Windows-IT-Pro-Blog/The-perils-of-using-Internet-Explorer-as-your-default-browser/ba-p/331732](https://techcommunity.microsoft.com/t5/Windows-IT-Pro-Blog/The-perils-of-using-Internet-Explorer-as-your-default-browser/ba-p/331732)

---

[^1]: Please note that as of version Braille, Oracle is only supported in the case of existing and deployed projects. In the case of a new project only Microsoft SQL server and PostgreSQL are supported.

[^2]: all versions of java 8 