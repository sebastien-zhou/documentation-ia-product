---
layout: page
title: "Key points"
parent: "Configuring Joins"
grand_parents: "Views"
nav_order: 1
permalink: /docs/igrc-platform/views/configuring-joins/key-points/
---
---

One of the most useful functions of Audit Views is the capability to draw on links between the concepts of the Identity Ledger to carry out advanced extracts of data.    
It is thus possible for example to retrieve a complete list of identities in a single view, showing for each:   

- Job title and organisations
- Associated accounts
- Associated permissions and applications
- And so on...

This function is implemented via the 'CONCEPT Links' section of the toolbox. This section explains which concept to use as well as the access route to follow where one or more routes are available.  
Once a new concept is placed into the Editor, a click on the concept enables the user to modify the contents of the toolbox to display the attributes and links of the concept as well as to edit the concept.  
This operation is recursive: It is possible to settle on any concept within the editor to establish new links.   

| **Note**: <br><br> It is possible to display the details of a link implemented in the Audit View Editor by placing the cursor over a link. The details of the link appear in the form of a tooltip.  |

| **Important**: <br><br> The names of attributes returned by an Audit View must be unique. We recommend therefore that you systematically apply a prefix to all secondary concepts within your Audit View.|

![Key points]({{site.baseurl}}/docs/igrc-platform/views/configuring-joins/images/6.png "Key points")   

| **Important**: <br><br>  Implementing links between the Concepts within the Main Ledger assists in assigning multi-values to attributes. For example, for each Identity, retrieve in addition the list of accounts available. <br> An Audit View result is systematically a two-dimensional table with single-value attributes. Implementing links between Main Ledger Concepts gives rise to a Cartesian product of the relevant concepts: in the previous example, the result will contain the attributes of the attached identity for each access account. The number of results is therefore equal to (_number of identities_) \* (_number of accounts by identity)_.|
