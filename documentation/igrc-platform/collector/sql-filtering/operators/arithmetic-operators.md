---
layout: page
title: "Arithmetic operators"
parent: "Operators"
grand_parent: "SQL Filtering"
nav_order: 1
permalink: /docs/igrc-platform/collector/sql-filtering/operators/arithmetic-operators/
---
---

The list of supported arithmetic operators is:  

- \+ for addition
- \- for subtraction
- \* for multiplication
- / for division

These operators only work on numerical operands. Lists of values are not supported. To ensure the order of operations, it is possible to use parentheses in the expression. Here are some examples using these operators:
```
SELECT * FROM dataset WHERE len(dataset.unique_ID) - 1 < 3
SELECT * FROM dataset WHERE 2 + (dataset.counter / 10) > 5
```
