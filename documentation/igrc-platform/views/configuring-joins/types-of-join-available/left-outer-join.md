---
layout: page
title: "Left outer join"
parent: "Types of join available"
grand_parents: "Configuring Joins"
nav_order: 2
permalink: /docs/igrc-platform/views/configuring-joins/types-of-join-available/left-outer-join/
---
---

A 'left outer join' involves enumerating, for each concept located on the left side of the relationship, the list of entries located in the concept on the right hand side of the relationship. If no entry is found in the right hand side of the relationship for an entry given on the left hand side, a line is nevertheless inserted into the results. The values of the linked concept (right hand side) are set to `null`.    

Returning to the previous example and setting the join to be 'LEFT', the result will contain the list of access accounts associated with each identity, as before. The results table will contain an additional line for each identity with no associated access accounts. The attribute values relating to the account will be set to _null_.   

![Left outer join](igrc-platform/views/configuring-joins/images/worddava3bed2f09bfef9766a0369823a86c1d5.png "Left outer join")
