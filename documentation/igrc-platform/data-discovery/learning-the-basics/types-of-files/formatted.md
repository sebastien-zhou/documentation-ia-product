---
layout: page
title: "Formatted"
parent: "Types of files"
grand_parent: "Learning the basics"
nav_order: 4
permalink: /docs/igrc-platform/data-discovery/learning-basics/types-of-files/formatted/
---
---

Formatted files are often text report type files from centralized sites (Mainframe). They don't contain separators; fields are identified by their position (characters 1 to 8 = field 1, characters 9 to 15 = field 2...)

![Formatted file]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/types-of-files/images/2016-06-29_11_43_29-iGRC_Reports_-_iGRC_Analytics.png "Formatted file")   
**_Selecting FORMATTED file template_**    

Once the FORMATTED wizard has been selected and the file chosen, a wizard displays the various options.    

![Formatted file 2]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/types-of-files/images/2016-06-29_12_06_41-iGRC_Properties_-_toto_discovery_test_excelfile.png "Formatted file 2")   
**_Import of the Formatted file being processed_**  

It is possible to specify:   

- the file encoding
- the separation character used for multivalued attributes
- whether the file contains a header line with column names
- whether it needs to skip X lines before starting to process the file
- whether only certain rows of the file should be taken into account. Filtering is then performed with a regular expression. This setting may be useful in the case of a "dump" file from a central site that contains many elements of a varying nature.   

If you wish to adjust the column selection, just place the cursor in the right spot in the preview area, and then click on the "Set/Remove a Separation" button.

![Formatted file 3]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/types-of-files/images/2016-06-29_14_45_39-iGRC_Project_-_iGRC_Analytics.png "Formatted file 3")    
**_Verification of the attributes of the imported FORMATTED file_**
