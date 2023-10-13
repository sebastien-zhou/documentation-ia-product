---
layout: page
title: "Installation modes"
parent: "Before installation"
grand_parent: "Packaging"
toc: true
---

The brainwave tools cli allows to use two different installation modes:

- Desktop mode
- Server mode

To use the server mode, the initialization command is: `brainwave install`.  
For desktop mode the command is: `brainwave init`.

> :warning: In PROD, only server mode is supported  
> :warning: On windows environments, only desktop mode is supported

# Desktop Mode

Desktop mode allows the user to create different projects on their environment. Each project is independent from one another.  

> For more detailed information on the installation steps for each environnement please refer to the dedicated pages  
> [Installation procedures](igrc-platform/installation-and-deployment/packaging/installation.md){: .ref}

To Start and stop the project instance deployment use the following commands:  

- `brainwave start`
- `brainwave stop`

> <span style="color:grey">**Note:**</span> While the project instance is stopped, all data persists.  

The data is stored in `docker volumes`. Volumes are prefixed using the `project name`. So its possible to have multiple projects on the same environment without conflicts. Location of the volume data in disk is completely managed by Docker. You should use the `Docker for Desktop` UI to find and explore the volumes.  

> :warning: Due to performance limitations and port allocation, it is **NOT** possible to have more than 1 project **running** at the same time

# Server Mode

This mode is only supported in Linux environments and its the recommended mode for server install.

In server mode, a single instance can exists. There is no notion of project.

> For more detailed information on the installation steps for each environnement please refer to the dedicated pages  
> [Installation procedure](igrc-platform/installation-and-deployment/packaging/installation.md){: .ref}

The installation will use the following directories:  

- `/etc/brainwave`
- `/var/lib/brainwave`
- `/usr/local/brainwave`
- `/var/log/brainwave`

For more information on the above mentioned folder please see the [requirements](igrc-platform/installation-and-deployment/packaging/before-installation/requirements.md#docker-host-disk) page.  

To start the services use `brainwave start`  
To stop the services use `brainwave stop`  

> :warning: Using `brainwave admin destroy` in server mode is not recommended. In any case, **none** of the persistent data in brainwave directories will be destroyed.

# Backup

Before backing up the data, stop the services using the command `brainwave stop`.  

# Which mode should I use?

If you are using Windows as OS, only the desktop mode is supported.  

In a Linux environment, both mode are supported however server mode is recommended.  
