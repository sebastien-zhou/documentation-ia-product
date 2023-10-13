---
layout: page
title: "Certified Operating Environment for Brainwave Identity GRC Version 2017"
parent: "Brainwave Identity GRC's Certified Environments"
grand_parent: "Installation and deployment"
nav_order: -3
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

Following you will find the list of certified operating environments for Brainwave GRC.    
The following operating systems, databases and web browsers are valid for all versions of the 2017 major release.  

# Operating Systems  

Operating Systems are Third Party Software not provided with Brainwave Identity GRC.
Brainwave Identity GRC is composed of three main modules:

- The studio (or back office)
- The batch  
- The web portal  

The OS support matrix is the following:

| **OS**         | **Version** | **Studio** | **Batch** | **Webportal** |
|:---------------|:------------|:----------:|:---------:|:-------------:|
| Windows        | 8           |   **X**    |   **X**   |     **X**     |
| Windows        | 10          |   **X**    |   **X**   |     **X**     |
| Windows server | 2012 R2     |   **X**    |   **X**   |     **X**     |
| Windows server | 2016        |   **X**    |   **X**   |     **X**     |
| Centos         | 7 & 6       |            |   **X**   |     **X**     |
| Debian         | 8           |            |   **X**   |     **X**     |


---

<span style="color:grey">**Note:**</span> Please note that 32bit versions of each operating system are provided for development platforms only. It is not recommended to use a 32 bit version of the product in a Production environment.

---

# Database Servers

Database servers are Third Party Software not provided with Brainwave Identity GRC.   
The following database servers are supported by Brainwave GRC:    

- Microsofts SQL server
- Oracle
- PostgreSQL

The database support matrix, per operating systems, is as follows:   

| **Database**         | **Version** | **Window 10** | **Window Server 2012** | **Windows server 2016** | **Linux CentOS 7** | **Linux Debian 8** |
|:---------------------|:------------|:-------------:|:----------------------:|:-----------------------:|:------------------:|:------------------:|
| Oracle               | 11g         |     **X**     |                        |                         |       **X**        |       **X**        |
| Oracle               | 12c         |     **X**     |         **X**          |                         |       **X**        |                    |
| Microsoft SQL server | 2008        |               |         **X**          |                         |                    |                    |
| Microsoft SQL server | 2012        |               |         **X**          |                         |                    |                    |
| Microsoft SQL server | 2014        |     **X**     |         **X**          |                         |                    |                    |
| Microsoft SQL server | 2016        |               |         **X**          |          **X**          |                    |                    |
| Microsoft SQL server | 2017        |               |                        |          **X**          |                    |                    |
| PostgreSQL           | 9.6         |               |                        |                         |       **X**        |       **X**        |
| PostgreSQL           | 10          |               |                        |                         |       **X**        |       **X**        |
| PostgreSQL           | 11          |               |                        |                         |       **X**        |       **X**        |

## Database drivers  

The following database drivers have been certified with Brainwave GRC:    

- sqljdbc42.jar
- ojdbc8.jar
- postgresql-42.0.0.jar
- jtds-1.2.5.jar

---

<span style="color:red">**IMPORTANT:**</span> 

1. Oracle's OCI driver is not supported by Brainwave GRC 

2. Oracle and Microsoft SQL JDBC drivers are Third Party Software not provided with Brainwave Identity GRC. Please refer to the following pages for information on how to download and install the drivers :
    - [How-To install and use Microsofts SQL server official driver]({{site.baseurl}}{% link docs/how-to/database/sqlserver/install-sql-server-driver.md %})
    - [How-to install and use the official Oracle database driver]({{site.baseurl}}{% link docs/how-to/database/oracle/install-orcl-database-driver.md %})

---

# Java Runtimes  

Java Runtimes are Third Party Software not provided with Brainwave Identity GRC.   
Supported Java versions are, when using a windows environment, Oracle Java SE 1.8 64 bits and, when using a Linux environment, Open JDK 1.8.   

Please see the following table for more information:    

|                        | **Windows**[^1] | **Linux  Centos 7** | **Linux  Debian 8** |
|:----------------------:|:---------------:|:-------------------:|:-------------------:|
|    **Java SE JDK**     |      **X**      |                     |                     |
|    **Java SE JRE**     |      **X**      |                     |                     |
|      **Open JDK**      |                 |        **X**        |        **X**        |
|     **Corretto 8**     |      **X**      |                     |                     |
| **AdoptOpenJDK 8 LTS** |      **X**      |                     |                     |



---

<span style="color:red">**IMPORTANT:**</span> Oracle Java 1.6 and 1.7 are no longer supported in version 2017 of the product

---

# Java Application Server

The Java Application Server is Third Party Software not provided with Brainwave Identity GRC.   
Apache Tomcat 8.5 (all Operating Systems) is the only application server supported by Brainwave GRC.    

Note that Apache has announced End of Life of Tomcat 8.0. Therefore, we are supporting this temporary version (see detail on Apache site : [https://tomcat.apache.org/tomcat-80-eol.html](https://tomcat.apache.org/tomcat-80-eol.html).   
Apache Tomcat 7 is no longer supported.  

# Web browsers

Web Browsers are the only web bowsers supported by Brainwave GRC are the "long term support" or the "For work" versions. As such, following you will find the list of the supported web browsers.   

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
[^1]: All versions 