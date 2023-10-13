---
layout: page
title: "Managing Audit View Dependencies"
parent: "Views: Advanced Concepts"
grand_parents: "Views"
nav_order: 8
permalink: /docs/igrc-platform/views/views-advanced-concepts/managing-audit-view-depedencies/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

Dedicated tabs within the graphical editor enable you to understand how your Audit View is used by your project:     

- Dependencies
- Usage   

# Dependencies

This tab provides you with a list of files on which the current view is dependent:   

![Dependencies]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/viewdependencies.png "Dependencies")           

# Usage  

The usage tab allows you to browse the files that are dependent, or that use the current view:     

![Usage]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/viewusages.png "Usage")           

This can include a list of reports that use the view to populate it's datasets.  

| **Warning**: <br><br> We recommend **against** modifying the name, number or type of attributes returned by an Audit View when the Audit view is used by Reports.<br><br>This can cause an incompatibly with the data bindings carried out at the report level.|   

The buttons on the top right hand side allow you to :     

- Refresh the data
- Expand the entire dependency/usage tree
- Fold the entire dependency/usage tree
- Display the full reference tree: The operation can be time consuming but allows you to propagate the dependency or usage calculation (see the caption bellow):  

![Usage]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/viewexpandedusage.png "Usage")           
