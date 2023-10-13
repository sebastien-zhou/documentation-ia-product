---
layout: page
title: "Insert function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 5
permalink: /docs/igrc-platform/collector/sql-filtering/functions/insert-function/
---
---

Inserts a string into another string or into a list.

**Signature** :

- `insert(value_or_list, start, len, str): String or List`

**Return value** :

- The string completed with the string to be inserted if the value\_or\_list parameter is a string. If the value\_or\_list parameter is a list of strings, a new list is returned after the insert function has been applied to each value.

**Parameters**:

- `value_or_list: String` or `List. `String to be completed. If the parameter is a list of strings, all the values of the list undergo the application of the insert function.
- `start: Number.` Starting index of the insertion in the value\_or\_list string. Index 1 corresponds to the first character. If this value is greater than or equal to the length of the value\_or\_list string, the two strings are concatenated.
- `len: Number.` Number of characters to replace in the value\_or\_list string. The value 0 allows the insertion of the string. A value greater than 0 performs a replacement in the value\_or\_list string.
- `str: String.` String to be inserted.

**Example call:**  

`SELECT * FROM dataset WHERE insert(dataset.unique_ID, 4, 0, 'xx') LIKE 'intxx%'`  
