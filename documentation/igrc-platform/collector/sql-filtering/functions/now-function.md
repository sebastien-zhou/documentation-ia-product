---
layout: page
title: "Now function"
parent: "Functions"
grand_parent: "SQL Filtering"
nav_order: 15
permalink: /docs/igrc-platform/collector/sql-filtering/functions/now-function/
---
---

Returns the current date.  

**Signature:**  

- `now()`: Date

**Other signature:**  

- `localtimestamp()`: Date

**Return value:**  

- The current date

**Parameters:**  

- none

**Example call:**  

`SELECT * FROM dataset WHERE dataset.departure is null or dataset.departure > now()`  
