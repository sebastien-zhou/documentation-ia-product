---
layout: page
title: "Computed columns"
parent: "Views: Advanced Concepts"
grand_parents: "Views"
nav_order: 4
permalink: /docs/igrc-platform/views/views-advanced-concepts/computed-columns/
---
---

It is possible to define columns with a dynamically calculated value based on their values and the values of other columns in the Dataset.    
This is particularly useful when the user wishes to carry out pre-processing on data for layout or analysis in a report.     
Calculated columns are added via the "Calculated columns" properties tab of the editor view:   

![Computed columns](igrc-platform/views/advanced-concepts/images/computed_columns-1.png "Computed columns")        

Column values are consolidated using JavaScript syntax.     
The dataset object provides access to current columns. It should be noted that the script is executed on each result line to calculate the column value and therefore it is helpful to prepare scripts that take into account possible NULL values for columns by the `dataset.isEmpty('columnname')` expression.     

When adding a computed column definition the following window is opened. In this windows you configure the calculated column:      

![Computed columns](igrc-platform/views/advanced-concepts/images/computed_columns-2.png "Computed columns")        

The calculated columns are then added to the displayed results:     

![Computed columns](igrc-platform/views/advanced-concepts/images/computed_columns-3.png "Computed columns")        
