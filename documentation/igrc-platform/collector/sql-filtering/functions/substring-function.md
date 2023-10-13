---
layout: page
title: "Substring function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 25
permalink: /docs/igrc-platform/collector/sql-filtering/functions/substring-function/
---
---

Extracts a certain number of characters from a string or from a list of strings starting from a certain position.  

**Signature:**  

- `substring(value_or_list, start[, len])`: String or List

**Other signatures:**  

- `mid(value_or_list, start[, len])`: String or List
- `substr(value_or_list, start[, len])`: String or List

**Return value:**  

- A string containing the requested number of characters starting from the start position if the `value_or_list` parameter is a string. If the `value_or_list` parameter is a list of strings, a new list is returned after the substring function has been applied to each value.

**Parameters:**  

- `value_or_list`: String or List. String from which a part must be extracted. If the parameter is a list of strings, the substring function is applied to all the values in the list.
- `start`: Number. A whole number between 1 and the string length.
- `len`: Number (optional). A whole number between 0 and the string length. If this value is not provided, all the characters from the start position and up until the end of the string are returned.

**Example call:**  

`SELECT * FROM dataset WHERE substring(dataset.unique_ID, 1, 2) = 'xt'`  

| **Note**: <br><br> The signature of the substring function is very different from the signature of the substring method of JavaScript or of Java. The last parameter is the length of the substring, whereas in JavaScript or Java, the last parameter is the index of the end of the substring. In addition, the position of the first character in the string is 1 in SQL, unlike Java or JavaScript where numbering starts at 0. |
