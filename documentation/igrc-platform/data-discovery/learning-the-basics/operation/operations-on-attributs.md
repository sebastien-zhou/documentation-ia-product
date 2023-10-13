---
layout: page
title: "Operations on attributes"
parent: "Operations"
grand_parent: "Learning the basics"
nav_order: 3
permalink: /docs/igrc-platform/data-discovery/learning-basics/operations-on-attributes/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Renaming an attribute

You can change an attribute's name by choosing "Rename Attribute".   

![Rename Attribute]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2016-05-11 15_29_23-.png "Rename Attribute")   

In the dialog that opens, you just have to write the new name you want to give to the attribute.   

![Rename Attribute 2]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2016-05-11 15_31_49-Renaming attribute samaccountname.png "Rename Attribute 2")   

Before you click OK, clicking on "Preview \>" gives you a list of files impacted by the renaming.   

![Rename Attribute 3]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2016-06-29_18_18_08-Renaming_attribute_samaccountname.png "Rename Attribute 3")   

Here we can see that two files will be impacted: the discovery file we are using, and the collector that was using the attribute that was renamed. This means that the product will change the name in the collector file automatically in addition to changing it in the discovery.    

When there are modifications on another file as in this case, the other file will be closed if it was opened in another tab.   

# Renaming attribute values

You can rename attribute values on the fly. To do so, select the appropriate value(s) in the lower left part of the editor, right-click, and choose "Replace selected values."

![Renaming a list of attributes]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2-operations.png "Renaming a list of attributes")   
**_Renaming a list of attributes_**   

An editor opens and allows you to set the replacement value(s).   

![Setting the replacement value of a list of attributes]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/3-operations.png "Setting the replacement value of a list of attributes")   
**_Setting the replacement value(s) of a list of attributes_**    

# Ignore this attribute in collector line

You can ignore attributes that will not be in the collector file, in order to have less clutter when selecting them.   
There are two ways of doing this:  

- you can select the attribute and press "DEL"
- or you can right click the attribute and select "Ignore this attribute in collector line (DEL)   

![Ignore this attribute in collector line]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2016-05-11 16_03_36-.png "Ignore this attribute in collector line")   

The attribute will not be shown by default anymore. If you want to see ignored attributes, you can do so by clicking on the "eye" icon in the top right corner of the attribute list:   

![Ignore this attribute in collector line]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2016-05-11 16_08_55.png "Ignore this attribute in collector line")   

The ignored attributes will appear, you can tell them apart because they will be greyed out.

# Use this attribute in collector line

Of course, the opposite operation is also possible. For this you have to select the ignored attribute (it should be greyed out) that you want to use again, right click and choose "Use this attribute in collector line (INS)":   

![Ignore this attribute in collector line]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2016-05-11 16_39_11-.png "Ignore this attribute in collector line")   

The attribute will be back with the used attributes and you will be able to select it in the collector file.   
