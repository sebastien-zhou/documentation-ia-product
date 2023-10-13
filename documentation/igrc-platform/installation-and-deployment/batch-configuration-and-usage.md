---
layout: page
title: "Batch configuration and usage"
parent: "Installation and deployment"
grand_parent: "iGRC Platform"
nav_order: 3
has_children: true
permalink: /docs/igrc-platform/installation-and-deployment/batch-configuration-and-usage/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Batch script list  

Upon installation of Brainwave GRC a number of batch script files (`.cmd` files for a windows environment and `.sh` files for a linux environment) are included in the the iGRC analytics home folder:    

- [**igrc\_batch.cmd**](#igrc_batch) : to execute the entire execution plan  
- **igrc\_auditlog.cmd**: to execute the data loading of auditlogs  
- **igrc\_extract.cmd**: to execute the extraction of data 
 - [**igrc\_cli.cmd**](#igrc_cli) : command line interface for project and facet deployment
- **igrc\_facetbuild.cmd**: to build a facet  
- **igrc\_notify.cmd**: to launch a notification campaign  
- **igrc\_purge.cmd**: to execute a purge of specified data  
- **igrc\_sqlscript.cmd**: to export the necessary sql scripts to create or update IGRC databse, create or update Activity databse and export custom indexes creation script
- **igrc\_validate.cmd**: to validate an activated timeslot  
- **igrc\_workflow.cmd**: to launch Ã workflow
- **igrc\_portal.cmd**: to export web portal
- **igrc\_project.cmd**: to export project
- **igrc\_archive.cmd**: to export project archive  

The following page provide information on how to use and configure these features :[Command files](igrc-platform/installation-and-deployment/batch-configuration-and-usage/command-files.md)

# Automatic data loading - igrc_batch {#igrc_batch}

For more information on how to configure Brainwave GRC to perform automatic data loading please use the following steps. These steps are given for a Windows environment, please adapt accordingly if you wish to use a Linux environment.

## Installation and planning

In order to access batch mode, iGRC Analytics must be installed on the computer. The home installation includes the `igrc_batch.cmd` script that runs all steps of the execution plan as configured in the technical configuration within the project. The executed steps are defined in the Execution plan tab :   

![Installation and planning](igrc-platform/installation-and-deployment/images/batchEpConfiguration.png "Installation and planning")   

Once the execution plan is completed, the command 'igrc\_batch.cmd' ends and returns control.

## Configuration

In order to run the execution plan via batch mode the following elements are required:   

- The project
- The data files (extracted from different repositories)
- A valid technical configuration defined in the project
- A valid licence for product license

The project to be executed must be copied in the product installation directory workspace and the data files must be placed in the appropriate directory. The licence file must be located in the configuration directory that will be used in the command line statement. It is therefore necessary to create a directory (for example: `c:\igrcanalytics\igrc_config`), where technical configuration files will be placed.      

In the technical configuration of your project it is necessary to define the database to use in the Ledger base tab:   

![Configuration](igrc-platform/installation-and-deployment/images/batchBaseConfiguration.png "Configurationg")   

All parameters and elements configured in the technical configuration are automatically used when executing the execution plan in batch mode. It is nevertheless possible to use the legacy properties files to override the information provided by the technical configuration. To be taken into account when execution the batch command these `.properties` files must be place in the same folder as your valid licence file. These files can automatically be created base on a technical configuration by using the export to properties functionality in the Variables tab of the technical configuration:   

![Configuration](igrc-platform/installation-and-deployment/images/batchExportProperties.png "Configurationg")   

| **Note**: <br><br> As the information present in the `.properties` files overwrites the values provided in the technical configuration the best practice is to use this methodology only for sensitive data, such as DB connection credentials or passwords.|

See [here](igrc-platform/installation-and-deployment/batch-configuration-and-usage/legacy-property-files.md) for more information on the `.properties` configuration.  

## Command line

The command line requires at least 3 parameters :   

- The project name: for example demo  
- The absolute path to the configuration directory. This directory MUST contain the licence file and can contain `.properties` files to override the information provided in the technical configuration
- The name of the technical configuration to use  

As an example: `igrc_batch.cmd demo "c:\igrcanalytics\igrc_config" default`

| **Note**: <br><br> When running the batch command without any parameters defined a message is displayed providing informantion on how to use said command:|

```
"Expecting at least 3 parameters: <project name> <config directory path> <config name> [SIMULATE]. Aborting..."
"usage: igrc_batch <project name> <config folder> <config name> [SIMULATE]"
"<project name> is the project name"
"<config directory path> can contain several of these files:"
"       - project.properties: file containing project configuration variables"
"       - datasource.properties: file containing database connection configuration"
"       - mail.properties: file containing mail server connection configuration"
"       - workflow.properties: file containing workflow database connection configuration"
"       - license.lic: file containing the Brainwave product license"
"<config name> is the name of the configuration (defined in a project .configuration file)"
"[SIMULATE] simulation mode nothing will be written in Database"
"Command line example: igrc_batch demonstration /var/igrc/config default SIMULATE"
"Another example: igrc_batch demonstration /var/igrc/config default"
```

## Execution

The command `igrc_batch.cmd` goes through the following steps:

- Verification of the license and display of the key of no license is found.
- Launching the steps of the execution plan in accordance with the project settings
- Creation of a zip file containing all of the logs generated, and deletion of all the log files.
- [Optionnal] Sending of a message to administrators, along with an attachment containing the zip file with the logs. This is defined in the Batch tab of the technical configuration

The zip file contains a file called `result-XXXXXXX.txt`, which gives the overall results of the operation, as well as any errors, if found.

| **Note**: <br><br>  It is possible to remove the log files and/or the event files from the email sent to the administrators once the batch execution is terminated. Please see the Batch tab of the technical configuration for more information. |

## Sequencing the execution

Run the windows task scheduler and configure a batch execution task 'igrc\_batch' to the desired frequency.

# Command Line Interface - igrc_cli {#igrc_cli}
The purpose of **igrc_cli.cmd** script is to automate the deployment and testing of igrc projects and facets.
igr_cli allows to execute either one or a sequence of commands targetting a given igrc_project.

igrc_cli provides two modes of operations:
1. list of commands in a file
1. single inline command

## 1. file mode
### Syntax
```
igrc_cli <project> <config> <file>
```
- **project** name of the target project
- **config** absolute path to directory containing license.lic valid Brainwave license file
- **file** relative (to the script directory) or absolute path file to a file containing the list of commands to execute. File can have any extension.

### Command List

**import_project** : imports an existing project into the workspace

Arguments: none  

Requirements:
- the project directory and files are present in the workspace

Result: 
- if the project does not already exist inside the workspace, creates the target project in the workspace.
- otherwise, does nothing.

**install_facets** installs facets into a project

Arguments: none

Requirements:
- the project exists in the workspace ( cf. import_project) 
- the facets to install and all their dependencies are present in the library/facets folder of the project
- project must have at least one configuration

Result:
- facet files that are not already installed will be installed,
  - facets variables will be set to their default values and copied to all project configurations 
- already installed facets are ignored.  
- facets already installed in a lower version:  not supported ( result is unpredictable) 

Notes  
- facets are checked for dependencies and an error is reported if a dependency is missing.
- facets are installed in alphabetical order. This is not an issue, except:
  - if there are colliding files in non-facetted facets 
  - if facet expressions (in variables or javascript) references dependant facets variables.

### Example:

`igrc_cli.cmd MyProject c:\licences\igrc c:\scripts\deploy.txt`

deploy.txt
```
import_project
install_facets
```

## 2. Single command mode

```
igrc_cli -c <command> <project> <config> [<arguments>]
```

Command and arguments are any valid command in the command file.
