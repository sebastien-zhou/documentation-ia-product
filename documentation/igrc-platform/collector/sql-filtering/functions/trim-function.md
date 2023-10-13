---
layout: page
title: "Trim function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 26
permalink: /docs/igrc-platform/collector/sql-filtering/functions/trim-function/
---
---

Returns a string or a list of strings without leading or trailing spaces.  

**Signature:**  

- `trim(value_or_list)`: String or List

**Return value:**  

- The string without leading or trailing spaces if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned after the trim function has been applied to each value.

**Parameters**  

- `value_or_list`: String or List. String from which leading and trailing spaces are to be removed. If the parameter is a list of strings, the trim function is applied to all the values of the list.

**Example call:**  

`SELECT * FROM dataset WHERE trim(dataset.unique_ID) LIKE 'int%00'`
