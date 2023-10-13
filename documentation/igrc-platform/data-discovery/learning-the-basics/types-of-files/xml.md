---
layout: page
title: "XML"
parent: "Types of files"
grand_parent: "Learning the basics"
nav_order: 5
permalink: /docs/igrc-platform/data-discovery/learning-basics/types-of-files/xml/
---
---

XML discovery allows you to extract data from an XML type file.   

![XML file](igrc-platform/data-discovery/learning-the-basics/types-of-files/images/1-xml.png "XML file")   
**_Selecting an XML file template_**   

Once the XML wizard has been selected and a file chosen, a wizard appears. It allows you to select the object to extract from the XML file. Object selection is performed with the help of the "Selected elements" setting. This setting must contain an XPATH expression that references the element in question.    

It is also possible to click on the element in the preview pane to fill in this field.   

![XML file 2](igrc-platform/data-discovery/learning-the-basics/types-of-files/images/2-xml.png "XML file 2")   
**_Import of the XML file being processed_**     

The Discovery's attributes correspond to the various attributes of the selected objects.   
Here is an example of attributes extracted on the basis of an XML object that contains XML sub-objects:   

If the selected object contains sub-objects, their attributes are also extracted as attributes. Careful, though: this principle does not handle multiple sub-objects, only 1/1 relationship types. In this case, only one of the sub-objects will be taken into account.

![XML file 3](igrc-platform/data-discovery/learning-the-basics/types-of-files/images/3-xml.png "XML file 3")   
**_Verification of the attributes of the imported XML file_**
