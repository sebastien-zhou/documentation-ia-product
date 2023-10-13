---
layout: page
title: "Concat function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 3
permalink: /docs/igrc-platform/collector/sql-filtering/functions/concat-function/
---
---

Concatenates one or more strings to another string or to a list.  

**Signature:**  

- `concat(value_or_list, str[, ...])`: String or List

**Return value:**  

- The string with the concatenated values if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned, after the concat function has been applied to each value.

**Parameters:**  

- `value_or_list`: String or List. String to be modified. If the parameter is a list of strings, all the values of the list undergo the application of the concat function.

- `str`: String (varying number of parameters). String(s) to be concatenated.



**Example call:**  

`SELECT * FROM dataset WHERE concat(dataset.unique_ID, 'ab', 'cd') LIKE '%abcd'`
