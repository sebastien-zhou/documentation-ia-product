---
layout: page
title: "Global filtering"
parent: "Views: Advanced Concepts"
grand_parents: "Views"
nav_order: 6
permalink: /docs/igrc-platform/views/views-advanced-concepts/global-filtering/
---
---

In the product two types of joins are possible LEFT and INNER joins. Please refere to the corresponding documentation for more informaiton ([here](igrc-platform/views/configuring-joins.md).   

When using LEFT type joins, adding filter criteria to secondary elements of a view has a significant impact on the number of elements returned.      
For example, we may wish to generate a view that returns a list of all Identities together with the Active Directory login for each (if available).     
The query should therefore list all identities and their associated Active Directory accounts.   
This should, taken at face value, be achieved via the following View:   

![Global filtering](igrc-platform/views/advanced-concepts/images/global_filtering-1.png "Global filtering")           

This should return all identities and the Active Directory login if available. Using a LEFT type join will ensure that we also retrieve all identities that do not have an Active Directory login.   
In fact, this view returns the following result:   

![Global filtering](igrc-platform/views/advanced-concepts/images/global_filtering-2.png "Global filtering")           

The LEFT join associated with the restriction `code='BRAINWAVE'` returns a complete Cartesian product, which means that the same identity is returned several times.     
If the user wishes to carry out filtering operations using LEFT type joins, the filter criteria should be repositioned to give them a global scope.      
This is achieved using the by checking the 'Global filtering' box in the Filter Criteria configuration window.     
It should be noted that if global filtering is used, it is helpful to apply it to all necessary tests, including on any NULL values that may be returned.     

![Global filtering](igrc-platform/views/advanced-concepts/images/global_filtering-3.png "Global filtering")           

There is no visual difference when global filtering is used, compared to standard filtering, and the view is thus as follows:    

![Global filtering](igrc-platform/views/advanced-concepts/images/global_filtering-4.png "Global filtering")           

Note the use of "or is null" to retrieve identities that do not have an Active Directory account.   
The result is then as expect

![Global filtering](igrc-platform/views/advanced-concepts/images/global_filtering-5.png "Global filtering")           
