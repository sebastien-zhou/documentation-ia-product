---
layout: page
title: "Ascii function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 1
permalink: /docs/igrc-platform/collector/sql-filtering/functions/ascii-function/
---
---

Returns the Unicode code of the first character of the string passed as parameter.   

**Signature:**   

- `ascii(value): Number`   

**Return value:**  

- a string consisting of only one character whose code is the value   

**Parameters:**  

- value: String. String whose first character must be transformed into Unicode.   

**Example call:**    
```
SELECT * FROM dataset WHERE ascii('A') = 65
SELECT * FROM dataset WHERE left(dataset.unique_ID, 1) = ascii('E')
```
