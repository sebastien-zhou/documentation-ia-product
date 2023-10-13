---
layout: page
title: "IN operator"
parent: "Operators"
grand_parent: "SQL Filtering"
nav_order: 7
permalink: /docs/igrc-platform/collector/sql-filtering/operators/in-operator/
---
---

Tests whether a value is present in a list of values.    

**Syntax:**  

- `<value_or_list> IN (<value_set>)`

**Result:**    

- `true` if the value of `value_or_list` is present in `value_set`, false otherwise. If `value_or_list` is a list, the Result is `true` if all the values in the list are present in `value_set`.   

**Operands:**  

- `value_or_list`: String or Number or Boolean or Date or List. Single value or list of values that must be present in `value_set`. If the operand is a list of values, the Result is true if all of the values are present in `value_set`.

- `value_set`: String or Number or Boolean or Date or List. List of values separated by commas. Each value may be a single value or a list of values.

**Example calls:**  
```
SELECT * FROM dataset WHERE dataset.unique_ID IN ('EXT0001', 'EXT0002', 'EXT0003')
SELECT * FROM dataset WHERE dataset.unique_ID NOT IN ('EXT0001', dataset.userid)
SELECT * FROM dataset WHERE 'EXT0001 IN (dataset.userid)
```
