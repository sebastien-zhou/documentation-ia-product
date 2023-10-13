---
layout: page
title: "Standardized attribute reconciliation rule"
parent: "Reconciliation rules"
grand_parent: "Reconciliation"
nav_order: 3
permalink: /docs/igrc-platform/reconciliation/reconciliation-rules/standardized-attribute/
---
---

It is possible to reconcile an account with its owner identity by using the user name as the criterion. This operation may fail when faced with compound or accented names.    

Identity information is, in most cases, supplied manually from the HR repository. Errors may therefore occur when entering this information. (For example: Hélène in the identities and Hélène in the accounts, Marie-Françoise in the identities and marie francoise in the accounts, etc.).  

To overcome these irregularities, the reconciliation engine incorporates the notion of **standardized attributes**. The principle consists of eliminating all special characters contained in the composition of the name (examples of special characters are: `ç`, `_`, `'`, `^`, etc.).     

The use of a standardised attribute occurs when configuring reconciliation rules.   
The notion of standardized attributes is applied to **surname, first name**  and **full name**  criteria.  
Example of use: the following rule makes it possible to reconcile accounts whose standardized surname is identical to the surname of the user who owns it. To do this:

- Click on the magnifying glass to make the criteria applicable to the 'Identity' concept appear in the palette
- Open the **'Criteria on identity name'**  section
- Drag and drop the **'surname looks like {surname}''** criterion on the Identity concept
- Click on the **{surname}**  hyperlink and enter the **account user normalized surname (no accentuation)** parameter into the criterion :     

![Example of using a standardized attribute](../images/worddavf67361e79df56847afb329e84f903c1e.png "Example of using a standardized attribute")   
