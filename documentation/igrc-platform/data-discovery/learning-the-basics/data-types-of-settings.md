---
layout: page
title: "Data types settings"
parent: "Learning the basics"
grand_parent: "Data discovery"
nav_order: 3
permalink: /docs/igrc-platform/data-discovery/learning-basics/data-types-settings/
---
----

It is possible to change the type of data of an attribute to convert it into another data format. To do so, click on the type column that corresponds to the attribute.   

![Data settings]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/1-data.png "Data settings")   
**_Setting the type of an attribute_**     

The attribute will then be converted into a numerical value, date, or Boolean value as the file is read.   
Format configuration happens in the first tab:   

![Data settings 2]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2-data.png "Data settings 2")    

Regarding the dates, the format to use is the Java Format. To do so, you need to rely on the following table:   

![Table]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/MicrosoftTeams-image.png "Table")    

For example, the format of date like:   

- "12/24/2019 4:23:30 PM" is "MM/dd/yyyy h:mm:ss a" which will be converted to "20191224162330"  
- "24/12/2019 16:23:30" is "dd/MM/yyyy HH:mm:ss" which will be converted to "20191224162330"   

**_Setting the attribute format_**    

_<u>Warning</u>:_ The source file data must be correctly formatted to set a date/Boolean/whole value. If the attributes must be pre-processed or filtered, you must use transformation actions in order to convert these attributes into the right type in new computed attributes.   

![Converting the attribute format to date format]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/4-data.png "Converting the attribute format to date format")    
**_Converting the attribute format to date format_**  


![Creating a Boolean attribute]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/5-data.png "Creating a Boolean attribute")    
**_Creating a Boolean attribute_**
