---
layout: page
title: "Best pratices for the optimization of the reconciliation rules"
parent: "Reconciliation rules: Advanced concepts"
grand_parent: "Reconciliation rules"
nav_order: 3
permalink: /docs/igrc-platform/reconciliation/reconciliation-rules/advanced-concepts/best-practice/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# What is optimization for reconciliation rules ?

A reconciliation rule is translated into an SQL query that is then used in the database.    
For each account pending reconciliation, the SQL query is submitted to the database to find a corresponding unique identity. If the SQL query returns several identities, then the next reconciliation rule defined in the policy is used until a rule returns a unique identity or none.     

This means that if the database contains 1000 accounts, 1000 SQL queries are executed in the database to find the identities for a given rule.     

The purpose of the optimization is to avoid all these SQL queries on the database. All the identities are read in memory and for each account, the product checks which identities match the rule definition without sending any queries to the database. In order to do that, all the conditions found in the reconciliation rule (like `login equals xxx` or `fullname starts with xxx`) are interpreted in memory by the rule engine.     

# What are the known limitations ?

When the reconciliation policy is executed, the rule engine determines, for each rule selected in the policy, if it can be executed in an optimized manner (i.e executing a unique select query on identities and then performing a comparison in memory). Otherwise, the rule is executed by the database (x accounts generate x select) which is much slower.     

Some reconciliation rule constructions cannot be optimized.     
The following list details the conditions that prevent the optimization to take place.     

1. Criteria using "less than" or "greater than"
2. Criteria using dates interval (between date A and date B)
3. Criteria "not like" and "not in"
4. Aggregates (COUNT, MIN, MAX,...)
5. Not operator in group component
6. Join data in another timeslot
7. Join with a numbering constraint (Exactly 2 accounts or more than 3 identities,...)
8. Several joins combined with an OR operator
9. Several joins to the same entity
10. Sub-rules

If you do not use any of the features listed above, your reconciliation rule will be optimized.       

---

<span style="color:grey">**NOTE:**</span> Please note that the previous conditions also apply to the modules:
- Entitlement model policy (Theoretical rights)
- Manager policy

---
