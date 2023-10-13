---
layout: page
title: "Char function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 2
permalink: /docs/igrc-platform/collector/sql-filtering/functions/char-function/
---
---

Returns a string consisting of only one character whose Unicode code is passed as a parameter.  

**Signature:**  

- `char(value)`: String

**Other signature:**  

- `chr(value)`: String

**Return value:**  

- a string consisting of only one character whose code is the value

**Parameters:**  

- value: Number. Numerical value corresponding to the Unicode code of the character to be transformed into a string.

**Example call:**  
```
SELECT * FROM dataset WHERE char(65) = 'A'
SELECT * FROM dataset WHERE left(dataset.unique_ID, 1) = char(69)
```
