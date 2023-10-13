---
layout: page
title: "Functions"
parent: "SQL Filtering"
grand_parent: "Collector"
has_children: true
nav_order: 2
permalink: /docs/igrc-platform/collector/sql-filtering/functions/
---
---

In some cases, filtering records requires a calculation, conversion or data transformation. The functions in this chapter are mainly used in the where clause. They may be combined in order to combine several operations. The following example shows the transformation of a string to uppercase and the removal of spaces from beginning and end:    

`SELECT * FROM dataset WHERE trim(upper(dataset.unique_ID)) = 'EXT0001'`  

An important point to watch is the processing of null values. In the example above, if the unique ID may be null (not given in the input file), then it becomes imperative to test the nullity in the where clause before calling a function, as shown in the following example:    

`SELECT * FROM dataset WHERE dataset.unique_ID is not null and trim(upper(dataset. unique_ID)) = 'EXT0001'`  

Without the test of nullity, the line collector stops running with an exception caused by calling a function on a null value.  

Also note that most functions treat single values as well as lists. If a unique ID is declared as multivalued, the previous query does not work because of the strict equality comparison. If the unique ID is a list of three values, the equality operator returns false because it would have to have two list type operands with the same values to return true. To pass the test successfully if the value '`EXT0001`' is part of the list, the request must be transformed as follows:    

`SELECT * FROM dataset WHERE dataset.unique_ID is not null and 'EXT0001' in (trim(upper(dataset.unique_ID)))`  

In this example, if the unique ID is a list of three values, they are transformed to uppercase by the upper function which returns the list of three values, then the trim function removes the spaces from the three values and returns the list of three values, and finally the 'in' operator searches for the '`EXT0001`' value.    

The LIKE operator also works on a list of values. Another way to formulate the query to obtain the same Result is as follows:     

`SELECT * FROM dataset WHERE dataset.unique_ID is not null and trim(upper(dataset.unique_ID)) LIKE 'EXT0001'`  

If the desired value is any unique ID starting with EXT, the previous query may be transformed as follows to use wildcards:    

`SELECT * FROM dataset WHERE dataset.unique_ID is not null and trim(upper(dataset.unique_ID)) LIKE 'EXT%'`  
