---
layout: page
title: "Proxy configuration"
parent: "Brainwave's web portal"
grand_parent: "Installation and deployment"
nav_order: 10
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Proxy configuration #

Proxy configuration in web portal is quite sensitive, and a bad configuration may break `html widgets'`.  

> If your are not familiar with what a proxy is, see [Wikipedia](https://en.wikipedia.org/wiki/Proxy_server).  
> In short: `A proxy acts as an intermediary between the clients and the server`  

The proxy is setup in the technical configuration's `Web portal` page:  
![Proxy Configuration](../images/proxy_conf.png)  

Here are some guidelines to correctly set **proxy url** in brainwave configuration:  

  - do not forget protocol (`http://` **or** `https://`)
  - use the frontal web server (proxy) name (**not** the ip adress)
  - do **not** add a final `/`
  - do **not** specify port
  - if you edit the `config.properties` file, do not forget to escape `:` with a `\`.  

Here is a sample configuration for a config.properties file:  

> `proxy.url=https\://brainwave-server.acme.com`  
