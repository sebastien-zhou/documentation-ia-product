---
layout: page
title: "Upper function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 27
permalink: /docs/igrc-platform/collector/sql-filtering/functions/upper-function/
---
---

Converts a string or list of strings to uppercase.  

**Signature:**  

- `upper(value_or_list)`: String or List

**Other signature:**  

- `ucase(value_or_list)`: String or List

**Return value:**  

- The string in uppercase if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned with all values converted to uppercase

**Parameters:**  

- `value_or_list`: String or List. String to be converted to uppercase. If the parameter is a list of strings, all the values of the list are converted to uppercase.

**Example call:**  

`SELECT * FROM dataset WHERE upper(dataset.unique_ID) LIKE 'INT%'`
