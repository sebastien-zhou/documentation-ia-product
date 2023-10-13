---
layout: page
title: "JavaScript syntax"
parent: "Macros et scripts"
grand_parent: "Collector"
nav_order: 1
permalink: /docs/igrc-platform/collector/macros-and-scripts/javascript-syntax/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

The APIs described in this chapter can be used in both macros in JavaScript.

A macro is a JavaScript expression inserted into a component property field. For example, the CSV source component asks for the name of a CSV file to be processed. An absolute path may be entered in this field. However, it is possible to insert a JavaScript expression to make the constitution of the file path dynamic. The expression must be enclosed in brackets to be identified as such by the collector engine when running. Everything between these brackets is executed and the result replaces the JavaScript expression as shown in the following example:   

`{config.my_directory}\rh.csv`

In the example above, the my\_directory configuration variable contains `C:\Users\Paul`. At runtime, the collector engine replaces the expression in brackets with the result, which gives the following path:   

`C:\Users\Paul\rh.csv`

A JavaScript script is a file with the extension `.javascript`. This file is associated with the collector line and may contain all the functions called by components, for example, from a source script, a filter script, or a transition, to make its transfer conditional.   

The major difference in syntax between a macro and a JavaScript script is that the macro can only contain an expression, not an entire script. This means that all the keywords such as `for,while, if` ... are forbidden in macros.

JavaScript syntax is not described in this document because it is standard, since the product uses the Mozilla Foundation's Rhino scripting engine. Note that ternary expressions may be used in macros and in JavaScript. The syntax is:    

`condition ? expression_if_true: expression_if_false`

The following example shows how to test if my\_directory variable is not empty. If the variable is empty, it is replaced by a default path in Windows. Ternary expressions are very useful in macros as they allow you to test without the if keyword, which is forbidden:   
```
{config.my_directory.length != 0 ? config.my_directory:
"C:\\Windows\\Temp"}\rh.csv
```

Ternary expressions may be nested. It is therefore important to use parentheses to clearly delimit each part and avoid any ambiguity during runtime.
