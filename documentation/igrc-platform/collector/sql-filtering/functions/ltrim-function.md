---
layout: page
title: "Ltrim function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 14
permalink: /docs/igrc-platform/collector/sql-filtering/functions/ltrim-function/
---
---

Returns a string or a list of string without leading spaces.  

**Signature:**  

- `ltrim(value_or_list)`: String or List

**Return value:**  

- The string without leading spaces if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned after the `ltrim` function is applied to each value.

**Parameters:**  

- `value_or_list`: String or List. String from which leading spaces must be removed. If the parameter is a list of strings, all the values of the list undergo the `ltrim` function.

**Example call:**  

`SELECT * FROM dataset WHERE ltrim(dataset.unique_ID) LIKE 'int%'`  
