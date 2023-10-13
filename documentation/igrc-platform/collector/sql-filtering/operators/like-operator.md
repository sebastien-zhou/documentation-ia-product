---
layout: page
title: "LIKE operator"
parent: "Operators"
grand_parent: "SQL Filtering"
nav_order: 5
permalink: /docs/igrc-platform/collector/sql-filtering/operators/like-operator/
---
---

Tests whether a value respects a regular expression.    

**Syntax:**   

- `<left_value_or_list>``LIKE <right_value_or_list> [ESCAPE <escape_value>]`   

**Result:**

- `true` if the `left_value_or_list` respects the regular expression present in `right_value_or_list`, otherwise` false`. If `left_value_or_list` is a list, the result is true if at least one value in the list respects this regular expression in `right_value_or_list`. If `right_value_or_list` is also a list, the result is true if at least one value in the `left_value_or_list` respects one of the regular expressions present in `right_value_or_list`.   

**Operand:**    

- `left_value_or_list`: String or Number or Boolean or Date or List Single value or list of values which must respect the regular expression. If the operand is a list of values, the result is true if at least one value respects the regular expression.
- `right_value_or_list`: String or Number or Boolean or Date or List Regular expression using wildcards `_`, `%` and `[]`. If the operand is a list of regular expressions, the result is true if at least one of the values of the `left_value_or_list` operand respects one of the regular expressions of the list. The meaning of the wildcards is as follows:
  - `_` character: corresponds to any single character. For example, the value `'EXT0001'` respects the regular expressions `'EX_0001'` and `'EXT___1'`
  - `%` character: matches any sequence of characters. For example, the value `'EXT0001'` respects the regular expressions `'EXT%'`, `'EXT%1'`, `'EXT0001%'`, `'%000%'` and `'EXT000%1'`
  - `[]` characters: correspond to a list of characters. For example, the value `'EXT0001'` respects the regular expressions `'[AEIOU]XT0001'`, `'EXT000[0123456789]'`. Warning, syntax designating a range of characters, such as `'[0-9]'` is not supported.   

It is of course possible to combine different wildcards in the same regular expression. For example, the value `'EXT0001'` respects the regular expressions `'_XT000[0123456789]' and 'EXT___1%'`  
- `escape_value`: String String containing the escape character if one of the wildcards of the regular expression must be interpreted as a simple character. For example, if the `left_value_or_list` operand contains the value `'jean_pierre'` and you need to test for the presence of the `'_'` character, you must indicate to the `LIKE` operator that it should consider the `'_'` character as a simple character and not as a wildcard. For this, the `'_'` character is preceded by an escape character (like `'\'`) which you must mark as such to the `LIKE` operator with the keyword `ESCAPE` followed by the escape character.  

**Example calls:**    
```
SELECT * FROM dataset WHERE lower(dataset.unique_ID) LIKE 'ext%'
SELECT * FROM dataset WHERE dataset.unique_ID LIKE '\_' ESCAPE '\'
SELECT * FROM dataset WHERE dataset.unique_ID NOT LIKE 'EXT000[0123456789]'
```
