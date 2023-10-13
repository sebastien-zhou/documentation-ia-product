---
layout: page
title: "Len function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 8
permalink: /docs/igrc-platform/collector/sql-filtering/functions/len-function/
---
---

Returns the number of characters in a string.  

**Signature:**  

- `len(value)`: Number

**Other signature:**  

- `character_length(value)`: Number

**Other signature:**  

- `char_length(value)`: Number

**Return value:**  

- The number of characters in the string

**Parameters:**  

- `value`: String. String whose size is to be calculated.

**Example call:**  

`SELECT * FROM dataset WHERE len(dataset.unique_ID) > 3`
