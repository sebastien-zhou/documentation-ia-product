---
layout: page
title: "Activity permission pair target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 19
permalink: /docs/igrc-platform/collector/components/targets/activity-permission-pair-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

## What is an activity ?

This target defines business activities that can be used in the SOD matrix to detect model or identity discrepancies. Activities are a combination of real application permissions allowing a user to perform a particular business task. The list of activities depends on the company.  
This target is used to make a mapping between a business activity and the list of application's actions, screens or roles needed to perform this activity. For example, the activity "Send an invoice" is defined in a certain way in SAP (using a combination of transactions and authorisation objects) but it is defined in another way in PeopleSoft.  

## How activities are defined ?

In a given application, there can be several ways to perform a specific activity. Or maybe that an activity is composed of several consecutive actions. For example, emitting an invoice could be completed by using a menu (permission MENU\_INVOICE, action CREATE or UPDATE) but is really done if the user has the ability to validate the screen (permission INVOICE, action COMMIT).  
In this example the "Emit an Invoice" is defined this way : 

```
(permission MENU_INVOICE, action CREATE) or (permission INVOICE, action UPDATE)
and
  (permission MENU_INVOICE, action COMMIT)
```

The Brainwave product allows you to define an activity using several permission pairs. In the above example, a permission pair is (MENU\_INVOICE, CREATE). Another one is (INVOICE, COMMIT).  
The target expects a permission pair and an operator. The operator is used to know if we have an AND or an OR operator. The previous example can be rewritten as follows:  

| permission1 | permission2 | operator |
| MENU\_INVOICE | CREATE | 1  |
| MENU\_INVOICE | UPDATE | 1  |
| MENU\_INVOICE | COMMIT | 2  |

The operator value has no particular meaning. To know how a line is combined with the previous line, we check if the value in the operator column has changed or not.  
```
same operator:    apply an OR operator with the previous line
    operator changed: apply an AND operator with the previous line
```

The lines 1 and 2 are combined using an OR operator     
But there is a AND operator between line 3 and the first 2 lines because the operator value has changed (from 1 to 2).   
The target should be called for each line of this table.      

Ther are 2 important rules to keep in mind to understand how the product is using the operator.   

- the operator combines the current line with the result of all the previous lines.
- if the operator if AND and the result of all the previous line was fase, the evaluation stops.

Lets take a more complex example and convert it into an expression to understand how it will be evaluated.    

| **permission1**| **permission2**|**operator**|
|MENU_INVOICE|CREATE|1|
|MENU_INVOICE|UPDATE|1|
|MENU_INVOICE|COMMIT|2|
|MENU_INVOICE|VIEW|2|
|MENU_INVOICE|AUDIT|1|   

The product evaluates the lines as if the following expression had been written:   
`((( CREATE OR UPDATE ) AND COMMIT ) OR VIEW ) AND AUDIT`   

If CREATE and UPDATE are both false (meaning the use has none of them), the result is false (meaning the user has not this Business Activity) and the remaining part is not evaluated.    
If CREATE or UPDATE is true then the product evaluates the AND operator with COMMIT and whatever the result, continues with the OR VIEW.   
If the result is false then the AND AUDIT is not performed. If the result is true, then the operation AND AUDIT is evaluated.    

As of version 2017 R2 SP6, you have the possibility to use the NOT operator in the activity definition - combined with the AND or OR. To use the NOT operator, in the data file, you have to use the minus '-' before the chosen operator.   
Let's take a few examples:   

|  BusinessActivity | permission1 | permission2  | operator |
|  A1 |  CMR5 | CREATE  | -1 |
|  A1 |  CRM6 | UPDATE  |  2 |
|  A1 |  CRM5 | UPDATE  |  2 |

The A1 activity is defined as follow: (NOT [CRM5 CREATE]) AND ([CRM6 UPDATE] OR [CRM5 UPDATE])

|  BusinessActivity | permission1  | permission2  | operator  |
|  A2 |  Z1 |         |  1 |
|  A2 |  Z3 |  DELETE |  2 |
|  A2 |  X1 |         | -2 |

A2 activity is defined as follow : [Z1] AND ([Z3 DELETE] OR (NOT [X1]))

|  BusinessActivity | permission1  | permission2  | operator  |
|  MA1 | A1 |  |  1 |
|  MA1 | A2 |  |  1 |
|  MA1 | B1 |  | -2 |

Definition of master activity MA1 : ([A1] OR [A2]) AND (NOT [B1])

| **Important** <br><br> Be careful as the order in the definition data file is really important. Using an AND operator will do a shift in the definition: ie :( OR OR OR OR) AND (OR OR OR ....)|

This target can be used to define an activity based on a combination of permission pairs but can also be used to defined macro-activities based on a combination of activities. The same way of specifying OR and AND operator applies using the trick of value change but only one permision (an activity) is given instead of two permissions.   

As of version 2017 R3 SP5, the ability to define complex expression has been added.    
An expample can be any combination of parenthesis, AND operator, OR operator, NOT operator with a Javascript syntax.  
For example, you could write:   
`( CREATE || UPDATE ) && ( COMMIT || VIEW ) && ! AUDIT`   

In the collect line, you should call 5 times the Activity Pair target because there are 5 operands in your expression.   
But instead of using an operator (usually containing 1 or 2), you set the expression in the displayname of the Activity Pair and set 0 (zero) in the operator.   
With the previous expression, all 5 lines should have a 0 in the operator and the displayname of at least one line (or all if you prefer) should contain the expression.   
The expression must start with the '=' sign to distinguish between a normal displayname and an expression.  

```
operator: 0
   displayname: =( CREATE || UPDATE ) && ( COMMIT || VIEW ) && ! AUDIT
```

The operator is not used anymore by the product because the expression with the parenthesis defines how the operands are combined.   

The name CREATE, UPDATE,... are not the permission codes or the Business Activities codes.
Instead, it is an alias on a line of the Activity Pair stored in the activity pair type in the collect line.   
The following table show how to fill the different activity pair target fields in the collect line.   

| **business activity**  | **permission1** | **operator** | **type** |  **displayname** |
|BA1|CREATE|0|CREATE||
|BA1|UPDATE|0|UPDATE||
|BA1|COMMIT|0|COMMIT||
|BA1|VIEW|0|VIEWONLY||
|BA1|AUDIT|0|FULLAUDIT|=( CREATE \|\| UPDATE ) && ( COMMIT \|\| VIEWONLY ) && ! FULLAUDIT|

# The properties Tab

## The Activity tab

In this tab, the checkbox 'Definition of a macro-activity' should be checked to define macro-activities intead of normal activities. Depending on this checkbox, you have to enter either a permission pair or an activity.  
The first field called 'Parent permission' is the code of the business activity to define (either activity or macro-activity).  

## The Parameters tab

This tab is mainly used to define the operator.

# Best practices

It is recommended to have two layers of activities:   

- macro-activities are business activities which are referenced in the SOD matrix
- normal activities are application dependent activities to define how a single activity can be performed in the application   

Pay attention to the order of the permission pairs when defining an activity. For example, if a sort is applied on the first permission in the discovery, the 3 lines will look like this in the Ledger:   

|**permission1**|**permission2**|**operator**|
|MENU_INVOICE|COMMIT|2|
|MENU_INVOICE|CREATE|1|
|MENU_INVOICE|UPDATE|1|   

The meaning of this table is different (and wrong):   

```
  (permission INVOICE, action COMMIT) and (permission MENU_INVOICE, action CREATE)
or
  (permission MENU_INVOICE, action UPDATE)
```

As the meaning of the operator is highly dependant on the order of the permission pair declaration, you should respect the original order of the file containing the activity definitions.   

As of version 2017 R3 SP5, the best practice is to use expressions so you can define real Business Activities only.   
Without expression, in previous versions, you could be forced to add intermediate Business Activities to be able to combine the different permissions as desired.   

# Error handling

Each permission pair is added to the activity definition. The only possible error is if the permission codes (or activity code when defining a macro-activity) are unknown in the Ledger. In such a case, an exception is raised.
