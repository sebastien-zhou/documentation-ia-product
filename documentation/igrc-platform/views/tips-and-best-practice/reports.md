---
layout: page
title: "Reports"
parent: "Tips and Best Practice"
grand_parents: "Views"
nav_order: 3
permalink: /docs/igrc-platform/views/tips-and-best-practice/reports/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

Brainwave Identity GRC provides many pre-configured and multi-format reports for security and compliance services. These reports allow these services to navigate through the data and conduct many analyses allowing them to rationalize permissions and reduce operational risks.     
It is often necessary to adapt the information presented to the client context. For this reason Brainwave Identity GRC incorporates a powerful report editor allowing you to customize existing reports or even to create your own reports.      
Brainwave Identity GRC reports are based on the Open Source BIRT solution (BI Reporting Tool) from the eclipse community.   

You will find a complete online BIRT documentation in English integrated within Brainwave Identity GRC. This documentation is available by pressing F1 and clicking on the 'Content' section.   



| **Important**: <br><br>  The BIRT online documentation is the reference documentation for the report editor. Brainwave documentation allows you to get started with the report editor and highlights the specificities related to Brainwave Identity GRC. If you want to use advanced settings in BIRT, we suggest you consult the reference materials in English after reading this documentation.|

The following sites can provide you with more information on BIRT:   

- BIRT Community Site: [http://www.birt-exchange.org/org/home/](http://www.birt-exchange.org/org/home/)
- Eclipse Official site: [http://www.eclipse.org/birt/](http://www.eclipse.org/birt/)
- Books and documentation: [http://www.birt-exchange.org/org/wiki/index.php?title=BIRT\_Books](http://www.birt-exchange.org/org/wiki/index.php?title=BIRT_Books)

For those who wish to go further, among the many reference books available, we recommend reading the book "BIRT: A Field Guide" :   

Title: BIRT: A Field Guide      
Publisher: Addison Wesley     
3rd edition (February 9, 2011)      
Language: English    
ISBN-10: 0321733584     
ISBN-13: 978-0321733580   

# Differences between the standard version of BIRT and Brainwave Identity GRC

Brainwave Identity GRC relies on the BIRT solution for all layout actions and report creation, allowing you to capitalize on skills already acquired on the BIRT open source solution. The BIRT solution has nevertheless been extended to facilitate the creation and maintenance of relationships within Brainwave Identity GRC.

# Dedicated data source

BIRT is a reporting solution capable of putting together information from many sources: files, SQL databases, data from the Cloud (Hadoop), ... This concept is represented in the 'Dataset' concept in the report editor. Brainwave Identity GRC extends the functionality of BIRT standards by providing a dedicated information source to the product (Dataset). This data source has the distinction of being configurable without requiring prior knowledge of SQL and without technical knowledge of the data model. This concept is called 'Audit View' in the Brainwave Identity GRC solution. Many audit views are available to those in security services when they wish to generate new reports. It is also possible to create new audit views in order to adjust settings for particular reports.

# Templates and wizards

In order to facilitate the creation of new reports, Brainwave Identity GRC includes many report templates as well as a pre-configured environment for their layout: Main pages, stylesheets, icons, ... Allowing you to create new reports in just a few clicks, without having to reinvent the wheel with each new report.
