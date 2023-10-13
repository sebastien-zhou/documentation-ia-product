---
layout: page
title: "Operators"
parent: "SQL Filtering"
grand_parent: "Collector"
has_children: true
nav_order: 1
permalink: /docs/igrc-platform/collector/sql-filtering/operators/
---
---

Operators allow you to make comparisons (equal, less than, greater than, ...) or to combine operations through logical operators (and, or, ...).   

Operators work on simple values as well as on lists of values. To obtain a list of values, the attribute must be declared as being multivalued in the pattern and the input file must contain multiple values for a single CSV column or a single LDIF attribute. The result of the comparison depends on the operator used. Here is the explanation for the three main operators with an example of syntax:

- '=' Operator: It is a strict equality operator, which can compare two simple values or two lists. For the operator to return true, the two operands must possess the same number of values, and the values must be identical. If the objective is to compare a value and a list, you must use the IN operator or the LIKE operator. The following example shows the comparison of two multivalued attributes:    
`SELECT * FROM dataset WHERE dataset.unique_ID = dataset.userid`   
- IN Operator: The IN operator is useful to verify whether a value is in a list. The following example shows the syntax of the IN operator to test whether one of the values of the unique ID attribute is equal to ‘EXT0001’:  
`SELECT * FROM dataset WHERE 'EXT0001' IN (dataset.unique_ID)`   

Note that the left operand of the IN operator may also be a list. In this case, the operation performed is an inclusion test. The result is true if all the values of the left operand are found in the list of values of the right operand. The syntax is as follows:
`SELECT * FROM dataset WHERE dataset.userid IN (dataset.unique_ID)`
- LIKE Operator: The LIKE operator allows you to use wildcards like '%' or '\_'. If the left operand is a list, the LIKE operator returns true if one of the values of the list respects the regular expression in the right operand. The syntax is:   
`SELECT * FROM dataset WHERE dataset.unique_ID LIKE 'EXT%'`

Important: all the operators are case-sensitive. If the unique ID contains 'EXT0001', none of the following queries returns the record in question:
```
SELECT * FROM dataset WHERE dataset.unique_ID = 'ext0001'

SELECT * FROM dataset WHERE dataset.unique_ID LIKE 'ext%'

SELECT * FROM dataset WHERE 'ext0001' in (dataset.unique_ID)
```

To make the query non-case-sensitive in the previous example, you must use the upper or lower functions to convert the unique ID:
```
SELECT * FROM dataset WHERE lower(dataset.unique_ID) = 'ext0001'

SELECT * FROM dataset WHERE lower(dataset.unique_ID) LIKE 'ext%'

SELECT * FROM dataset WHERE 'ext0001' in (lower(dataset.unique_ID))
```

Note that most of the functions (such as lower, upper, trim,...) may be applied to single-valued or multivalued attributes.
