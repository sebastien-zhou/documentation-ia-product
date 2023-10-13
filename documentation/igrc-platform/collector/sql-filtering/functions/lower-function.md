---
layout: page
title: "Lower function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 12
permalink: /docs/igrc-platform/collector/sql-filtering/functions/lower-function/
---
---

Converts a string or a list of strings to lowercase.  

**Signature:**  

- `lower(value_or_list)`: String or List

**Other signature:**  

- `lcase(value_or_list)`: String or List

**Return value:**  

- The string in lowercase if the value\_or\_list parameter is a string. If the value\_or\_list parameter is a list of strings, a new list is returned with all values converted to lowercase

**Parameters:**  

- `value_or_list`: String or List. String to be converted to lowercase. If the parameter is a list of strings, all the values of the list are converted to lowercase.

**Example call:**  

`SELECT * FROM dataset WHERE lower(dataset.unique_ID) LIKE 'ext%'`  
