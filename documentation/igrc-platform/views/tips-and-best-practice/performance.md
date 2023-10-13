---
layout: page
title: "Performance"
parent: "Tips and Best Practice"
grand_parents: "Views"
nav_order: 4
permalink: /docs/igrc-platform/views/tips-and-best-practice/peformances/
---
---

For performance reasons please choose to configure sorting operations on data contained in Audit Views instead of sorting operations directly in Reports and/or Pages. In this situation the sorting operation is carried out directly at the database level and not in the product, limiting the amount of data transfered.  
In a similar fashion, is is recommended to filter your results in Audit View rather than in reports. In this case the filtering of your data is carried out directly at the database level.
