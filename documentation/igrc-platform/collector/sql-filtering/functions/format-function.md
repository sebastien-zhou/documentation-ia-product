---
layout: page
title: "Format function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 4
permalink: /docs/igrc-platform/collector/sql-filtering/functions/format-function/
---
---

Converts a date to a string, respecting the format given as a parameter.

**Signature** :

- `format(value, pattern): String`

**Return value** :

- a string containing the date in the requested format

**Parameters**:

- `value: Date.` Date to be transformed into a string.
- `pattern: String.` String of characters giving the conversion format. The format respects the specification of the Java java.text.SimpleDateFormat class. The most frequently used characters are:
  - y: year
  - M: month
  - d: day of the month
  - H: hours
  - m: minutes
  - s: seconds

Examples of formats:  
```
'dd/MM/yy HH:mm:ss' gives '23/05/11 15:40:12'
'dd MMM yyyy' gives '23 May 2011'
```

**Example call:**  

`SELECT * FROM dataset WHERE format(dataset.arrival, 'yyyy') = '2011'`  
