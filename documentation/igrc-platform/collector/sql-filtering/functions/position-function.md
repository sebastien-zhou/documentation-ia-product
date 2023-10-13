---
layout: page
title: "Position function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 17
permalink: /docs/igrc-platform/collector/sql-filtering/functions/position-function/
---
---

Looks for the index of the first occurrence of the specified value within a string.  

**Signature:**  

- `position(search, full[, start])`: Number

**Other signature:**  

- `locate(search, full[, start])`: Number

**Return value:**  

- The index of the first occurrence of the specified value, or 0 if it is not found

**Parameters:**  

- `search`: String. String of characters to look for.
- `full`: String. String of characters in which to look.
- `start`: Number (optional). Starting index of the search. Index 1 corresponds to the first character.

**Example call:**  

`SELECT * FROM dataset WHERE position('xt', dataset.unique_ID) = 2`  
