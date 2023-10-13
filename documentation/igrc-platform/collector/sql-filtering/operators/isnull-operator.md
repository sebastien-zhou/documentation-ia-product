---
layout: page
title: "IS NULL operator"
parent: "Operators"
grand_parent: "SQL Filtering"
nav_order: 4
permalink: /docs/igrc-platform/collector/sql-filtering/operators/isnull-operator/
---
---

Tests whether a value is null.  

**Syntax:**   

- \<value\_or\_list\> IS NULL   

**Result:**

- true if value\_or\_list is null, false otherwise. If value\_or\_list is a list, the result is true if the list is empty or if the list only contains null values.   

**Operand**   

- value\_or\_list: String or Number or Boolean or Date or List The operand may be a simple value or a list of values.

**Example calls:**   
```
SELECT * FROM dataset WHERE dataset.unique_ID IS NULL
SELECT * FROM dataset WHERE dataset.unique_ID IS NOT NULL and trim(upper(dataset.unique_ID)) = 'EXT0001'
```
