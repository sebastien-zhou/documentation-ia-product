---
layout: page
title: "Space function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 23
permalink: /docs/igrc-platform/collector/sql-filtering/functions/space-function/
---
---

Create a string consisting of spaces.  

**Signature:**  

- `space(num)`: String

**Return value:**  

- The string consisting of spaces

**Parameters:**  

- `num`: Number. Number of spaces in the string.

**Example call:**

`SELECT * FROM dataset WHERE space(3) = ' '`  
