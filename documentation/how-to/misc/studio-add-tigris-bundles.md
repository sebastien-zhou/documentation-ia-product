---
layout: page
title: "How to add the Tigris bundles to iGRC Analytics"
parent: "Miscellaneous how-to's"
grand_parent: "How-to"
nav_order: 1
permalink: /docs/how-to/misc/studio-add-tigris-bundles/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

The Tigris plugins that provide the SVN bundles used in the studio are based on a GPL licence. As such, for legal reasons these plugins have been removed from the installation binaries as of versions:

- 2017 R2 SP4

If you wish to continue to use SVN as your version management system it is necessary for you to download the corresponding bundles and add them to your installation of Brainwave GRC.

# Prerequisites

This methodology is applicable to Version 2017 R2 SP4 and upwards.

# Procedure

## Download

The following link provides you with the download links compatible the the version of the studio used :   
[http://subclipse.tigris.org/servlets/ProjectDocumentList?folderID=2240&expandFolder=2240&folderID=5146](http://subclipse.tigris.org/servlets/ProjectDocumentList?folderID=2240&expandFolder=2240&folderID=5146)   

The version to download is `site-1.8-22.zip`.   
If you wish to directly download the bundles please use the following link :   
[http://subclipse.tigris.org/files/documents/906/49280/site-1.8.22.zip](http://subclipse.tigris.org/files/documents/906/49280/site-1.8.22.zip)

Once the correct version downloaded you should have all the following plugins :

- com.collabnet.subversion.merge\_3.0.13.jar
- com.trilead.ssh2\_1.0.0.build216\_r152\_v20130304\_1651.jar
- net.java.dev.jna\_3.4.0.t20120117\_1605.jar
- org.tigris.subversion.clientadapter.javahl.win64\_1.7.10.jar
- org.tigris.subversion.clientadapter.javahl.win32\_1.7.10.jar
- org.tigris.subversion.clientadapter.javahl\_1.7.10.jar
- org.tigris.subversion.clientadapter.svnkit\_1.7.9.2.jar
- org.tigris.subversion.clientadapter\_1.8.6.jar
- org.tigris.subversion.subclipse.core\_1.8.22.jar
- org.tigris.subversion.subclipse.doc\_1.3.0.jar
- org.tigris.subversion.subclipse.graph\_1.1.1.jar
- org.tigris.subversion.subclipse.mylyn\_3.0.0.jar
- org.tigris.subversion.subclipse.tools.usage\_1.1.0.jar
- org.tigris.subversion.subclipse.ui\_1.8.21.jar
- org.tmatesoft.sqljet\_1.1.7.r1256\_v20130327\_2103.jar
- org.tmatesoft.svnkit\_1.7.9.r9659\_v20130411\_2103.jar

They are location in the `\plugins` folder of the zip file.

## Installation

To install the Tigris component it is necessary to:

> 1) Copy/paste the following jar files to the `/plugins` folder in the home installation folder of iGRC Analytics :

- com.collabnet.subversion.merge\_3.0.13.jar
- com.trilead.ssh2\_1.0.0.build216\_r152\_v20130304\_1651.jar
- net.java.dev.jna\_3.4.0.t20120117\_1605.jar
- org.tigris.subversion.clientadapter.javahl\_1.7.10.jar
- org.tigris.subversion.clientadapter.svnkit\_1.7.9.2.jar
- org.tigris.subversion.clientadapter\_1.8.6.jar
- org.tigris.subversion.subclipse.core\_1.8.22.jar
- org.tigris.subversion.subclipse.doc\_1.3.0.jar
- org.tigris.subversion.subclipse.graph\_1.1.1.jar
- org.tigris.subversion.subclipse.mylyn\_3.0.0.jar
- org.tigris.subversion.subclipse.tools.usage\_1.1.0.jar
- org.tigris.subversion.subclipse.ui\_1.8.21.jar
- org.tmatesoft.sqljet\_1.1.7.r1256\_v20130327\_2103.jar
- org.tmatesoft.svnkit\_1.7.9.r9659\_v20130411\_2103.jar

> 2) Unzip to a folder the `org.tigris.subversion.clientadapter.javahl.winXX_1.7.10.jar` JAR file and copy it the `/plugins` folder in the home installation folder of iGRC Analytics. The folder must have the same name as the JAR file.


| **Important** <br><br> The JAR file to unzip is based on the OS version of the machine used to run the studio :<br><br>- In the case of 32bits machines please use : `org.tigris.subversion.clientadapter.javahl.win32_1.7.10.jar`<br>- In the case of 64bits machines please use : `org.tigris.subversion.clientadapter.javahl.win64_1.7.10.jar`|
