---
layout: page
title: "Right function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 20
permalink: /docs/igrc-platform/collector/sql-filtering/functions/right-function/
---
---

Extracts a certain number of characters from a string or a list of strings starting from the last position.  

**Signature:**  

- `right(value_or_list, len)`: String or List

**Return value:**  

- A string containing the number of characters requested starting from the last position if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned after the right function has been applied to each value.

**Parameters:**  

- `value_or_list`: String or List. String from which a part is extracted. If the parameter is a list of strings, all the values of the list undergo the right function.
- `len`: Number. A whole number between 0 and the length of the chain.

**Example call:**  

`SELECT * FROM dataset WHERE right(dataset.unique_ID, 2) = '00'`
