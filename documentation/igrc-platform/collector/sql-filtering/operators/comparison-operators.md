---
layout: page
title: "Comparison operators"
parent: "Operators"
grand_parent: "SQL Filtering"
nav_order: 2
permalink: /docs/igrc-platform/collector/sql-filtering/operators/comparison-operators/
---
---

The comparison operators are:  

- =: true if both operands are equal
- \<\> or !=: true if both operands are different
- \<: true if the first operand is strictly less than the second operand
- \<=: true if the first operand is less than or equal to the second operand
- \>: true if the first operand is strictly greater than the second operand
- \>=: true if the first operand is greater than or equal to the second operand   

The first two operators (= and \<\>) operate on values or lists of values. These strict comparisons return true only if the values of two operands are identical (for the = operator) or all different (for the \<\> operator).  

The other operators do not work on lists of values. Both operands must be simple values. If the comparison involves two values of different types, the second operand is automatically converted to the type of the first operand during the comparison. Here are some examples using these operators:    
```
SELECT * FROM dataset WHERE dataset.unique_ID = 'INT0001'
SELECT * FROM dataset WHERE dataset.date_departure < now()
```
