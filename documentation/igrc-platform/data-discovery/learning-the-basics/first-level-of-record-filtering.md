---
layout: page
title: "First level of record filtering"
parent: "Learning the basics"
grand_parent: "Data discovery"
nav_order: 2
permalink: /docs/igrc-platform/data-discovery/learning-basics/record-filtering/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Skip the X first records

This setting allows you to skip X lines (or X records in the case of formatted data such as LDIF files) before starting the processing.   

![Record]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/1-export.png "Record")   
**_Ignoring the first X records_**    

# Select a maximum of X records

This setting allows you to limit the analysis to the first X records.  
We recommend that you use this setting when you are setting up your Discovery on large files (\>100MB) in order to limit the analysis to the first few records. This will allow you to have a more reactive configuration interface when you are setting up the Discovery.   

![Record 2]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/2-export.png "Record 2")   
**_Limit the analysis to the X first records_**   

# Filtering with a query in SQL format

It is possible to select only a subset of records. Do this by using a query in SQL format. You will find the corresponding documentation in the "Collector Configuration Guide."   
Note that this first-level filtering does not start any event or rejection; it is only used for preselecting data. If you wish to perform data rejection, to process data quality issues, for example, we suggest that you use the "rejection" actions, as these will allow you to associate events with rejections in order to generate log files.    

![Record 3]({{site.baseurl}}/docs/igrc-platform/data-discovery/learning-the-basics/images/3-export.png "Record 3")   
**_Filter using a query format_**
