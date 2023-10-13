---
layout: page
title: "String function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 24
permalink: /docs/igrc-platform/collector/sql-filtering/functions/string-function/
---
---

Converts numerical, Boolean or date data into a string.  

**Signature:**  

- `string(value_or_list)`: String or List

**Return value:**  

- A string containing the converted data if the `value_or_list` parameter is not a list. If the `value_or_list` parameter is a list, a new list is returned after the string function has been applied to each value.

**Parameters:**  

- `value_or_list`: String or Number or Boolean or Date or List. Data of any type to be converted into a string. If the parameter is a list, the string function is applied to all the values of the list.

**Example call:**  

`SELECT * FROM dataset WHERE string(123) = '123'`
