---
layout: page
title: "Parametrization"
parent: "Brainwave's web portal"
grand_parent: "Installation and deployment"
nav_order: 3
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# JNDI configuration

In order not to include the database connection credentials in the WAR file you can choose to configure it to use an external JNDI source. For this you have to choose the option **use a JNDI data source™** in the technical configuration window.   

![JNDI data source’](../images/webportal-JNDIConfig.png "JNDI data source’")

## Generating the JNDI file

The `.xml` file that includes the database credentials is generated by clicking the disk icon outlined in the figure above. You will then be asked to select the destination folder. The generated file will have the following format:

```
<?xml version="1.0" encoding="UTF-8"?>
<Context override="true" path="/demo-jndi">
    <Manager pathname="" />
    <Valve className="org.apache.catalina.authenticator.FormAuthenticator" landingPage="/portal"/>
    <Resource
        name="jdbc/BRAINWAVEDB"
        auth="Container"
        type="javax.sql.DataSource"
        maxActive="15"
        maxIdle="5"
        maxWait="5000"
        testOnBorrow="true"
        testOnReturn="false"
        testWhileIdle="false"
        validationQuery="SELECT 1"
        validationInterval="30000"
        autoReconnect="true"
        driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
        username="igrc"
        password="__PASSWORD__"
        url="jdbc:sqlserver://localhost:1433;databaseName=QA_sqlserver"
    />
    <Resource
        name="jdbc/BRAINWAVEWORKFLOWDB"
        auth="Container"
        type="javax.sql.DataSource"
        maxActive="15"
        maxIdle="5"
        maxWait="5000"
        testOnBorrow="true"
        testOnReturn="false"
        testWhileIdle="false"
        validationQuery="SELECT 1"
        validationInterval="30000"
        autoReconnect="true"
        driverClassName="org.postgresql.Driver"
        username="activiti"
        password="__WFPASSWORD__"
        url="jdbc:postgresql://localhost:5432/activiti"
    />
</Context>
```

The first `<Resource>` bloc corresponds to the options and credentials used to connect to Brainwave's iGRC database. The second `<Resource>` bloc details the credentials and the settings of to the activiti database used within the workflow option. If workflows are not set up the second bloc will not be added.   

A JNDI connection allows activation of additional parameters, such as automatic reconnection to a database (`autoReconnect="true"`).   

## Generating the web application

The JNDI file will also be generated if you click on `Generate web portal`:  
![Webapp generation](../images/webapp_jndi_webapp_deployment.png "Project configuration")  
Both files will be generated in the output directory:  
![Generated files](../images/webapp_jndi_generated_files.png "Generated files")  

## Deployment

In addition to the modification of the technical configuration, the following steps, to be performed in the tomcat instance, are required to use the JNDI configuration:    

1. Shut down the `Tomcat` service
2. Copy the previouslycreated '.xml' into your tomcat instance, in the folder `conf/catalina/localhost/`  
    ![JNDI XML deposit](../images/webapp_jndi_jndi_deposit.png "JNDI XML deposit")  
3. **Update** the connection password(s)  
    ![JNDI XML file](../images/webapp_jndi_jndi_configuration.png "JNDI XML file")  
4. Add the relevant driver to tomcats `/lib` folder to allow connection. The drivers to use are available in the `plugins\com.brainwave.iaudit.database.drivers_1.0.0\drivers` of your igrcanalytics home folder  
    ![SQL driver deposit](../images/webapp_jndi_sql_driver.png "SQL driver deposit")  
5. Move or copy the web application (`.war`) to the Tomcat's `webapp` folder:  
    ![Webapp deposit](../images/webapp_jndi_webapp_deposit.png "Webapp deposit")  
8. Start the Tomcat server and verify that the login page is shown    

> Note that in the log files, the information regarding the Ledger and Workflow databases are not shown when using the JNDI connection:  
![Log result](../images/webapp_jndi_log_result.png "Log result")  

---

<span style="color:red">**Important:**</span> For the JNDI configuration to work it is important that the name of the `.xml` file corresponds to the name of the web application.

 In addition the `hibernate.dialect` defined in the Ledger base tab of the technical configuration during the creation of the datasource in the studio is NOT overridden by the JNDI configuration.
 
 As such, it is important to KEEP the value provided by the Product either in the studio or in the generated `datasource.properties` file.

---

For more information on JNDI connectors please refer to Tomcat's documentation, section **JDBC Data Sources** : [https://tomcat.apache.org/tomcat-8.5-doc/jndi-resources-howto.html](https://tomcat.apache.org/tomcat-8.5-doc/jndi-resources-howto.html)  


# Encrypt Tomcat Datasource passwords

By default the JNDI datasource password is not encypted. Brainwave provides the user with an methodology that allows password encryption.

## Generate the encrypted password

To encrypt the tomcat Datasource passwords it is necessary executre the following step. the latest version of the jar file is attached at the bottom of this page.

First navigate to the folder `<tomcat_home>\lib` and copy the `bw-tomcat-addon.jre8-X.X.jar` downloadable [here](https://download.brainwavegrc.com/index.php/s/t9xSWdjiDcZeMWn)

Then using the newly copied file, create the encryption key file using the following command line (Line breaks have been added for readability):

```
java -jar bw-tomcat-addon.jre8.jar generateKey AES 256
    <tomcat_home>\conf\db.key
```

finally, use this key to encrypt password of your database access using the following command line: 

```
java -jar bw-tomcat-addon.jre8.jar encryptPassword <clear password>
    AES ECB PKCS5PADDING
    <tomcat_home>\conf\db.key
```

To see the other options included in the jar file please use the following command:

```
java -jar bw-tomcat-addon.jre8.jar
```

```
Usage: secure-tomcat-datasourcefactory <command> <options>
Commands:
    listKeyGenerators
    listCiphers
    generateKey <algorithm> <keySize> <keyFilename>
    encryptPassword <password> <algorithm> <mode> <padding> <keyFilename>
```

## Configure datasource for Brainwave web portal

Once the web deployement descriptor (`<project>.xml`) is generated it is necessary to update the desired resource in the generated file to edit the 4 following parameters:

* The `factory` parameter should be updated to `com.github.ncredinburgh.tomcat.SecureDataSourceFactory`
* Check the validity of the `username` parameter
* Update the `password` parameter with the encrypted password
* Add the `connectionProperties` parameters providing the correct algorithms used to generate the key and path to the `keyFilename`

Here is an example of an updated resource tag:
```
    <Resource
        factory="com.github.ncredinburgh.tomcat.SecureDataSourceFactory"
        name="jdbc/BRAINWAVEDB"
        auth="Container"
        type="javax.sql.DataSource"
        maxActive="15"
        maxIdle="5"
        maxWait="5000"
        testOnBorrow="true"
        testOnReturn="false"
        testWhileIdle="false"
        validationQuery="SELECT 1"
        validationInterval="30000"
        autoReconnect="true"
        driverClassName="org.postgresql.Driver"
        username="igrc"
        password="VrIJSyxVpm9+rIiZI5jc2xnvsmXrZBLrtR6h6zTBnrw="
        url="jdbc:postgresql://localhost:5432/schema31"
        connectionProperties="algorithm=AES;mode=ECB;padding=PKCS5PADDING;keyFilename=<tomcat_home>\\conf\\db.key"
    />	
```

---

<span style="color:grey">**Note:** </span> Please remember to apply changes to both the ledger database resource definition and the activiti (workflow) database resource definition

---

# Security access principles

Control access to the web portal is performed in two steps:    

1. Authenticate the user
2. Determine the user's roles. These can be either static or dynamic (as a function of the user context)   

The first step is detailed in the following sections which include the details the portal parametrization.  

---

<span style="color:red">**Important:**</span> In order to access the web portal, a user must be declared in the identity ledger as explained in the section 'Configuration of login and identity ledger user connection'

---

# Authentication configuration

Brainwave's web portal delegates its authentication method to the hosted servlet container. To connect to the web portal the user must answer to the web servers security constraints and possess the role named 'user' from the servlet container's perspective.   

Delegating authentication to the web server simplifies integration with the company's systems as you mutualize security configurations of different applications.   

Web servers have many authentication standards, among others:    

- Internally based
- In a company's directory
- In Active Directory
- In a database
- Via a third party system
- ...

The majority of WebSSO systems available on the market manage the Tomcat java web server authentication method used in Brainwave's software.   

Please refer to your web server's documentation for more information on how to configure the authentication of a web application:   

- Tomcat : [Realm Configuration HOW-TO](https://tomcat.apache.org/tomcat-8.5-doc/realm-howto.html)

# Configuration of login and identity ledger user connection

Once the user authenticated, the web portal will try to look him up in the identity ledger to determine his dynamic roles. For this, the portal uses a specific view of the product. This view takes the user's identifying parameters used during login and returns the users information in the identity ledger. This step is compulsory and in order to allow a user to access the web portal he must be present the activated timeslots identity ledger.   

The default view is located: `/views/webportal/portalidentityview.view`   

![Default view](../images/webportal-view.png "Default view")   

It is possible to use another view by modifying the property tab of the web portal in the technical configuration.    

# Role Configuration

It is possible to personalize the web portal as a function of the user's role. Adapting the presented information as a function of the users profile or perimeter for example:   

- CISO
- Local security correspondent
- Controller
- Internal auditor
- External auditor
- General management
- ...

The configuration of roles is done in iGRC's project under `webportal/features`. The definition is done in a `.role` file.   

![Configuration of roles](../images/webportal-dafultrole.png "Configuration of roles")   

You can add, modify or edit a role using the buttons on the right. A role can contain:   

![Configuration of roles](../images/webportal-featureset.png "Configuration of roles")    

- A name
- A rule to determine the people corresponding to a role
- A rule to determine the perimeter of an identity
- A rule to determine the perimeter of an application
- A rule to determine the perimeter of a repository
- If a role can see the data of a non-activated timeslot
- A description   

Two processes give the user a role:   

- The role is provided by the web container during the authentication phase
- The role is determined dynamically as a function of the user context in the identity ledger.   

To access the portal, the minimum role the user is required to have is **'user'** as defined by the web container. However, the user can have more than one role. A typical case is when using Active Directory to authenticate the user and Active Directory groups to determine roles (see JNDI configuration in Tomcat). The name of the Active Directory group of the user is considered as being equal to the name of the user role. To be taken into consideration the name of the group must be declared in a **'.role** file of your project.   

Roles can also be dynamically assigned as a function of the user's context in the identity ledger. This functionality is very useful when creating roles that depend on the context, such as the role 'application manager', 'organization manager' or 'SAP administrator'. To dynamically parameterize the role you need to create a 'rule' that lists the members of the role and the assign this rule to the depending role via a dialogue box of the role configuration.   

![Role edition](../images/webportal-roleEditing.png "Role edition")    

Once the role is defined, you must create the associated functionality groups. This is done using a `.featuresets` file. Adding a group of functionalities is done by defining a name and a description. The selection of roles that have access to a functionality group is done by selecting the corresponding columns. A green tick will then be shown.   

The functionalities that are part of a same group are defined in the `.features` file that lists the functionalities by group membership.     

A role file can be used as a reference to several functionality files and their associated groups.    

---

<span style="color:red">**Important:**</span> The user MUST possess the **'user'** role to have access to the web portal. This means that if the user must also have access to a specific menu he should have two roles. **'user'** and the role corresponding to the above mentioned menu.

---

# Configuration of the menu items

The menu items are defined in a `.menuitems` file. The file is located in the folder: `webportal/features/`. To add an item to a menu it is necessary to define:    

- A name
- A priority
- A source page
- A functionality
- A description    

![Menu items](../images/webportal-menuitem.png "Menu items")    

For more information on how to build a web page, please refer to the related documentation ([Pages]({{site.baseurl}}{% link docs/igrc-platform/pages/pages.md %})).   

For some example on how to use roles, features, featuresets and menu items please refer to the default project documentation: [Default featuresets and Roles]({{site.baseurl}}{% link docs/igrc-platform/getting-started/default-project/default-featuresets.md %}).