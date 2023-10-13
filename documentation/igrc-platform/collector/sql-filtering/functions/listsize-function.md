---
layout: page
title: "Listsize function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 11
permalink: /docs/igrc-platform/collector/sql-filtering/functions/listsize-function/
---
---

Returns the number of elements in a list of values.  

**Signature:**  

- `listsize(value_or_list)`: Number

**Return value:**  

- The number of elements if the `value_or_list parameter` is a list. If the `value_or_list` parameter is not a list, the function returns 1 if the value is not null or 0 if the value is null.

**Parameters:**  

- `value_or_list`: String or Number or Boolean or Date or List. Parameter whose size is to be calculated. The function is especially useful if the parameter is a list of values (attribute declared as multivalued) but it also works with single or null values.

**Example call:**  

`SELECT * FROM dataset WHERE listsize(dataset.unique_ID) = 2`  
