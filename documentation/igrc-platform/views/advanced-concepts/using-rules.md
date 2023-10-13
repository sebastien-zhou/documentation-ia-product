---
layout: page
title: "Using Rules"
parent: "Views: Advanced Concepts"
grand_parents: "Views"
nav_order: 2
permalink: /docs/igrc-platform/views/views-advanced-concepts/using-rules/
---
---

It may be useful in certain cases to filter the results of an audit view via a rule. This feature can be used to :    

- prepare a customised report for a given rule
- carry out an advanced filtering operation on the results   

To perform this it is sufficient to select the rules to be applied to the various concepts within the Audit View. This operation is carried out by dragging and dropping of the "Filter using a rule" criteria from the toolbox to the selected concept.   

![Mathematical Operations on Results]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/using_rules-1.png "Mathematical Operations on Results")      

Only the rules based on the same component as the view are available.   

It is possible to use multiple rules within a single Audit View. If multiple rules are applied to the same concept, only those lines that are present in all rules will not be filtered out (due to the summing of all rule results). Furthermore, it is possible to use rules to apply configurations. These configurations may either be validated against static values, or against the settings of the Audit View. Finally, it is possible to use rules consisting of configuration settings. These configurations may either be validated against static values, or against the settings of the Audit View.   

![Mathematical Operations on Results]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/using_rules-2.png "Mathematical Operations on Results")      

| **Note**: <br><br> Configuration settings for a rule are entered by double clicking on the name of the setting in the rule label: {param}.|

| **Note**: <br><br> Double clicking on the rule name in the Audit View Editor causes the rule to be opened in the rule editor.|
