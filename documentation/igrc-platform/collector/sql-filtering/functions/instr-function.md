---
layout: page
title: "Instr function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 6
permalink: /docs/igrc-platform/collector/sql-filtering/functions/instr-function/
---
---
Looks for the index of a certain occurrence of the specified value in a string.  

**Signature:**  

- `instr(full, search[, start[, repeat]])`: Number

**Return value:**  

- The index of the occurrence of the specified value or 0 if it is not found

**Parameters:**  

- `full`: String. String in which the search is carried out.
- `search`: String. String of characters to search for.
- `start`: Number (optional). Starting index of the search. Index 1 corresponds to the first character.
- `repeat`: Number (optional). Number of the occurrence. Numbering starts at 1 to obtain the first occurrence.

**Example call:**  

`SELECT * FROM dataset WHERE instr(dataset.unique_ID, 'xt') = 2`  
