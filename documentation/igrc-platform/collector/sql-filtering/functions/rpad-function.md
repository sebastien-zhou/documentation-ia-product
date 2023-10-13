---
layout: page
title: "Rpad function"
parent: "Functions"
grand_parent: "SQL Filtering"
has_children: true
nav_order: 21
permalink: /docs/igrc-platform/collector/sql-filtering/functions/rpad-function/
---
---

Adds a repetition of characters at the end of a string or a list of strings.  

**Signature:**  

- `rpad(value_or_list, num[, pattern])`: String

**Return value:**  

- The string completed with a repetition of characters at the end if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned after the `rpad` function has been applied to each value.

**Parameters:**  

- `value_or_list`: String or List. String to be completed at the end. If the parameter is a list of strings, all the values of the list undergo the rpad function.
- `num`: Number. Number of repetitions of the pattern string or of a space if the pattern is not specified.
- `value`: String (optional). String to be repeated at the beginning. If this parameter is omitted, the repeated pattern is the space character.

**Example call:**  

`SELECT * FROM dataset WHERE rpad(dataset.unique_ID, 3, 'Z') LIKE '%00ZZZ'`
