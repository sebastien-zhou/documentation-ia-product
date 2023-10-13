---
layout: page
title: "Update an attribute value"
parent: "Learning the basics"
grand_parent: "Data discovery"
nav_order: 9
permalink: /docs/igrc-platform/data-discovery/learning-basics/update-attribute-value/
---
---

It is possible to update an attribute's value from the discovery interface.   
This action is different from the other discovery actions because it will modify the actual value of the attribute, not create a new one.   

Similarly to computed attributes, the update can contain static or dynamic values. Dynamic values can rely on any other values of the current record. The component uses JavaScript macro syntax laid out in the "Collector Guide."    
To update an attribute's value, right-click on the attribute and select "Update an atribute value".   

![Updating an attribute's value]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2016-04-13_19_31_04-.png "Updating an attribute's value")   
**_Updating an attribute's value_**   

You can also use conditions, which can be generated   

![Updating an attribute]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2016-04-13_19_18_37-Replace_each_value_of_the_list.png "Updating an attribute ")   
**_Updating an attribute to 'true' for rows with a 'cn' starting by 'systemmailbox'_**   

The keyboard shortcut "Ctrl+Space" allows you to display the JavaScript query wizard.    
A wizard is also present on the right side of the "Condition" setting. It enables you to configure the conditions without needing to write the corresponding JavaScript code.   

![JavaScript query assistant]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/3-update.png "JavaScript query assistant")   
**_JavaScript query assistant_**
