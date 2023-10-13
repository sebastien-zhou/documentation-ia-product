---
layout: page
title: "Replace function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 19
permalink: /docs/igrc-platform/collector/sql-filtering/functions/replace-function/
---
---

Replaces all occurrences of a string within another string or in a list.  

**Signature:**  

- `replace(value_or_list, search, str)`: String or List

**Return value:**  

- The string with the values replaced if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned after the replace function has been applied to each value.

**Parameters:**  

- `value_or_list`: String or List. String to be modified. If the parameter is a list of strings, all the values of the list under the replace function.
- `search`: String. String to search for.
- `str`: String. Replacement string.

**Example call:**  

`SELECT * FROM dataset WHERE replace(dataset.unique_ID, 'int', 'xx') LIKE 'xx%'`  
