---
layout: page
title: "BETWEEN operator"
parent: "Operators"
grand_parent: "SQL Filtering"
nav_order: 6
permalink: /docs/igrc-platform/collector/sql-filtering/operators/between-operator/
---
---

Test whether a value is in a range.   

**Syntax** :

- \<value\> `BETWEEN`\<low\_limit\>`AND` \<high\_limit\>   

**Result** :   

- true if the value is greater than or equal to low\_limit and less than or equal to high\_limit, false otherwise. The BETWEEN operator does not support lists of values in any of the operands. If the data type is different between one value and one of the limits, an implicit conversion of the limit is performed in order to perform the comparison.

**Operands**:  

- `value: String` or `Number` or `Boolean` or `Date. `The value to be compared.
- `low_limit: String` or `Number` or `Boolean` or `Date`. The lowest authorized limit for the value. If this value is not the same type as the value, an implicit conversion of the low\_limit is performed before the comparison.
- `high_limit: String` or `Number` or `Boolean` or `Date`. The highest authorized limit for the value. If this value is not of the same type as the value, an implicit conversion of the high\_limit is performed before the comparison.

**Example calls:**  
```
SELECT * FROM dataset WHERE dataset.arrival BETWEEN '20080101000000' AND now()
SELECT * FROM dataset WHERE len(dataset.unique_ID) NOT BETWEEN 6 AND 10
```
