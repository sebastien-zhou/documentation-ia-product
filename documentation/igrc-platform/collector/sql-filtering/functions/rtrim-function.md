---
layout: page
title: "Rtrim function"
parent: "Functions"
grand_parent: "SQL Filtering"
has_children: true
nav_order: 22
permalink: /docs/igrc-platform/collector/sql-filtering/functions/rtrim-function/
---
---

Returns a string or a list of strings without trailing spaces.  

**Signature:**  

- `rtrim(value_or_list)`: String or List

**Return value:**  

- The string without trailing spaces if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned after the `rtrim` function has been applied to each value.

**Parameters**  

- `value_or_list`: String or List. String from which trailing spaces must be removed. If the parameter is a list of strings, all the values of the list undergo the `rtrim` function.

**Example call:**

`SELECT * FROM dataset WHERE rtrim(dataset.unique_ID) LIKE '%00'`
