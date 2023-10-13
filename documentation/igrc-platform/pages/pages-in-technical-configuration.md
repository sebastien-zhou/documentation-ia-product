---
layout: page
title: "Pages in the Technical Configuration"
parent: "Pages"
grand_parent: "iGRC Platform"
nav_order: 2
permalink: /docs/igrc-platform/pages/page-technical-configuration/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

The tab **Web portal** of the technical configuration of your project allows you to customize many options of the webportal and also the behaviour of pages.    

At the same time the tab **Export**  allows you to define whether or not your pages should be included in the .war file generated with the webportal   

# Pages Development

For pages development, it is recommended to tweak the technical configuration to have the pages reloaded automatically. Like this, it is possible to see the changes on-the-fly.   
At the same time, it is also recommended to activate the "debug mode", so that we can inspect values of parameters, variables and other important information while we develop.   

This can be done:   

- Ticking the checkboxes "Activate debug mode" and Automatically reload modified pages in the tab **Web portal**

![Web portal](igrc-platform/pages/images/0201.png "Web portal")   

By default, a timeout interval of 10 seconds is set between pages reload. You can reduce this interval through the `pages.auto-reload.interval` property.  

- Selecting the options to point to current iGRC project directory in the **Export** tab  

With this option, the project will not be embedded in the .war file. The portal will load the files directly from the current directory. We will be working with the same files that are being deployed.    

![Export tab ](igrc-platform/pages/images/0202.png "Export tab ")   

After changing these options in the technical configuration, we can save it, **Generate Web portal** and deploy the portal.   

Our development environment is now ready. The .page files will be read and parsed when the application server is restarted. Changes to existing pages will take effect on-the-fly.   

# Debug Mode

Activating the debug mode as described before, can be useful to inspect the values of parameters and variables of the pages.    
When the debug mode is activated correctly , you will be able to see the icon of a little bug in every page :   

![Debug Mode](igrc-platform/pages/images/0203.png "Debug Mode")     

Clicking on it will display a dialog box with information about the variables and parameters of the page.
