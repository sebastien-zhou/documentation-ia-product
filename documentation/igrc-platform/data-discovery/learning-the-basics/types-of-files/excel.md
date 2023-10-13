---
layout: page
title: "Excel"
parent: "Types of files"
grand_parent: "Learning the basics"
nav_order: 2
permalink: /docs/igrc-platform/data-discovery/learning-basics/types-of-files/excel/
---
---

EXCEL discovery allows the analysis of files in Microsoft XLS or XLSX format. EXCEL discovery allows the analysis of both spreadsheets and pivot tables.   

![Excel file]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/types-of-files/images/2016-06-29_11_43_20-iGRC_Reports_-_iGRC_Analytics.png "Excel file")   
**_Selecting an Excel file template_**      

Once the EXCEL wizard has been selected and the file chosen, a wizard displays the various options, and it is possible to:   

- select the sheet to process (by its name or an order number)
- indicate which row the table starts on
- indicate which column the table starts on
- indicate up to which row the table should be processed
- indicate which column the table ends on
- indicate whether the table contains a header row

![Excel file 2]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/types-of-files/images/2016-06-29_11_52_08-iGRC_Reports_-_iGRC_Analytics.png "Excel file 2")    
**_Import of the Excel file being processed_**      

It is also possible to process pivot tables with the option "All data must be gathered in a multivalued attribute starting with column X." If this option is checked, all the values starting in column X are gathered in a multivalued attribute. A second multivalued attribute is created with the corresponding header rows.   

![Excel file 3]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/types-of-files/images/2016-06-29_11_54_01-iGRC_Reports_-_iGRC_Analytics.png "Excel file 3")     
**_Verifying the attributes of the imported Excel file_**   

This pre-processing, associated with actions on the multivalued attributes (5.2) and the collector numbering component, allows the analysis and loading of data from pivot tables.
