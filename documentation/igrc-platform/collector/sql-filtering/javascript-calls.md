---
layout: page
title: "Javascript calls"
parent: "SQL Filtering"
grand_parent: "Collector"
has_children: true
nav_order: 3
permalink: /docs/igrc-platform/collector/sql-filtering/javascript-calls/
---

The SQL query may also call a JavaScript function in the script associated with the collector line. It is possible to pass parameters to the function. Here is an example call with a parameter:   

`SELECT * FROM dataset WHERE checkInternal(upper(dataset.unique_ID)) = 'internal'`  

The associated function returns the 'internal' string if the registration number is that of an in-house person:  
```
function checkInternal(userId) {
  if ((userId == null) || (userId == '')) {
  return 'external';
  }
    var prefix = userId.substring(0, 3).toUpperCase();
    if ((prefix == 'VIP') || (prefix == 'EXT')) {
    return 'external';
  }
  return 'internal';
}
```

| **Note**: <br><br> The current record being filtered is accessible through the predefined variable dataset.|
