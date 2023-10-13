---
layout: page
title: "Reconciliation rule on a set of attributes"
parent: "Reconciliation rules"
grand_parent: "Reconciliation"
nav_order: 2
permalink: /docs/igrc-platform/reconciliation/reconciliation-rules/based-on-attribute-set/
---

It is possible to combine several search criteria on one Ledger concept. This operation is performed either directly at the level of the selected concept using the **AND/OR graphic**  operator ![AND/OR graphic](../images/1.png "AND/OR graphic")     

![Search criteria with the is test operator](../images/2.png "Search criteria with the is test operator") if you wish to configure a precedence between the operators, or if you wish to perform a 'NOT' operator on the criterion.   
You can choose the operator by double clicking on the concept's AND/OR switch or by selecting the context entry in the 'Toggle operator between criteria (AND/OR)' (Change operator between criteria (AND/OR)) menu. The selected concept links change color according to the operation selected to show you which concept carries the combination. Red links for an <span style="color:red">**AND**</span>  operator, green links for an <span style="color:green">**OR**</span>  operator.

![Example of criteria combinations](../images/2016-07-08_14_50_20-iGRC_Properties_-_demo_reconciliation_test_recon912.reconrule_-_iGRC_Analytics.png "Example of criteria combinations")      

This rule allows you to reconcile accounts whose:   

- owner identity was not identified in the last analysis period.
- <span style="color:red">**AND**</span>  at least one of these conditions are satisfied:
- the email resembles the account user's email
- <span style="color:green">**OR**</span>  the unique id resembles the account user's unique id   
