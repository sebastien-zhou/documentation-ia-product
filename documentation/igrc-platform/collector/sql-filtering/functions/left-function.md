---
layout: page
title: "Left function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 7
permalink: /docs/igrc-platform/collector/sql-filtering/functions/left-function/
---

Extracts a certain number of characters from a string or list of strings starting with the first position.  

**Signature:**  

- left(value\_or\_list, len): String or List

**Return value:**  

- A string containing the number of characters requested starting from the first position if the value\_or\_list parameter is a string. If the value\_or\_list parameter is a list of strings, a new list is returned after the left function has been applied to each value.

**Parameters:**  

- value\_or\_list: String or List. String, of which a part is extracted. If the parameter is a list of strings, all the values of the list undergo the left function.
- len: Number. A whole number between 0 and the length of the string.

**Example call:**

`SELECT * FROM dataset WHERE left(dataset.unique_ID, 3) = 'Ext'`  
