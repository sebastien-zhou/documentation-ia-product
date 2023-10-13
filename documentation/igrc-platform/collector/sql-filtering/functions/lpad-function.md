---
layout: page
title: "Lpad function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 13
permalink: /docs/igrc-platform/collector/sql-filtering/functions/lpad-function/
---
---

Adds a repetition of characters to the beginning of a string or list of strings.  

**Signature:**  

- `lpad(value_or_list, num[, pattern])`: String or List

**Return value:**  

- string complemented with a repetition of characters at the beginning if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned, after the `lpad` function has been applied to each value.

**Parameters:**  

- `value_or_list`: String or List. String to be completed at the beginning. If the parameter is a list of strings, all the values of the list undergo the `lpad` function.
- `num`: Number. Number of repetitions of the pattern string or of a space if the pattern is not specified.
- `pattern`: String (optional). String to be repeated in the beginning. If the parameter is omitted, the repeated pattern is the space character.  

**Example call:**  

`SELECT * FROM dataset WHERE lpad(dataset.unique_ID, 3, 'Z') LIKE 'ZZZint%'`  
