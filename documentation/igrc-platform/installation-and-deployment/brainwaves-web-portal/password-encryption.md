---
layout: page
title: "Password encryption"
parent: "Brainwave's web portal"
grand_parent: "Installation and deployment"
nav_order: 8
toc: true
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Digest method

For Basic form AuthN using a flat file, the password is set in clear in the `tomcat-users.xml` file, which is not a good practice for security purposes.

However, a hash of this password can be configured and put in this file.

To do that, here is the steps to follow:  
* Under the `$tomcat_home/conf/server.xml` Tomcat configuration file    
    * In the `UserDatabaseRealm` realm, add the `CredentialHandler` element with appropriate configuration  

```xml
<Engine name="Catalina" defaultHost="localhost">
   <Realm className="org.apache.catalina.realm.LockOutRealm">
      <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
         <CredentialHandler className="org.apache.catalina.realm.MessageDigestCredentialHandler" algorithm="sha-256"/>
      </Realm>
   </Realm>
</Engine>
```

* In a shell console
    * Use the **digest** utility (located under `$tomcat_home/bin` folder) to generate the SHA-256 hash of the password :  

```bash
./digest.sh -a sha-256 -h org.apache.catalina.realm.MessageDigestCredentialHandler <YOUR_PASSWORD>
```

> **Note:**
> Hash algorithm must be consistent between the Tomcat configuration and the **digest** utility execution   
> Extension of **digest** utility depends on the OS (`digest.bat` on Windows, `digest.sh` on Linux)
> Extension of **digest** utility depends on the OS (`digest.bat` on Windows, `digest.sh` on Linux)

The output should show the hash result of your password:  

```
<YOUR_PASSWORD>:93ab5662ab2c66561d2e8af2402534efbc60f9811e770a307aee2d7684767881$1$aa0b6c1be9d8b1b86a60dbef5e0440f3f41a7872681303504d95baa446577096
```

* Copy/Paste the hash result in the `$tomcat_home/conf/tomcat-users.xml` flat file for the appropriate user  

```xml
<?xml version='1.0' encoding='UTF-8'?>
<tomcat-users>
   <user username="ACKER11" password="93ab5662ab2c66561d2e8af2402534efbc60f9811e770a307aee2d7684767881$1$aa0b6c1be9d8b1b86a60dbef5e0440f3f41a7872681303504d95baa446577096" roles="user,igrc_administrator"/>
</tomcat-users>
```

* Restart the Tomcat process to take the modification into account the changes

# JNDI Datasource Encryption

A method has been developed to allow the encryption of the passwords used in the JNDI data source.  

This method is included in the tomcat add-ons developed by Brainwave. The JAR file `bw-tomcat-XXX-addons.XXX.jar` must be added to the `\lib` folder of the tomcat installation (`<TOMCAT_HOME>`) 

> The following steps should only be done when you deploy initial version of Web Portal or if you need to update key (in that case don’t forget to encrypt your password again with the new key)

## Encryption Key creation 

1.	Connect to the web server 
2.	Go to folder `<TOMCAT_HOME>\lib` and open a command-line window
3.	Create encryption key for your Tomca instance using the following command line:

```java
java -jar bw-tomcat-addon.jre8-2.0RC4.jar generateKey AES 256 <TOMCAT_HOME>\conf\db.key
```

This key will be used to encrypt passwords of datasource and used by Tomcat to decrypt database service account password. Ensure that your setup appropriate security on the location of the key.


## Encrypt Tomcat Datasource passwords

1.	Navigate to the folder `<TOMCAT_HOME>\lib`
2.	Use the previously generated key to encrypt password of your database access using the following command line. Do this for both, Identity Ledger & Workflow service account passwords.

```java
java -jar bw-tomcat-addon.jre8-2.0RC4.jar encryptPassword <clear password> AES ECB PKCS5PADDING <TOMCAT_HOME>\conf\db.key
```

The encrypted value will be used in next steps.

### Update datasource with encrypted credentials

Copy the automatically generated `<webapp>.xml` to the folder `<TOMCAT_HOME>\conf\Catalina\localhost`


The deployment descriptor that contains JNDI data source information from generated iGRC Studio looks like this:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Context override="true" path="/webapp">
   <Manager pathname="" />

   <Valve className="org.apache.catalina.authenticator.FormAuthenticator" landingPage="/portal" characterEncoding="UTF-8" />

    <!-- Identity Ledger Database connections pool -->
    <Resource
        factory="org.apache.tomcat.jdbc.pool.DataSourceFactory"
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
        username="__USER__"
        password="__PASSWORD__"
        url="jdbc:sqlserver://__HOSTNAME__:__PORT__;databaseName=__DATABASE__"
    />

   <!-- Workflow Database connections pool -->
    <Resource
        factory="org.apache.tomcat.jdbc.pool.DataSourceFactory"
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
        driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
        username="__USER__"
        password="__PASSWORD__"
        url="jdbc:sqlserver://__HOSTNAME__:__PORT__;databaseName=__DATABASE__"
    />
</Context>
```

Edit this file to change/add parameters corresponding database information
* `factory: com.github.ncredinburgh.tomcat.SecureDataSourceFactory`
* `connectionProperties: algorithm=AES;mode=ECB;padding=PKCS5PADDING;keyFilename=<TOMCAT_HOME>/conf/db.key`
* `username`: change with the appropriate values (one for Identity Ledger and one for workflow)
* `password`: copy paste the encrypted values from command described [here](#encrypt-tomcat-datasource-passwords)
* `url`: the url to the database including the `__HOSTNAME__`: your database server name, `__PORT__`: your database listen port, and `__DATABASE__`: your database instance name

After update, you should have deployment descriptor that looks along the lines of:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Context override="true" path="/webapp">
   <Resources cachingAllowed="true" cacheMaxSize="512000" />
   <Manager pathname="" />

   <!-- Identity Ledger Database connections pool -->
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
      driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
      username="__USER__"
      password="__ENCRYPTED_PASSWORD__"
      url="jdbc:sqlserver://__HOSTNAME__:__PORT__;databaseName=__DATABASE__"

      connectionProperties="algorithm=AES;mode=ECB;padding=PKCS5PADDING;keyFilename=<TOMCAT_HOME>/conf/db.key"
    />

   <!-- Workflow Database connections pool -->
    <Resource
      factory="com.github.ncredinburgh.tomcat.SecureDataSourceFactory"
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
      driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
      username="__USER__"
      password="__ENCRYPTED_PASSWORD__"
      url="jdbc:sqlserver://__HOSTNAME__:__PORT__;databaseName=__DATABASE__"

      connectionProperties="algorithm=AES;mode=ECB;padding=PKCS5PADDING;keyFilename=<TOMCAT_HOME>/conf/db.key"
    />   
</Context>
```

Once all modifications applied restart the tomcat service.