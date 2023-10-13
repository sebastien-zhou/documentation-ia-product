---
layout: page
title: "Troubleshooting"
parent: "Batch configuration and usage"
grand_parent: "Installation and deployment"
nav_order: 3
permalink: /docs/igrc-platform/installation-and-deployment/batch-configuration-and-usage/toubleshooting/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# ORA-01882: timezone region not found

## Symptom

When executing the batch command `igrc_batch.sh` using a Linux operating system you come across the following error:   
```
Fatal error in step create-sandbox: org.springframework.transaction.CannotCreateTransactionException: Could not open Hibernate Session for transaction; nested exception is org.hibernate.exception.GenericJDBCException: Cannot open connection
org.springframework.transaction.CannotCreateTransactionException: Could not open Hibernate Session for transaction; nested exception is org.hibernate.exception.GenericJDBCException: Cannot open connection
    at org.springframework.orm.hibernate3.HibernateTransactionManager.doBegin(HibernateTransactionManager.java:596)
    at org.springframework.transaction.support.AbstractPlatformTransactionManager.getTransaction(AbstractPlatformTransactionManager.java:371)
    at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:127)
    at com.brainwave.iaudit.database.service.ServiceRegistry.executeInReadOnlyTransaction(ServiceRegistry.java:181)
    at com.brainwave.iaudit.database.service.ServiceRegistry.getDatabaseVersion(ServiceRegistry.java:516)
    at com.brainwave.iaudit.loader.model.ProjectModelLoader.getDatasource(ProjectModelLoader.java:351)
    at com.brainwave.iaudit.collector.runtime.CollectorEngineRunner.createSandbox(CollectorEngineRunner.java:610)
    at com.brainwave.igrcanalytics.batch.Batch.start(Batch.java:129)
    at org.eclipse.equinox.internal.app.EclipseAppHandle.run(EclipseAppHandle.java:196)
    at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.runApplication(EclipseAppLauncher.java:134)
    at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.start(EclipseAppLauncher.java:104)
    at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:382)
    at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:236)
    at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
    at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)
    at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke(Method.java:606)
    at org.eclipse.equinox.launcher.Main.invokeFramework(Main.java:648)
    at org.eclipse.equinox.launcher.Main.basicRun(Main.java:603)
    at org.eclipse.equinox.launcher.Main.run(Main.java:1465)
    at org.eclipse.equinox.launcher.Main.main(Main.java:1438)
Caused by: org.hibernate.exception.GenericJDBCException: Cannot open connection
    at org.hibernate.exception.SQLStateConverter.handledNonSpecificException(SQLStateConverter.java:140)
    at org.hibernate.exception.SQLStateConverter.convert(SQLStateConverter.java:128)
    at org.hibernate.exception.JDBCExceptionHelper.convert(JDBCExceptionHelper.java:66)
    at org.hibernate.exception.JDBCExceptionHelper.convert(JDBCExceptionHelper.java:52)
    at org.hibernate.jdbc.ConnectionManager.openConnection(ConnectionManager.java:449)
    at org.hibernate.jdbc.ConnectionManager.getConnection(ConnectionManager.java:167)
    at org.hibernate.jdbc.JDBCContext.connection(JDBCContext.java:160)
    at org.hibernate.transaction.JDBCTransaction.begin(JDBCTransaction.java:81)
    at org.hibernate.impl.SessionImpl.beginTransaction(SessionImpl.java:1473)
    at org.springframework.orm.hibernate3.HibernateTransactionManager.doBegin(HibernateTransactionManager.java:555)
    ... 20 more
Caused by: java.sql.SQLException: ORA-00604: error occurred at recursive SQL level 1
ORA-01882: timezone region not found

    at oracle.jdbc.driver.T4CTTIoer.processError(T4CTTIoer.java:450)
    at oracle.jdbc.driver.T4CTTIoer.processError(T4CTTIoer.java:392)
    at oracle.jdbc.driver.T4CTTIoer.processError(T4CTTIoer.java:385)
    at oracle.jdbc.driver.T4CTTIfun.processError(T4CTTIfun.java:938)
    at oracle.jdbc.driver.T4CTTIoauthenticate.processError(T4CTTIoauthenticate.java:480)
    at oracle.jdbc.driver.T4CTTIfun.receive(T4CTTIfun.java:655)
    at oracle.jdbc.driver.T4CTTIfun.doRPC(T4CTTIfun.java:249)
    at oracle.jdbc.driver.T4CTTIoauthenticate.doOAUTH(T4CTTIoauthenticate.java:416)
    at oracle.jdbc.driver.T4CTTIoauthenticate.doOAUTH(T4CTTIoauthenticate.java:825)
    at oracle.jdbc.driver.T4CConnection.logon(T4CConnection.java:596)
    at oracle.jdbc.driver.PhysicalConnection.<init>(PhysicalConnection.java:715)
    at oracle.jdbc.driver.T4CConnection.<init>(T4CConnection.java:385)
    at oracle.jdbc.driver.T4CDriverExtension.getConnection(T4CDriverExtension.java:30)
    at oracle.jdbc.driver.OracleDriver.connect(OracleDriver.java:564)
    at java.sql.DriverManager.getConnection(DriverManager.java:571)
    at java.sql.DriverManager.getConnection(DriverManager.java:187)
    at org.hibernate.connection.DriverManagerConnectionProvider.getConnection(DriverManagerConnectionProvider.java:133)
    at org.hibernate.jdbc.ConnectionManager.openConnection(ConnectionManager.java:446)
    ... 25 more
```

This indicates most likely a configuration issue of the Linux operating system as the Java Virtual machine is not capable of finding a valid timezone and as a result passes the wrong value to the Oracle driver.  

## Resolution

To solve this issue without changing the operating system configuration you can force the time zone in the the Java virtual machine you have to add the following option to the `JAVA_OPT` of the `igrc_batch.sh` :    
`-Duser.timezone=GMT+1`   

Remember to change the value of the parameter to correspond to you actual time zone.  
