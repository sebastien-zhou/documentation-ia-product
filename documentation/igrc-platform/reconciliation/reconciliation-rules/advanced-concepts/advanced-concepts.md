---
layout: page
title: "Reconciliation rules: Advanced concepts"
parent: "Reconciliation rules"
grand_parent: "Reconciliation"
nav_order: 6
has_children: true
permalink: /docs/igrc-platform/reconciliation/reconciliation-rules/advanced-concepts/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Using Joins

Configuring a reconciliation rule usually exploits two Ledger concepts: the Identity concept and the Accounts concept. This operation is performed by making join relationships between two concepts.     
The join is used when the criterion that you want to use to reconcile the accounts only exist in the identity repository or the accounts repository.   
The join relationships available by Ledger concept are displayed in the **'Link from...'** section in the graphical editor's palette.   
To use a join you just have to drag and drop the link onto the graphical editor, followed by the selection of the concept from the rule on which you want to apply the additional concepts.   

![Example of using a join relationship](./images/worddavc6fbceea9075f87f8e897c6166936ab1.png "Example of using a join relationship")     

# Using calculated attributes

It is possible to create an attribute when the available criteria do not allow you to make an advanced search of the identities. The attribute contains a JavaScript expression; the rule engine will calculate its results when it executes the rule.   

Example of use: The following rule allows you to reconcile accounts whose login is formed of the 3 first characters of the first name followed by the 3 first characters of the surname of the owner identity. To do this, we are going to create two parameters that will call `start_name`  and `start_surname`  respectively .   

- Open the **'Criteria on identity name'**  section, drag and drop the **'given name looks like {given name}'** hyperlink.     

- Select the **'Set the criterion with a global parameter of the rule'**  box and click on the following icon

![Icon](./images/1.png "Icon")      

- button to make it appear in the input box.
- Enter a unique identifier for your reconciliation rule, for example `start_name`
- Enter a description for your parameter, for example **'Start of first name'**   

![Adding the 'start\_name' global parameter](./images/2.png "Adding the 'start/_name' global parameter")   

- Click **OK**  to return to the graphical editor interface.
- Once created, the parameter appears in the rule's properties. Just one click on the parameter name allows you to show its value (0 is the default value)   

![Displaying a new parameter in the rule properties](./images/3.png "Displaying a new parameter in the rule properties")   

- Click on **Edit...**  to set the parameter with a JavaScript expression.
- We are going to use the `Substring ()` method to return the first 3 characters of the login. Please refer to the collection guide for more details about JavaScript methods.
- It is best to click on the little light bulb on the right of the field and choose the `login` parameter. This will fill the field with the correct syntax without a typing error.   

![Configuring the 'start\_name' attribute](./images/4.png "Configuring the 'start\_name' attribute")   

- Place the curser after the parentheses and enter the character `.` (full stop character). By pressing **Control-Space**  on your keyboard a context window is opened offering a list of JavaScript methods as shown in the screenshot below:   

![JavaScript method input wizard](./images/5.png "JavaScript method input wizard")   

A simple click on a method shows its details.   

![Configuring the 'start\_name' attribute](./images/6.png "Configuring the 'start\_name' attribute")   

It's the same principle for configuring the `start_surname`  attribute. Simply replace the arguments provided in the `substring ()` with `3` and `6`.    

![Example of a calculated attribute configuration](./images/7.png "Example of a calculated attribute configuration")   

You can view the results of the rule by selecting the **'Results'** tab in the graphical editor. The reconciliation takes place on the last loaded analysis period.   

![Results of the rule](./images/2016-07-11_10_59_30-iGRC_Properties_-_demo_reconciliation_test_computed.png "Results of the rule")   
