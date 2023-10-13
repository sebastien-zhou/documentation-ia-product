---
layout: page
title: "Listget function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 9
permalink: /docs/igrc-platform/collector/sql-filtering/functions/listget-function/
---
---

Extracts an element from a list of values.  

**Signature:**  

- `listget(value_or_list, index)`: String or Number or Boolean or Date

**Return value:**  

- The value in the list at the specified index. The type of the return value is the same as the type of the list elements.

**Parameters:**  

- `value_or_list`: String or Number or Boolean or Date or List. If the parameter is a list of values, the value present at the specified index is returned. If the value is a single value, it is returned if the index passed as a second parameter is 1.
- `index`: Number. Index of the desired value in the list. The first value is located at index 1.

**Example call:**  

`SELECT * FROM dataset WHERE listget(dataset.unique_ID, 1) = 'EXT0001'`
