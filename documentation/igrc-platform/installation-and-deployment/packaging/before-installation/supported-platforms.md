---
layout: page
title: "Supported Platforms"
parent: "Before installation"
grand_parent: "Packaging"
toc: true
---

Please find below the list of supported plate forms and modes :

| Platform   | Mode           | Configuration             |
| :--------- | :------------- | :------------------------ |
| Windows 10 | Desktop        | WSL2 + Docker for Desktop |
| Linux      | Server/Desktop | server mode recommended   |

> Please note that for linux environments server mode is recommended.  

If you require more information on the available modes please refer to the following pages :

[Installation modes](igrc-platform/installation-and-deployment/packaging/before-installation/installation-modes.md){: .ref}

# Architectures

The only supported architectures are:  

* x86-64
* x64
* amd64
* intel64

# Production

Production environments are only supported on Linux. All other environments are to be used exclusively for development or testing purposes.  

Tested distributions are:  

* Debian 11
* Ubuntu Server
* CentOS 7
* Amazon Linux
* Fedora

# Docker Runtime

For further information on Docker please refer to the installation guides:  
[https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/)

> :warning: In server mode, please uninstall the docker runtime delivered by your distribution if any is installed by default ( snap , apt , yum ).  
> These docker runtimes are either outdated or they don't have enough rights. They are not suitable for a server install.  
> Please follow the server installation guides provided by [docker](https://docs.docker.com/engine/install/)  
