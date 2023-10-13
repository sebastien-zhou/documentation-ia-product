---
layout: page
title: "Inner join"
parent: "Types of join available"
grand_parents: "Configuring Joins"
nav_order: 1
permalink: /docs/igrc-platform/views/configuring-joins/types-of-join-available/inner-join/
---
---

An inner join applies to the strict Cartesian product of the two concepts. This means that the linked values are mandatory in the two concepts to enable a result to be generated.    
Take for example an Audit View that lists the access accounts associated with each identity. Setting a relationship to be an 'inner join' would mean that only those identities with at least one associated access account would appear in the table. Identities not having an associated access account would not satisfy the conditions for the search and therefore would not be included in the list of results.   

![Inner join](igrc-platform/views/configuring-joins/images/6.png "Inner join")
