---
layout: page
title: "Detail Pages"
parent: "New Webportal Features"
grand_parent: "Pages"
nav_order: 2
permalink: /docs/igrc-platform/pages/new-webportal-features/detail-pages/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

![Detail Pages](../images/img2.png "Detail Pages")

# What is New in the Detail Pages?

In older versions (pre 2015), the detail functionality was provided by BIRT reports. Now, the details of an element are provided by a Detail Page with a new user interface.   

The Detail pages display what is considered to be the most relevant information of the element. At the same time, it includes links to reports and pages to obtain more information.   

# How to link to a Detail Page?

The recommended way to link to a Detail Page is to use the default Detail Activity as follows:   

![Link to a Detail Page](../images/img3.png "Link to a Detail Page")

However, it can also be linked to as any other page using **GoTo Page**.   

# Which Parameters are Required?

The only mandatory parameter is the **UID**, the name of the parameter changes according to the concept following the format: **paramConceptUid**.     
Some examples: **paramAccountUid** , **paramIdentityUid** , **paramPermissionUid**.   

Detail pages support the new search and navigation system, and for that reason they accept the optional parameters: [paramSearchMode and serialized searchs](igrc-platform/pages/new-webportal-features/search-pages-and-navigation-system.md).

# How to add more links to the Detail Pages?

There is no need to modify the Detail Pages in order to link to new reports or pages. As detail pages implement the [tagging system](igrc-platform/pages/new-webportal-features/tagging-system-for-pages-and-reports.md), it is enough to properly tag the new reports/pages following the [default tags an comply with the requirements.](igrc-platform/pages/new-webportal-features/links-to-reports-and-pages-from-detail-pages.md)    
