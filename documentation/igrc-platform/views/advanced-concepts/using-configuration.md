---
layout: page
title: "Using configuration"
parent: "Views: Advanced Concepts"
grand_parents: "Views"
nav_order: 3
permalink: /docs/igrc-platform/views/views-advanced-concepts/using-configuration/
---
---

It is possible filtering the results of an Audit View using data from outside the view that is then passed as an input to the view. This is particularly useful when the Audit Views are used in report or pages, as this gives context to the result of Audit Views by supplying parameters directly from the reports and/or pages.   

This function is the basis for reports supplied as standard in the Brainwave Identity GRC product. In fact, the range of Audit views supplied in your Project Audit uses these configuration processes.   

View parameters are specified in the Properties Editor of the Audit View.   

![Using configuration]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/using-configuration-1.png "Using configuration")   

A parameter is added to an Audit View by clicking on the 'Add...' button. A dialog box opens, asking the user to select an identifier and a display name for the parameter.   

![Using configuration]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/using-configuration-2.png "Using configuration")   

Once your parameter has been added to the Audit View, it is accessible from the 'Global parameter' field of the Attribute Properties Editor of the Audit View.   

![Using configuration]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/using-configuration-3.png "Using configuration")   

Attributes with values filtered by a parameter appear have a unique appearance in the Audit View Editor: parameters are blue and underlined.   

![Using configuration]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/using-configuration-4.png "Using configuration")   

It is possible to set the behaviour to be adopted at the data-filtering levels when the parameter is invalid:   

- Generate an error: a value being mandatory to complete the filtering
- Simply ignore the filter during the audit view process

This is carried out by way of the '_Ignore the filter if the value is blank or invalid'_ check box in the Attribute Properties Editor.     
This function is useful when filters use view parameters because it is possible to pool Audit Views to enable them to meet multiple needs from a reporting perspective. To do so, it is sufficient to have multiple filters configured on the view and to apply the filters to the view parameters.     
The view '_/views/identity/identity.view_' is a good example as this same view is used to:   

- Carry out multi-criteria identity searches;
- Obtain details on any given identity.

![Using configuration]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/using-configuration-5.png "Using configuration")   
