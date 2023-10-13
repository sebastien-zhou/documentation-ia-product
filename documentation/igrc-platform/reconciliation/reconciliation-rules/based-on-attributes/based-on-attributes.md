---
layout: page
title: "Reconciliation rules based on attributes"
parent: "Reconciliation rules"
grand_parent: "Reconciliation"
nav_order: 1
permalink: /docs/igrc-platform/reconciliation/reconciliation-rules/based-on-attributes/
---

A reconciliation rule is created by configuring attribute search criteria. The available search criteria depend on the concept that is selected in the rule editor. In order to make it easier to select the criteria they are ordered by category.    
Please note that not all the search criteria available on the system apply to reconciliation rules. Reconciliation rules only apply to certain specific attributes (login, unique ID, mail, etc.).     
Search criteria based on attributes use test operations.      
The following test operations are used the most in the creation of reconciliation rules:    

- `is` : Strict equality test (corresponds to the '=' operator).   

Example of use: creation of a reconciliation rule based on the **'HR Code'** (User unique id) attribute   

![Search criteria with the is test operator](../images/worddav95f769ddbdb1bb81fc755a160f297fa2.png "Search criteria with the is test operator")    

- **looks like:**  Specific test on strings of characters: Verifies whether a string looks like to the string given as a parameter.   

Example of use: Creation of a reconciliation rule based on the **'mail'** attribute   

![Search criteria with the looks like test operator](../images/worddav77d23571c1278f969deb39a1eb36fef4.png "Search criteria with the looks like test operator")    

- **is similar** : Specific test on strings of characters: verifies whether a string is close to the string given as a parameter, with a few differences.   

Example of use: Creation of a reconciliation rule based on the **'full name'** attribute   

![Search criteria with the is similar test operator](../images/worddavf27bbf3352396e4f96bd370e88e1a370.png "Search criteria with is similar test operator")    

This rule makes it possible, for example, to reconcile an account whose full name is Jacques DUPONT with the identity Jacques DUPOND)   
