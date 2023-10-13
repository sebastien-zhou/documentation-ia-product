---
layout: page
title: "Web portal customization"
parent: "Brainwave's web portal"
grand_parent: "Installation and deployment"
nav_order: 6
has_children: true
---
 
# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Pre-requisits  

The following information is only applicable for the version **2017 R3** of **Brainwave GRC** and on wards.   

For previous versions please refer to the following documentation :  
[How-To customize iGRC Web portal login page]({{site.baseurl}}{% link docs/how-to/web-portal/customize-login-page.md %})

# Introduction

Customizing the Brainwave web portal means modifying different elements of the look and feel, typically to match your company's graphical chart.   
Customization can be done at different levels, ranging fromsimply changing the header logo and title to match your company logo and application, customizing the styles, fonts, colors and images of the portal framing and as far as changing the layout of the portal and even hiding some UI elements or adding your own.   

This chapter explains how to carry out different types of customization for the common use cases.   

There are 4 levels of customization , depending on the techniques and skills involved.   

- **Level 1- Configuration** : via the project technical configuration wizard
- **Level 2 - Css** : technical configuration plus customizing one css file
- **Level 3 - Css with resources** : customizing css file , providing custom image files or font files
- **Level 4 - Java** : same as level 3 plus some simple java coding to modify the display layout   

The table below gives an overview of the different changes that can be achieved at each customization level   

|  **Level** |  **skills** | **Customization tasks / Customizable elements** |
| **Level 1 - Configuration** | project configuration |<br> - Selecting one of the two standard themes (Default and Classic)<br>- Changing the header image logo and title<br>- Changing the background and text colors of the top header<br>- Changing the height of the top header<br>- Changing the background and text colors of different elements in the navigation panel|
| **Level 2 - Css** |  css syntax |<br>- font style (family, size and weight) of the header title<br>- font style of the user name in the header<br>- font style of the navigation menu items , in both normal and selected states.<br>- Changing the global font used in the portal<br>- Changing the styles ( font, background and text colors, border styles ) of different components displayed in pages ( tables, combo box, labels, tabs, etc.)|
| **Level 3 - Css with resources** | css syntax |<br>- Changing the icons used in the header and navigation panel ( eg. user icon, favorite icons, timeslot icon, etc.)<br>- Changing some icons used in components displayed in the page ( eg. checkbox, radio, sort, etc.)
| **Level 4 - Java** | css syntax <br>+ basic java coding |<br>-  Changing the layout of items in the header and the navigation panel<br>- optionally hiding parts<br>- optionally adding custom parts|

_What is beyond the scope of portal theme customization:_

- It is not possible to modify the behavior of standard UI elements of the portal framing. For example, you cannot change the items displayed in standard menus or modify the labels of dynamic buttons.
- Similarly, it's not possible to modify the behavior or layout of widgets inside pages content. For example changing the behavior of a table widget.   
