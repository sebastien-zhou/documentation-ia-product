---
layout: page
title: "Listgetstring function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 10
permalink: /docs/igrc-platform/collector/sql-filtering/functions/listgetstring-function/
---
---

Extracts an element from a list of values and converts it to a string.  

**Signature:**  

- `listgetstring(value_or_list, index)`: String

**Return value:**  

- The value in the list at the specified index, converted into a string.

**Parameters:**  

- `value_or_list:` String or Number or Boolean or Date or List. If the parameter is a list of values, the value at the specified index is returned after string conversion. If the value is a single value, it is converted into a string and returned if the index passed as a second parameter is 1.

- `index:` Number. Index of the desired value in the list. The first value is located at index 1.

**Example call:**  

`SELECT * FROM dataset WHERE listgetstring(dataset.unique_ID, 1) = 'EXT0001'`
