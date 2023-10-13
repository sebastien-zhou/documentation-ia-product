---
layout: page
title: "Number function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 16
permalink: /docs/igrc-platform/collector/sql-filtering/functions/number-function/
---
---

Converts Boolean, date or string data into a number.  

**Signature:**  

- `number(value_or_list)`: Number or List

**Return value:**  

- A number representing the converted data if the `value_or_list` parameter is not a list. If the `value_or_list` parameter is a list, a new list is returned after the number function has been applied to each value.

**Parameters:**  

- `value_or_list`: String or Number or Boolean or Date or List. Data of any type to be converted to a number. If the parameter is a list, all the values of the list undergo the number function.

**Example call:**  

`SELECT * FROM dataset WHERE number('123') = 123`  
