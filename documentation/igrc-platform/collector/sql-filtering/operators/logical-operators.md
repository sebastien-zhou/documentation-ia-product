---
layout: page
title: "Logical operators"
parent: "Operators"
grand_parent: "SQL Filtering"
nav_order: 3
permalink: /docs/igrc-platform/collector/sql-filtering/operators/logical-operators/
---
---

The supported logical operators are:  

- AND: true if both operands are true
- OR: true if one of the two operands is true
- NOT: true if the operand is false    

These operators only work on Boolean operands. Lists of values are not supported. These operators all return a Boolean result. Here are some examples using these operators:  
```
SELECT * FROM dataset WHERE len(dataset.unique_ID) > 3 AND dataset.unique_ID LIKE 'I%'
SELECT * FROM dataset WHERE NOT (upper(dataset.unique_ID) LIKE 'EXT%' OR dataset.unique_ID= 'VIP')
```
