---
layout: page
title: "Smart search labels"
parent: "Smart search"
nav_order: 1
permalink: /docs/igrc-platform/smart-search/label/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

The SmartSearch feature allows the user to build constrained requests for the Ledger using predefined criterias.

![Smart Search example](./images/labels_smartsearch_example.png)

You can find [here](./SmartSearch_labels.csv) all available criterias. The structure is following:

Header|Description|Example value
:---:|:---:|:---:
`Entity`|Concept type returned by the request|Account
`Type`|Type of the request (criteria or join)|criteria
`Criteria `|Criteria identifier|eqIdentifier
`Request`|Request corresponding to the criteria|Account.identifier = '{identifierParam.value}'
`SmartSearch label EN`|English SmartSearch label corresponding to the criteria (if it exists)|which identifier or CN/DN is equal to
`SmartSearch label FR`|French SmartSearch label corresponding to the criteria (if it exists)|dont l'identifiant ou CN/DN est égal à

# Download

[SmartSearch_labels.csv](./SmartSearch_labels.csv)