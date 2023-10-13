---
layout: page
title: "Repeat function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 18
permalink: /docs/igrc-platform/collector/sql-filtering/functions/repeat-function/
---
---

Creates a string by repeating another string several times.  

**Signature:**  

- `repeat(value, num)`: String

**Return value:**  

- The string constituted by a repetition of the value parameter

**Parameters**  

- `value`: String. String to be repeated several times.
- `num`: Number. Number of repetition of the value string.

**Example call:**  

`SELECT * FROM dataset WHERE repeat(dataset.unique_ID, 3) = 'int123int123int123'`  
