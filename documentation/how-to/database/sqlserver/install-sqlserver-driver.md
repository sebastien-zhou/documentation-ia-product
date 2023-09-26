---
layout: "page"
title: "How-To install and use Microsofts SQL server official driver"
parent: "SQL Server how-to's"
grand_parent: "Database how-to's"
nav_order: 2
permalink: /docs/how-to/database/sqlserver/install-sql-server-driver/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context  

The latest versions of the product no longer comes with the **Oracle** and **Microsoft SQL server** drivers included by default in the installation of the product for licensing reasons.  
As such, it is now necessary for you to download from the vendor's site the latest version of the driver and to include it in the product.  

# Prerequisites

This methodology is valid for all versions of the product but is now mandatory as of versions :  

- 2015 R1 SP10
- 2015 R2 SP23
- 2016 R2 SP13
- 2016 R3 SP3
- 2017 R1

# Procedure

## Download the driver

To download the driver navigate to the editors official site : [https://www.microsoft.com/en-us/](https://www.microsoft.com/en-us/)  

Search for the "JDBC drivers for SQL Server". This should display an [MSDN page](https://docs.microsoft.com/en-us/sql/connect/jdbc/microsoft-jdbc-driver-for-sql-server) that will allow you to download the latest version of the JDBC driver for SQL Server:

- [Version 6.2](https://www.microsoft.com/en-us/download/details.aspx?id=55539)

- [Version 6.0](https://www.microsoft.com/en-us/download/details.aspx?displaylang=en&id=11774)  

---

<span style="color:grey">**Note:**</span> Please be sure to download the latest version of the JDBC dirvers

---

Click "Download" and be sure to download the correct version for your operating system (either Windows, `.exe` file, or Linux, `.tar.gz` file).  

Please follow the installation instruction provided by Microsoft copied bellow :  

### Installation instructions

---

<span style="color:grey">**Note:**</span> By downloading the Microsoft JDBC Driver for SQL Server, you are accepting the terms and conditions of the End-User License Agreement (EULA) for this component. Please review the End-User License Agreement (EULA) located on this page and print a copy of the EULA for your records.

---

#### Installation Instructions for the Microsoft Windows version of the JDBC Driver 

1. Download `sqljdbc_<version>_<language>.exe` to a temporary directory.  
2. Run `sqljdbc_<version>_<language>.exe`.  
3. Enter an installation directory when prompted. We recommend that you unpack this zip file in `%ProgramFiles%` with the default directory: "Microsoft JDBC Driver x.x for SQL Server".  

#### Installation Instructions for the UNIX version of the JDBC Driver

1. Download `sqljdbc_<version>_<language>.tar.gz` to a temporary directory.  
2. To unpack the zipped tar file, navigate to the directory where you want the driver unpacked and type `gzip -d sqljdbc_<version>_<language>.tar.gz`.  
3. To unpack the tar file, move it to the directory where you want the driver installed and type `tar -xf sqljdbc_<version>_<language>.tar`.

This will create a folder containing the different .jar files provided by Microsoft. Please use the correct drivers corresponding to your installation of JAVA indicated in the following section.

## Install the driver

### Version 2017 R2 and later

If you are using version 2017 R2 or later please refer to the following article for more information on how to install the driver:    
[How to install SQL server and Oracle JDBC drivers]({{site.baseurl}}{% link docs/how-to/database/install-sql-server-oracle-jdbc-drivers.md %})

### Version 2017 R1 and earlier

Navigate to the following folder in your installation of the product :   
`<Brainwave GRC home installation folder>\plugins\com.brainwave.iaudit.database.drivers_1.0.0\drivers`

Copy the valid version of the downloaded jar file to the folder and rename the file exactly to the name provided in the **README.txt** file.     
The valid versions of the drivers depend on the version of JAVA used to run the product.

### Version of the product that support JAVA 7

- For the version 2015 R1 SP10 use the file **sqljdbc4.jar** or the file `mssql-jdbc-6.2.*.jre7.jar`  
- For the version 2015 R2 SP23 use the file **sqljdbc4.jar** or the file `mssql-jdbc-6.2.*.jre7.jar`
- For the version 2016 R2 SP13 use the file **sqljdbc4.jar** or the file `mssql-jdbc-6.2.*.jre7.jar`
- For the version 2016 R3 SP3 use the file **sqljdbc4.jar** or the file `mssql-jdbc-6.2.*.jre7.jar`

### Version of the product that support JAVA 8

- For the version 2017 R1 use the file **sqljdbc42.jar** or the file `mssql-jdbc-6.2.*.jre8.jar`

---

<span style="color:red">**Important:**</span> It is necessary to rename the jar driver as the name of the driver is hard coded in the product.

**Incorrectly** naming the driver will result in errors.

---

## Launch the product

In order for the changes made to the plugins folder to be taken into account it is necessary to launch the product using the `-clean` option.  

This can be done either using the command line by using the following command in a powershell window (you have to run the command from the home installation folder of the product) :    
`.\igrcanalytics.exe -clean`

Or creating a shortcut where you change the target value to add a `-clean` at the end as displayed in the following caption:  

![Clean Short Cut](../images/cleanShortcut.png "Clean Short Cut")

You can then simply use the product as usual.

# Known limitations

As explained above, it is necessary for you to rename the downloaded driver as this name is hard coded in the product.  
The driver name can change from version to version so please refer to the **README.txt** file to be sure that the correct name is used.  

When using a 1.7 version of Java it is necessary to use the driver named sqljdbc4.jar as the later versions are not supported. Using a later version of the sqljdbc driver will result in the following error when testing the connection :  
```
java.lang.UnsupportedClassVersionError: com/microsoft/sqlserver/jdbc/SQLServerDriver : Unsupported major.minor version 52.0  
   at java.lang.ClassLoader.defineClass1(Native Method)
   at java.lang.ClassLoader.defineClass(ClassLoader.java:800)  
   at java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)  
   at java.net.URLClassLoader.defineClass(URLClassLoader.java:449)  
   at java.net.URLClassLoader.access$100(URLClassLoader.java:71)  
   at java.net.URLClassLoader$1.run(URLClassLoader.java:361)  
   at java.net.URLClassLoader$1.run(URLClassLoader.java:355)
   at java.security.AccessController.doPrivileged(Native Method)  
   at java.net.URLClassLoader.findClass(URLClassLoader.java:354)  
   at java.lang.ClassLoader.loadClass(ClassLoader.java:425)  
   at java.net.FactoryURLClassLoader.loadClass(URLClassLoader.java:789)  
   at java.lang.ClassLoader.loadClass(ClassLoader.java:358)  
   at org.eclipse.datatools.connectivity.drivers.jdbc.JDBCConnection.createConnection(JDBCConnection.java:327)  
   at org.eclipse.datatools.connectivity.DriverConnectionBase.internalCreateConnection(DriverConnectionBase.java:105)  
   at org.eclipse.datatools.connectivity.DriverConnectionBase.open(DriverConnectionBase.java:54)  
   at org.eclipse.datatools.connectivity.drivers.jdbc.JDBCConnection.open(JDBCConnection.java:96)  
   at org.eclipse.datatools.enablement.msft.internal.sqlserver.connection.JDBCSQLServerConnectionFactory.createConnection(JDBCSQLServerConnectionFactory.java:27)  
   at org.eclipse.datatools.connectivity.internal.ConnectionFactoryProvider.createConnection(ConnectionFactoryProvider.java:83)  
   at org.eclipse.datatools.connectivity.internal.ConnectionProfile.createConnection(ConnectionProfile.java:359)  
   at org.eclipse.datatools.connectivity.ui.PingJob.createTestConnection(PingJob.java:76)  
   at org.eclipse.datatools.connectivity.ui.PingJob.run(PingJob.java:59)  
   at org.eclipse.core.internal.jobs.Worker.run(Worker.java:54)
```

# See also  

[How-to install and use the official Oracle database driver]({{site.baseurl}}{% link docs/how-to/database/oracle/install-orcl-database-driver.md %})   
[Brainwave GRC's Certified Environments]({{site.baseurl}}{% link docs/igrc-platform/installation-and-deployment/brainwave-grc-certified-environments.md %})
