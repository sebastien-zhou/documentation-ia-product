---
layout: page
title: "Mathematical Operations on Results"
parent: "Views: Advanced Concepts"
grand_parents: "Views"
nav_order: 1
permalink: /docs/igrc-platform/views/views-advanced-concepts/mathematical-operations/
---
---

The audit display engine integrates multiple functions to consolidate and count results. It is thus possible to format complex queries triggering mathematical operations for the purpose of presenting or analysing data.   

Mathematical operations on results are configured at the level of the view's attributes (double click on the parameter or launch a contextual menu and select 'Edit attribute properties'). It is possible to configure multiple mathematical operations on a single Audit View provided that the cardinality of the mathematical operations is identical (e.g., carrying out a count and a sum on the same attribute at the same time).   

![Mathematical Operations on Results]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/1.png "Mathematical Operations on Results")     

Mathematical operations on results are carried out by selecting a consolidation operation via the 'Aggregation function' field. The following consolidation functions are available:   

- Number (COUNT)
- Distinct Number (COUNT DISTINCT)
- Minimum Value (MIN)
- Maximum Value (MAX)
- Average (AVG)
- Sum (SUM)

![Mathematical Operations on Results]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/2.png "Mathematical Operations on Results")     

The mathematical operation appears in the attribute details of the Audit View Editor and is displayed between parentheses to the right hand side of the attribute identifier.    

![Mathematical Operations on Results]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/3.png "Mathematical Operations on Results")     

| **Note**: <br><br> Following you will find a list of reconmendation to setup your mathematical operations :<br><br>1. Use the 'recorduid' attribute when configuring operations to count the number of elements (i.e., 'COUNT', 'COUNT DISTINCT').<br>2. Use the 'COUNT DISTINCT'operation in preference to 'COUNT' unless the user has an extremely strong understanding of the relationships within the Identity Ledger.<br>3. Attributes to which a mathematical operation has been applied should be renamed for additional clarity when editing reports (e.g., 'nbaccounts').|

![Mathematical Operations on Results]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/4.png "Mathematical Operations on Results")     
