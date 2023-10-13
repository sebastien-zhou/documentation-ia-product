---
layout: page
title: "Technical Architecture"
parent: "Brainwave's web portal"
grand_parent: "Installation and deployment"
nav_order: 1
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Introduction

The web portal is a 2.0 web service that follows the Java J2EE standards (JSP, Servlet). This application is provided in the form of a WAR file, a package to be deployed in your instance of a tomcat server.    

The web service can include all configuration settings and information pertaining to the audit project or point directly to the studio's workspace. The data, however, is contained in a database (the identity ledger) and can be accessed by the web service using a JDBC connection (the technical nature of the connection is dependent of the type of database used).    

The security of the application is delegated to the java web server on which it is installed. This is done while respecting the JAAS standard:    

- Stream encryption
- User Authentication
- User role management   

The web service is based on the model of roles.   

# 1.2 Compatible server environments

A list of supported environments by the software Brainwave Identity GRC can be found at the following link: [Download]({{site.baseurl}}{% link docs/downloads.md %})
