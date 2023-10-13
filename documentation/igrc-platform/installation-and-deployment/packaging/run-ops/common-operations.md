---
layout: page
title: "Common operations"
parent: "Run-ops"
nav_order: 1
toc: true
---

# Interface URLS

`<hostname>/` will allow the user to navigate to the portal. It will forward to configuration interface if its not possible to load the portal.  

`<hostname>/config` will open the configuration interface. This interface contains the secret manager and license upload location. Please see [here]({{site.baseurl}}{% link docs/igrc-platform/installation-and-deployment/packaging/configuration/config-ui.md %}) for the documentation on the configuration interface.  

`<hostname>/auth` will open Keycloak admin interface.  

`<hostname>/controller` will open the controller UI. Please see [here]({{site.baseurl}}{% link docs/igrc-platform/installation-and-deployment/packaging/containers/controller.md %}) for the controller documentation.  

# CLI operations

Here a list of common operations using the brainwave tools CLI.  

To get the full list of commands type `brainwave --help`. For more information on a detailed action add --help to the desired command. For example `brainwave backup create --help`  

Please find bellow some examples.

* Start the services: `brainwave start`
* Stop the services: `brainwave stop`
* Display log files:  
  * `brainwave logs` to see logs from all containers
  * `brainwave logs bwportal` to see the logs from the portal
  * `brainwave logs bwbatch` to see the logs from the batch
