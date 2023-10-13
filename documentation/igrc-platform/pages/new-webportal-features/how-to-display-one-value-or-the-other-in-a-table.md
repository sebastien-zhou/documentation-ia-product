---
layout: page
title: "How to Display either one or another value in Table column"
parent: "New Webportal Features"
grand_parent: "Pages"
nav_order: 8
permalink: /docs/igrc-platform/pages/new-webportal-features/how-to-display-value/
---
---

**_Version_**: 2016 R1   

Sometime you want to choose between two values to display in a table column, in order for instance to display either a submission date or a closing date for a ticket event (such as an audit trail).      

Even if a 'text' attribute can override the displayed value you then cannot use `if/then/else` paradigms to choose between different values.   

A new helper has been added in version 2016 R1 of the product to help you.     
Here is a simple example :  

```
import "/webportal/pages/resources/mappings.page"

Table {
 data:audittrail
 // when = display the close date when finalized (not null), the submission date when the process i
 s still in progress (close date is null)
 Column {
           header:'when'
           column:closedate
           text:$utilsNLS.showifnotnull(Transform Current closedate using notnullMapping,
             Current closedate, Current submissiondate)
        }
}
```

This will display the "close date" if it is not null, the "submission date" otherwise.   

For 2016 R1 and higher, use the `NonEmpty` binding.     
