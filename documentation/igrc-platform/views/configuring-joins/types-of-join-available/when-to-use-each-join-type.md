---
layout: page
title: "When to use each Join type"
parent: "Types of join available"
grand_parents: "Configuring Joins"
nav_order: 3
permalink: /docs/igrc-platform/views/configuring-joins/types-of-join-available/when-to-use-each-join-type/
---
---

'Left outer joins' should be used by default, in preference to 'inner joins' unless the user wishes to carry out consolidation operations on the results. The layout of 'inner joins' has the effect of hiding entries for which there are no linked elements in the right hand side of the relationship, which often means that a proportion of the results are hidden from view.   

For example, if you display a list of identities in a table, each showing the associated manager, using an inner join will have the effect of deleting the list of identities that do not have an associated manager which is often not the desired outcome.     

Examples of Audit Views using the 'left outer join':   

- Global identity list, with information on the associated manager if available
- Global identity list, with a list of the associated access accounts (numbered 0 to _n_)
- Global organisation list, with a list of members for each (numbered 0 to _n_)
- Global organisation list, with a count of members for each (0 to _n_)

Examples of Audit Views using an 'inner join':   

- List of managers with a list of direct reports for each
- List of permissions frequently affected by another permission
