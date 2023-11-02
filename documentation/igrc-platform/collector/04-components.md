---
title: Data collector components
description: Data collector components
---

# Components

## Filters

### Collector line call

#### Usage

The collector line call component is used to call another collect line.  
It it useful to reuse generic collect line and simplify the presentation of collect lines  

#### The properties Tab

##### Filter

In this property you can see/modify general parameters of the component. You will find:

- the "Identifier" shown in Debug mode for example
- the "Display name" for the collector line source
- Collector line: collect line to call
- the "Follow just one link" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Filter Collector line call](./images/Collector_line_call_2018-04-04_12_00_17-.png "Filter Collector line call")

##### Description

Comment regarding actions done by this source component.

![Description Collector line call](./images/Collector_line_call_2018-04-04_12_01_10-.png " Description Collector line call")

##### Configuration

In this section you can override variables values declared in the collector line that the component will call.

![Configuration Collector line call](./images/Collector_line_call_2018-04-04_12_01_28-.png " Configuration Collector line call")

### Enumeration filter (EF)

#### EF Usage

Filter enumeration component is used to iterate on multivalued attributes.  
It is helpful when you have aggregate data in data source file and you need to enumerate before collecting this data in brainwave database.  

#### EF The properties Tab

##### EF Filter

In this section you can see/modify general parameters of the component. You will find:

- the "Identifier" shown in Debug mode for example
- the "Display name" for the discovery source
- the "Follow just one link" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Enumeration](./images/enumerate_2018-04-04_18_55_10-.png "Enumeration")

##### EF Description

Comment regarding actions done by this component.

![Description](./images/enumerate_2018-04-04_18_54_59-.png "Description")

##### EF Enumeration

In this section you have to choose multivalued attributes that the component will iterate on, you can also specify if you like to iterate on duplicate values or not.

![Enumeration](./images/2018-04-05_12_13_54-.png "Enumeration")

Example with iterating on several multivalued attributes

Let suppose that the enumeration component will receive the following dataset.  

| Login            | Name      | Domain    | Localization |
|:-------------------- |:---------- |:--------- |:----------- |
| UA12B - UA15C - UA19K | Mark - Aldo | Alta.local | France     |

"Login" is a multivalued attribute having 3 elements.  
"Name" is a multivalued attribute having 2 elements.  
"Domain" is a monovalued attribute (1 element).  
"Localization" is a monovalued attribute (1 element).  

In the "Enumeration" section we will put "Login" and "Name" attributes in "Attribute to enumerate values" table.  

In this case enumeration component will iterate three times, three is the size of biggest multivalued attribute, in this example it is Login attribute.  
The enumeration will send to the next component three separated dataset as below.  

| DataSet  | Login | Name | Domain    | Localization |
|:------- |:---- |:--- |:--------- |:----------- |
| Dataset1 | UA12B | Mark | Alta.local | France     |
| Dataset2 | UA15C | Aldo | Alta.local | France     |
| Dataset3 | UA19K |    | Alta.local | France     |

### Group filter (GF)

#### GF Usage

The data grouping component is useful for gathering several values that were initially separated into several different records in a multivalued attribute. For example, a sharepoint group extraction can provide a CSV file with one line per group member. If a sharepoint group has several members, the group appears on multiple lines with all the information repeated and a different member on each line. To reconstitute a single dataset with a multivalued attribute member from multiple CSV records, you must use the grouping component.  

The grouping component works by detecting ruptures. An expression based on the content of the dataset is set in the component in order to allow it, during the execution of the collector line, to determine when a rupture occurs. In the example with the job, the rupture is when first name and last name change. In this case, enter the expression as follows:  
`{ dataset.GroupID.get() }`  

![Sharepoint group](./images/2018-04-06_17_15_03-sharepoint-Groups.csv_-_Excel.png "Sharepoint group")

For each dataset arriving in the grouping component, the expression is evaluated. If the result is different from the result of the expression in the previous dataset, this means that the new dataset relates to a different group, otherwise the dataset completes the previous dataset as it is for the same group(same Group ID). This detection is called rupture detection.  

The algorithm used to group the attribute values is as follows:  

For each dataset received by the component

1. Calculate the rupture expression

- If no break is detected (same group in the above example)
  - Aggregation of values of this new dataset (member attribute in the example) in the previous dataset
  - Removal the new dataset to send nothing to the following components
- Otherwise (new group in the example)
  - Emission of the previous dataset towards the following components
  - Memorization of the new dataset as a starting point for the attributes aggregation

This mechanism introduces a desynchronization between the datasets received by the component and the datasets issued after grouping the job attribute to the following components. Indeed, while the second dataset arrives in the component group, the group outputs the first dataset to other components, and so on. With this mechanism, when the last dataset is received, the component emits the next-to-last dataset to the following components. It is only when the collector engine goes into the Flushing state that the grouping component can transmit the last dataset which was waiting for rupture detection.  

According to the example the group component will issue the following data sets to next components  

Dataset1  

| SamAccountName                                       | GroupID                       | GroupName    |
|:---------------------------------------------------------------------- |:--------------------------------------- |:------------- |
| `BRAINWAVE\cpion18` \| `BRAINWAVE\jtourneu14` \| `BRAINWAVE\mheritie10` | c5142604-7e3c-4cbc-940d0eaad1b35856#1011 | Sales Managers |

Dataset2

| SamAccountName      | GroupID                        | GroupName |
|:--------------------- |:---------------------------------------- |:-------- |
| `BRAINWAVE\jtourneu14` | c5142604-7e3c-4cbc-940d-0eaad1b35856#1012 | Pre-Sales |

#### GF The properties Tab

##### GF Filter

In this section you can see/modify general parameters of the component. You will find:

- the "Identifier" shown in Debug mode for example
- the "Display name" for the discovery source
- the "Follow just one link" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Group filter](./images/Group_filter.png "Group filter")

##### GF Description

Comment regarding actions done by this component.

![Group filter description](./images/Group_filter_description.png "Group filter description")

##### GF Criterion

In this section you can specify the expression that will be used to aggregate data

![Group filter criterion](./images/Group_filter_criterion.png "Group filter criterion")

##### GF Aggregation

In this section you have to choose attributes where values will be grouped, attributes chosen must be multivalued.

![Group filter aggregation](./images/Group_filter_aggregation.png "Group filter aggregation")

#### GF Best practices

The data must be sorted by attributes used in the criterion, for example if your criterion is `{dataset.name().get()} + ' ' +dataset.surname().get()}`, you must order your source by name than by surname.

### Route filter (RF)

#### RF Usage

The route component does nothing, but it allows to add an ending point to follow the dataset content returned by the source collector line.

#### RF The properties Tab

##### RF Filter

In this section you can see/modify general parameters of the component. You will find:

- the "Identifier" shown in Debug mode for example
- the "Display name" for the collector line source
- the "Follow just one link" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Filter](./images/Route_2018-04-04_15_46_35-.png "Filter")

##### RF Description

Comment regarding this route component.

![Description](./images/Route_2018-04-04_15_46_49-.png "Description")

##### RF Events  

In this section you can configure the route component to trigger an event each time a dataset is transmitted and forward that event to the next component if desired  

![Events](./images/Route_2018-04-04_15_47_02-.png "Events")

### Join filter (JF)

#### JF Usage

This property allows to join two sources, in order to obtain a dataset containing information from both sources.  

![Join diagram](./images/join_diag.png "Join diagram")  

It has two distinct modes of operation (cache is enabled or not) which are detailed in the section Operating mode below.  

#### JF The properties Tab

##### JF Filter

In this tab you can see/modify general parameters of the component. You will find the following:

- Identifier (shown in Debug mode for example)
- Display name for the Join filter
- Follow just one link option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Join1](./images/join1.png "Join1")  

##### JF Description

This property allows adding comment regarding actions done by this component.

![Join2](./images/join2.png "Join2")  

##### JF Source

This property allows to select which one of the two attached sources is the secondary one, i.e. the source used to augment the dataset.  

![Join3](./images/join3.png "Join3")  

##### JF Attributes

This property allows to map attributes of the secondary dataset to attributes of the main dataset.  

![Join4](./images/join4.png "Join4")  

For example, in this case, the name attribute of the secondary source (discoverysource - company_) will be added to the main dataset under the name company\name.  

##### JF Policy

This property allows to specify the behavior of the join when less than one or more than one records of the secondary dataset matches.  

![Join5](./images/join5.png "Join5")  

##### JF Cache

This property allows to specify the behavior of the cache (see next section).

![Join6](./images/join6.png "Join6")  

#### JF Operating modes

##### JF With cache activated

When the cache is active, you need to specify both the Key attribute from main dataset and the Key attribute from secondary dataset whose values will then be matched by equality. The secondary source is iterated once and the key and corresponding dataset are kept in a cache. When the main source records are retrieved, the cache is examined to see if there exists a corresponding dataset (less than one or more than one matches are handled accordingly to the Policy property described above). If such a dataset is found, the main and secondary datasets are merged according to the Attributes property described above.  

##### JF With cache deactivated

When the cache is not active, for each record of the main source, the secondary source is fully iterated, each records being merged to the main dataset according to the Policy and Attributes property. In the secondary source, you should provide a SQL syntax request in the Request property. In this request, the attributes of the main dataset are available under the param namespace.  
For example, the request  
`SELECT * FROM dataset WHERE dataset.id LIKE UPPER(param.id) + '%'`

in the secondary source will match when the id attribute of the main source (param.id) is "acme" and the id attribute of the secondary source (dataset.id) is "ACME123".  

#### JF Best practices

The cache should  **always** be enabled as the performance impact of its deactivation is severe (the secondary source is iterated for each dataset of the main source). If you have complex matching rules, for example matching on more than one attributes, it will always be more efficient to activate the cache and use computed attributes (either at the discovery level or using an update filter) as the matching attributes.

### Script filter (SF)

#### SF Usage

This source can be used to programmatically update datasets using JavaScript functions.

#### SF The properties Tab

##### SF Filter

In this tab you can see/modify general parameters of the component. You will find the following:

- Identifier (shown in Debug mode for example)
- Display name for the Support target
- onScriptInit is the initialization JavaScript function. It is called only once per collect line
- onScriptWrite is the function which will be called for each record of the main source. It can manipulate the dataset, adding or removing attributes, changing values
- onScriptFlush is a function which is called when no more record is available from the main source. It must return true if it populated the dataset, false otherwise  
- onScriptTerminate is the function called when the collect line ends successfully  
- onScriptDispose is the function called at the end of the collect line. It is always called, whether the line ends successfully or not, and should be used to free all the resources allocated during the initialization phase (close files, database connections and so on)  
- Follow just one link option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Script filter 1](./images/script_filt1.png "Script filter 1")  
Note that all the onScript... functions are optional.

##### SF Description

This property allows adding comment regarding actions done by this component.  

![Script filter 2](./images/script_filt2.png "Script filter 2")  

##### SF Attributes

This property can be used to declare additional attributes to include in the collect line schema, for example when attributes are injected to the dataset by the JavaScript write function.  

![Script filter 3](./images/script_filt3.png "Script filter 3")

### Update filter (UF)

#### UF Usage

The **Update filter** component is an all-purpose collect component that allows to modify the collect current dataset in various ways.  
13 common tasks can be done directly by configuration only.  
More complex modifications can be achieved programatically using javascript.

The common tasks are the following:

- add new attribute, rename, duplicate or delete an attribute
- modify single-valued attribute: modify the value, replace all occurrences of one value with another, set default value if attribute is empty, convert a String attribute to a Date attribute
- manipulate multi-valued attributes: cleaning, adding values, filtering values, replacing values  
- change the silo name attribute

The update will be performed on each and every row of this collect.

#### UF The properties tab folder

##### UF Filter tab

The **Filter** property tab allows to view/modify basic parameters of the component:  

- **Identifier** displays the internal identifier of the component, useful in debug mode or for reading collect log files.
- **Display name**  for the **Update filter** , to be displayed in the collector editor.
- **Follow just one link**  option defines how multiple transition collects are being processed.  
If checked, only the first transition with an activation condition evaluated to true will be executed.  
If unchecked, all transitions with an activation condition evaluated to true will be executed.

![Filter](./images/filter.png "Filter")

##### UF Description tab

The **Description** property tab allows adding notes on the component, such as description of what the component is doing.

![Descriptin tab](./images/tab_desc.png "Descriptin tab")

##### UF Updates tab

The Updates tab allows to display and modify the list of update operations in this component.  

![Updates tab](./images/tab_updates.png "Updates tab")  

You can carry out the following tasks:

- **Add** allows to add a new operation through configuration wizard.  
You can select from 13 differents actions.  
The various actions are detailed in the following sections.  

![Add](./images/add.png "Add")  

- **Edit** allows modifying the currently selected operation
- **Up / Down** allows to reorganize actions processing order. First actions are executed first.
- **Delete** deletes the currently selected action from the list.  
- The right panel displays details on the selected action
- **Modification function** allows creating or selecting a javascript function to perform the modifications. See section below for details.

The sections below details the 13 operations plus javascript based update operation.

###### Add an attribute

This action allows to define a new named attribute in the dataset, with an initial computed value.  
The attribute can be used in further actions and in other components of the collect.  
The attribute will be added to the end of the list. It can be moved towards the beginning using **Up** button.

- **Attribute** defines the unique name of the attribute withing the current dataset.
- **Value Type** sets the type of the attribute. The following types are valid: String, Number, Boolean and Date.
- **This attribute can be multivalued** determines whether the attribute is single valued or multi-valued.  
Multi-valued attributes are like varying size lists.
- **Value** sets an initial computed Macro expression value for the new attribute. a Macro is a mix of static (string) and javascript expressions enclosed in braces.  
Read more on Macros: [03 Macros et scripts](./05-macros-and-scripts).
- **Description** is an optional description of the purpose of this attribute
- **Trigger an error if the attribute to add already exists**  option will trigger an error in the log event file if an attribute with the same name already exists in the dataset.  
If checked, **Event** lets you define the specific event name to trigger

![Add an attribute](./images/1_add.png "Add an attribute")  

###### Modify an attribute

This action allow you to set a new value for an existing attribute.

- **Attribute** selects the attribute to be modifed from the dataset. Use the right arrow menu to select an attribute
- **Value** defines the new value using a -Macro- expression. Read more on Macros: [Macros et scripts](./05-macros-and-scripts)  
- **Trigger an error if the attribute to modify does not exist**  option will trigger an error in the log event file if the attribute to select was dynamically removed without notice ( this should not normally occur)  
If checked, **Event** lets you define the specific event name to trigger

![Modify an attribute](./images/2_modify.png "Modify an attribute")  

###### Replace an attribute value

This action allow you to replace an occurrence of a value for a given single-valued attribute by another value.  
If the attribute contains another value, its value is not modified.

- **Attribute** selects the attribute from the dataset for which values should be replaced. Use the right arrow menu to select an attribute
- **Old Value** sets the value to search and replace. This is a static value that will be interpreted based on the attribute type.
- **Value** defines the new value using a -Macro- expression. Read more on Macros: [Macros et scripts](./05-macros-and-scripts)  
- **Trigger an error if the attribute to modify does not exist**  option will trigger an error in the log event file if the attribute to select was dynamically removed without notice ( this should not normally occur)  
If checked, **Event** lets you define the specific event name to trigger

![Replace an attribute](./images/3_replace.png "Replace an attribute")  

###### Set a default value if an attribute is empty

This action allow you to set a default value for a given attribute if its current value is null or empty string.

If the attribute value is not null, it's not modified.

- **Attribute** selects the attribute to be modifed from the dataset. Use the right arrow menu to select an attribute
- **Value** defines the default value using a -Macro- expression. Read more on Macros: [Macros et scripts](./05-macros-and-scripts).
- **Trigger an error if the attribute to modify does not exist**  option will trigger an error in the log event file if the attribute to select was dynamically removed without notice ( this should not normally occur)  
If checked, **Event** lets you define the specific event name to trigger

![Default](./images/4_default.png "Default")  

###### Change the name of the silo

This actions allows to change  on-the-fly the dynamic name of the silo, that is the value of `config.siloName_variable`.  
This could be useful for example if several input files are gathered into one single source file and must be processed in the same collect line.  

- **Value** defines the value for the dynamic silo name as a -Macro- expression. Read more on Macros: [Macros et scripts](./05-macros-and-scripts).

![Silo](./images/silo.png "Silo")  

###### Convert a string to a date

This action is a shortcut to create a new Date attribute based on the string value of another, and using a date-time conversion format.

- **Attribute to convert** lets you select the source attribute which value will be converted. The attribute can be of any type.
- **New name** lets you set the name for the newly created date attribute.
- **Format** lets you set the conversion format to use. You can either select a predefined format from the right list, or type a custom format using y M d H.
- **Description** lets you set an optional description for the new attribute stating its purpose.

![Date](./images/5_date.png "Date")  

###### Deletion of an attribute

This action allows you to dynamically remove an existing attribute from the current dataset.  
Once deleted, the attribute won't be available in further actions or collect components.

- **Attribute to delete** lets you select the attribute to delete from the dataset.  

![Delete](./images/5b_delete.png "Delete")  

###### Rename an attribute

This action allows you to give a new name to an existing attribute from the current dataset. Values are kepts unchanged but will be accessed through the new name.

- **Attribute to rename** lets you select the attribute to modify from the current dataset.
- **New name** is the new name for the attribute. This new name must not exist already in the dataset.

![Rename](./images/5c_rename.png "Rename")  

###### Duplicate an attribute

This action allows you to duplicate an attribute with a different name and the same initial values.

- **Attribute to duplicate** lets you select the attribute to duplicate from the current dataset.
- **New name**  is the name for the duplicate attribute. This new name must not exist already in the dataset.

![Duplicate](./images/6_duplicate.png "Duplicate")  

###### Clean a multivalued attribute

This action allows you to clean up multivalued attributes by removing empty or null values and/or duplicate values.  
It can also synchronize other multivalued lists with the removed rows.

- **Attribute** lets you select the attribute to clean up. only multivalued attributes can be selected.
- **Remove empty of null values**  option determines if null or empty values should be removed from the list of values of the attribute
- **Remove duplicate values** option determines if duplicate values should be removed from the list, keeping only the first occurrence of each
- **Attribute1,Attribute2,Attribute 3**  lets you select up to 3 other multivalued attributes, of the same size, that should be kept in sync with the cleaned attribute.  
That is, for each row index that was removed from the list ( because it was null/duplicate), the same row index will be removed from the synchronized list.  

![Clean multivalued attribute](./images/7_clean_MV.png "Clean multivalued attribute")  

###### Add a value in a multivalued attribute

This actions allows to add one or move values to a multivalued attributes, either from another single or multivalued attribute, or from a computed value.

- **Attribute**: lets you select the multivalued attribute to modify. Only multivalued attributes can be selected.
- **Add an attribute** : lets you optionally select another attribute ( single or multivalued) from which values should be copied. If empty, the attribute is ignored
- **Value**: optionally define an macro expression which value will be added to the list. the value computed by the macro expression must be of the same type as the list to modify.  
If empty, this field is ignored.  
- **Do not add values if they already exist**  option determines whether values that already exist in the list can be added. If checked, duplicates values are not added.

![Add multivalued attribute](./images/8_add_MV.png "Add multivalued attribute")  

###### Filter some values of a multivalued attribute

This action allows you to filter values from a list attribute, matching a given condition.  
It can also synchronize other multivalued lists with the removed rows.

- **Attribute** lets you select the multivalued attribute to filter. only multivalued attributes can be selected.
- **Keep matching values** option determines that the values in the list matching the condition will be kept and the values not matching will be removed from the list
- **Remove matching values** option on the opposite, that the values in the list not matching the condition will be kept and the values matching will be removed from the list  

There are 3 possible matching conditions:  

**Another attribute**: compares the elements in the list with the value(s) of another attribute

- If the attribute to match is single-valued, items that are equal to the matching attribute single value will be selected
- If the attribute to match is multi-valued, items that are equal to any value in the matching attribute values will be selected.

**Attribute**: select another attribute to match. This could be either a single-valued or multi-valued attribute  

**Computed expression**: compares the elements in the list with the value of a macro expression.

- Items in the list that are equal to the value of the computed expression will be selected

**Value**: type a macro expression , which value will be compared to each item in the list. Read more on Macros: [Macros et scripts](./05-macros-and-scripts).

**Pattern**: matches the elements in the list against a regular expression pattern.

- Items in the list that that match the pattern will be selected. Syntax of the regular expression pattern follows javascript RegExp syntax.  

**Regular Expression**: type a valid regular expression pattern

**Test Value**: helper field, to test your regular expression. If the test value does not match the regular expression, a message "Test value does not match the regular expression" is displayed

**Attribute1,Attribute2,Attribute3**  lets you select up to 3 other multivalued attributes, of the same size, that will be kept in sync with the filtered attribute. That is, for each row index that was removed from the list ( according to filtering conditions), the same row index will be removed from the synchronized lists.

![Filter multivalued attribute](./images/9_filter_MV.png "Filter multivalued attribute")  

###### Replace values of a multivalued attribute

This action allows you to replace all values from a list attribute with another static or computed value.

- **Attribute** lets you select the multivalued attribute to be processed. only multivalued attributes can be selected.
- **Value** defines the replacement value for each item using a -Macro- expression. Read more on Macros: [Macros et scripts](./05-macros-and-scripts).

> The replacement value can use the original value of each item in the list.  
> In this case, the original value will be available as a single-valued attribute with the same name.
> For example, to capitalize all values in a multivalued attribute called list1, you would use the following expression:  `{dataset.list1.get().toUppercase()}`

![Filter multivalued attribute](./images/10_replace_MV.png "Replace multivalued attribute")  

###### Javascript modification

This fields allows you to use a javascript function to perform the modifications.

![Function](./images/function.png "Function")  

**Modification function**: Name of the function that performs the modifications, without parentheses.  
This function must have an empty signature.

Here is an example of function:

```javascript
function doUpdate() {
 // add new attribute
  dataset.add("computedAttr" );

  var value = null;
  switch(dataset.type.get()) {
  case "A": value = "John"; break;
  case "B": value = "Michael"; break;
  case "C": value = "Eric" ; break;
  case "D": value = "La reponse D"; break;
  }
  dataset.get("computedAttr").set(value);
}
```

If both configuration actions and a javascript modification function are defined, the javascript function will be executed after the configuration actions.

##### UF Attributes Tab

The **Attributes** tab allows to declare dataset attributes that may have been created inside the javascript modify function.  
When using a javascript function to perform the modifications, you may have to create new attributes using **dataset.add()** API.  
In this case, you need to decleare them , so that they are known by the collector and can be used in further components.

![Attributes tab](./images/tab_attrs.png "Attributes tab")  

#### UF Best practices

Always try to perform your modifications using an existing predefined update, before using javascript. This will ensure the modifications are done in the most efficient way.

Data qualify modifications that apply directly to source attributes should be preferably be done in the discovery.

### Validation filter (VF)

#### VF Usage

This filter component allows to add validation rules to some dataset. When one of these rules fails for a dataset, it will be possible to emit an event (but will still pass the filter).

#### VF The properties Tab

##### VF Filter

In this tab you can see/modify general parameters of the component. You will find the following:

- Identifier (shown in Debug mode for example)
- Display name for the Validation filter
- Follow just one link option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Validate filter](./images/valid1.png "Validate filter")

##### VF Description

This property allows adding comment regarding actions done by this component.  

![Validate filter2](./images/valid2.png "Validate filter2")

##### VF Mandatory

This property allows to specify that some given attributes of the dataset must be present and not empty.  

![Validate filter3](./images/valid3.png "Validate filter3")  

An attribute can be added with the following dialog:  

![Dialog](./images/valid-dlg1.png "Dialog")  
Here you specify which attribute must not be empty, the name of the event (will default to "error" if not specified) and if the event should appear in the event file or not.  

##### VF Syntax

This property allows to specify that some attributes must match some regular expressions.  

![Validate filter4](./images/valid4.png "Validate filter4")  

A condition can be added with the following dialog:  

![Dialog2](./images/valid-dlg2.png "Dialog2")  
Here you specify the attribute, the regular expression it must match, the name of the event (will default to "error" if not specified) and if the event should appear in the event file or not.  
The field Sample value can be used to test the regular expression.  

##### VF Uniqueness

In this property, you can specify up to 3 attributes whose values must be unique among the source.  

![Validate filter5](./images/valid5.png "Validate filter5")  
You can also indicate the name of the event (will default to "error" if not specified) and if the event should appear in the event file or not.  

##### VF Condition

Here you can specify a condition on the dataset as a JavaScript function returning a boolean.  

![Validate filter6](./images/valid6.png "Validate filter6")  

Validation Function is the name of a JavaScript function written in the .javascript file associated with this collector line.  
You can also indicate the name of the event (will default to "error" if not specified) and if the event should appear in the event file or not.  

##### VF Multiplicity

Using this property, you can specify a maximum or minimum number of records propagated by this filter.  

![Validate filter7](./images/valid7.png "Validate filter7")

## Sources

### Collector line source (CLS)

#### (CLS) Usage  

The collector line source allows the product to read data that will be filtered by an existing collect line.

#### (CLS) The properties Tab

##### (CLS) Source

In this sub-tab it is possible to see/modify general parameters of the component. You will find:

- The "Identifier" shown in Debug mode for example
- The "Display name" for the collector line source
- Collector line: collect line to use as a data source
- The "Follow just one link" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Collector line source](./images/collector_line_source.png "Collector line source")  

##### (CLS) Description

This section allow the configuration of comments regarding actions done by this source component.

![Description](./images/description.png "Description")  

##### (CLS) Configuration

This section allows the user to override variables defined in the collector line.

![Configuration](./images/config.png "Configuration")  

##### (CLS) Request

SQL syntax request: is an sql-like select query to filter source records.

The query may check values from current record by using dataset variable as if it was a table.

For example, `SELECT * FROM dataset WHERE dataset.hrcode <> 'VIP'` keeps only records which have a HR code attribute with a value different from 'VIP'.  

![Request](./images/request.png "Request")

##### (CLS) Sort

In this section you can configure a multi-criteria sort. You will find:

- Sort number 1 (main sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 2 (Second sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 3 (Third sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  

The sort direction can also be changed (A-Z for ascending or Z-A for descending).

![Sort](./images/sort.png "Sort")

##### (CLS) Limits

In this section you can configure a limitation on the selected records from the source, You will find:

- Skip the `nb` first records: Used to select a subset of the records by skipping the first records.  
- Select a maximum of `max` records: Used to select a subset of the records by reading only a specified number of records.

![Limits](./images/limits.png "Limits")

#### (CLS) Best practices

You may have a performance issue when using a limit and/or a sort.

### Filtered source (discovery)

#### Discovery Usage

The Filtered discovery source allows the product to read data that will be filtered by an existing discovery.  

This is the main source type to use when building your collector lines as the modification of the input data is done in the the discovery file, and the collector line can they simple be used to map the various imported data to the concepts of Brainwave GRC's model.  

#### Discovery The properties Tab

##### Discovery Source

In this property you can see/modify general parameters of the component. You will find:

- The "Identifier" shown in Debug mode for example
- The "Display name" for the discovery source
- Discovery file: the discovery file to use as a data source
- Data file is the absolute path of data file to load. This parameter allow the use of macros such as `{config.projectPath}`. This parameter is optional, and if empty then the file defined in the discovery file is used.  
- The "Follow just one link" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Filtered discovery source](./images/filtered_discovery_source.png "Filtered discovery source")

##### Discovery Description

This property allows adding comment regarding actions done by this component.

![Filtered discovery source description](./images/filtered_discovery_source_description.png "Filtered discovery source description")

##### Discovery Request

SQL syntax request: is an sql-like select query to filter source records.

The query may check values from current record by using dataset variable as if it was a table.

For example, `SELECT * FROM dataset WHERE dataset.hrcode <> 'VIP'` keeps only records which have a HR code attribute with a value different from 'VIP'.

![Filtered discovery source request](./images/filtered_discovery_source_request.png "Filtered discovery source request")

##### Discovery Sort

In this section you can configure a multi-criteria sort. You will find:  

- Sort number 1 (main sort criteria): is attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 2 (Second sort criteria): is attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 3 (Third sort criteria): is attribute name used to sort all source records before delivering them to the collector line in the right order.  

The sort direction can also be changed (A-Z for ascending or Z-A for descending).

![Filtered discovery source sort](./images/filtered_discovery_source_sort.png "Filtered discovery source sort")

##### Discovery Limits

In this section you can configure a limitation on the selected records from the source, You will find:

- "Skip the `nb` first records": Used to select a subset of the records by skipping the first records.  
- "Select a maximum of `max` records": Used to select a subset of the records by reading only a specified number of records.

![Filtered discovery source limit](./images/filtered_discovery_source_limit.png "Filtered discovery source limit")

##### Discovery Constraints

In this section you can define constraints to not use the file, You will find:

- "If file size is less than `size` kilo bytes": Triggers an exception and stops collector line if the source file size is less than a specified number of kilo-bytes. Used to prevent from reading an incomplete file in automatic mode because of an error during a file transfer for example.  

- "If last modification date is older than `modifDate` hour(s)": Triggers an exception and stops collector line if the source file last modification date is older than a specified number of hours. Used to prevent from reading an obsolete file in automatic mode because of an error during the export process for example.  

- "If a column is missing in the file": Triggers an exception and stops collector line if the file schema is different from the schema defined in the source component. Used to prevent from reading a file with a bad format in automatic mode because of a format or layout change in the exported data for example.

![Filtered discovery source constraints](./images/filtered_discovery_source_constraints.png "Filtered discovery source constraints")

#### Discovery Best practices

You may have a performance issue when using a limit and/or a sort.

### Script source (SS)

#### (SS) Usage

This source can be used to programmatically generate datasets from JavaScript functions. It can be used to access external resources or parse files whose format is not supported by the discovery source.  

#### (SS) The properties Tab

##### (SS) Source

In this tab you can see/modify general parameters of the component. You will find the following:

- Identifier (shown in Debug mode for example)
- Display name for the Support target
- File to analyze is an optional path to a file  
- onScriptInit is the initialization JavaScript function. It can take a parameter which will be the file specified just above. It is called only once per collect line  
- onScriptReset is a function which will only be called if this component is the secondary source of a join filter having its cache disabled. In this case, it will be called once for each record of the main source  
- onScriptRead is the function which will be called to get the next record. It can manipulate the dataset, adding or removing attributes, changing values. It must return true if there are more records to read, false otherwise  
- onScriptTerminate is the function called when the collect line ends successfully  
- onScriptDispose is the function called at the end of the collect line. It is always called, whether the line ends successfully or not, and should be used to free all the resources allocated during the initialization phase (close files, database connections and so on)  
- Follow just one link option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Script source1](./images/script_src1.png "Script source1")  
Note that all the onScript... functions are optional.  

#### (SS) Description

This property allows adding comment regarding actions done by this component.

![Script source2](./images/script_src2.png "Script source2")

##### (SS) Attributes

This property can be used to declare additional attributes to include in the collect line schema, for example when attributes are injected to the dataset by the JavaScript read function.

![Script source3](./images/script_src3.png "Script source3")

##### (SS) Request

SQL syntax request: is an sql-like select query to filter source records.  

The query may check values from current record by using dataset variable as if it was a table.  

For example, `SELECT * FROM dataset WHERE dataset.hrcode <> 'VIP'` keeps only records which have a HR code attribute with a value different from 'VIP'.

![Script source4](./images/script_src4.png "Script source4")

##### (SS) Sort

In this section you can configure a multi-criteria sort. You will find:

- Sort number 1 (main sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 2 (Second sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 3 (Third sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  

The sort direction can also be changed (A-Z for ascending or Z-A for descending).

![Script source5](./images/script_src5.png "Script source5")

##### (SS) Limits

In this section you can configure a limitation on the selected records from the source, You will find:

- Skip the `nb` first records: Used to select a subset of the records by skipping the first records.  
- Select a maximum of `max` records: Used to select a subset of the records by reading only a specified number of records.

![Script source6](./images/script_src6.png "Script source6")

#### (SS) Best practices

This source should only be used in very specific cases where a discovery source is not suitable. These include (but are not limited to) external resources such as a REST API, a database connection or some "flat" XML files.

In the other cases, a filtered source (discovery) will be much more efficient and maintainable.

#### (SS) Error handling  

Any exception raised during the execution of one of the JavaScript functions will cause the collect engine to stop. The exception is logged in the collect log file.

### Sheet enumerator for Excel file source (ES)

#### (ES) Usage

This source component allows to enumerate the sheets belonging to an Excel workbook.  

Four attributes are added to the dataset:  

- filename will be the file name of the Excel file (string),  
- sheetname will contain the name of the current sheet (string),  
- sheetnumber will contain the index number of the current sheet (number),  
- totalnumberofsheets will contain the total number of sheets of the Excel workbook (number).  

#### (ES) The properties Tab

##### (ES) Source

In this tab you can see/modify general parameters of the component. You will find the following:

- Identifier (shown in Debug mode for example)
- Display name for the target
- Excel File (XLS, XLSX) is the path to the Excel file to use  
- Follow just one link option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Source](./images/xls1.png "Source")

##### (ES) Description

This property allows adding comment regarding actions done by this component.  

![Description](./images/xls2.png "Description")

### Start (S)

#### (S) Usage

The Start component is used to start a collector line without necessarily having a data source, it is useful when using collection sequences.  

Example: to create model object, such as repositories, applications and so on, that are based on data declared in the project or in a silo and not in import files.  

#### (S) The properties Tab

##### (S) Source

In this sub-tab you can see/modify general parameters of the component. You will find:

- The "Identifier" shown in Debug mode for example
- The "Display name" for the discovery source
- The "Follow just one link" option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation evaluation evaluated to true will be executed.

![Start source](./images/start-source.png "Start source")

##### (S) Description

Allows the addition of comments regarding actions done by this source component.

![Description](./images/start-description.png "Description")

##### (S) Configuration

In this section you can override the values of variables used in the collector line.

![Configuration](./images/start-config.png "Configuration")

##### (S) Request

SQL syntax request: is an sql-like select query to filter source records.

The query may check values from current record by using dataset variable as if it was a table.

For example, `SELECT * FROM dataset WHERE dataset.hrcode <> 'VIP'` keeps only records which have a HR code attribute with a value different from 'VIP'.

![Request](./images/start-request.png "Request")

##### (S) Sort

In this section you can configure a multi-criteria sort. You will find:

- Sort number 1 (main sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 2 (Second sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  
- Sort number 3 (Third sort criteria): Attribute name used to sort all source records before delivering them to the collector line in the right order.  

The sort direction can also be changed (A-Z for ascending or Z-A for descending).

![Sort](./images/start-sort.png "Sort")

##### (S) Limits

In this section you can configure a limitation on the selected records from the source, You will find:

- Skip the `nb` first records: Used to select a subset of the records by skipping the first records.  
- Select a maximum of `max` records: Used to select a subset of the records by reading only a specified number of records.

![Limits](./images/start-limits.png "Limits")

#### (S) Best practices

You may have a performance issue when using a limit and/or a sort.

### View source (VS)

#### (VS) Usage

The **View Source** component enables the use of view result as a input during the data collection phase. This component can be use to use data that is not related to the current timeslot.  
One use case is to inject Audit Logs data through a Logs Views source to compute Usage data.  
Another use case is to retrieve right reviews data (through a View source on Ticket Reviews) to collect theoretical rights.

> The view source should be used with caution on regular Ledger Entities, such as accounts, applications, and identities, as the underlying view retrieves data from the **previous** timeslot.

![Editor](./images/editor.png "Editor")

#### (VS) The Properties tab

##### (VS) View tab

This tab lets you select the view to be used, and set parameters if needed.

- **Source view** : select the view to use as a source. This could be either an audit view, a business view or a logs view
- **Parameters** : you can set parameters to the view if needed.  
To set a parameter, click Add button, select a parameter for the list and set a view.

![Tab view](./images/tabview.png "Tab view")

##### (VS) Limits tab

This tab lets yous optionally set limits to the results of the view. You can skip rows and/or limit the maximum number of results returned by the view

- **Skip** : type a number to skip the first records of the view. If left blank, not records are skipped.
- **Select maximum** : type a number to limit the maximum number of records that will be returned by the view. Leave blank to return all records.

![Limits tab](./images/tablimits.png "Limits tab")

##### (VS) Description tab

This tab lets you put a description on the purpose of this component.

![Description tab](./images/tabdesc.png "Description tab")

#### (VS) Best practices

- View Source should be used on data that is **not related** to a given timeslot, such as Audit Logs, Tickets, Ticket actions and Ticket Reviews,
- View Source should be used with caution on regular Ledger entities (such as accounts, applications, identities) because the view executes against the previous timeslot, which means the results will be inaccurate if entities have changed. View Sources do not retrieve data from the current sandbox.

##### (VS) Theoretical rights example

One approach to defining the theoretical rights of people in the Ledger (i.e. what rights people are expected possess in a given application) is through rights reviews: Basically, you use the manual reviews settings (set by the reviewers) to create the theoretical rights matrix.

Rights reviews (associations between a person or a group of persons and an application) end up as ticket reviews objects in the Ledger, with a specific type.  

The collector will consist of the following components:  

- a **View Source** referring to a view that will retrieve all ticket reviews of a specific type (e.g. PERMISSIOSNREVIEW) with the associated people/application information.
- An **Update Filter** component that will set various attributes (e.g. right type) to ensure the adequate Entitlement Model rules are executed
- A **Theoretical rights target**  component to store the rights matrix.

## Targets

Please refer to the following sub-pages for the documentation of all data collection targets.

## Collecting Sod Matrix

This document describes how SoD Matrix are collected in Brainwave iGRC. Usually, SoD matrix are maintained in organization in different Excel sheets in specific format where each SoD rules is relative to an incompatibility of a rights/permission vs another one.

The traditional format for such matrix in external Excel sheets usually use pivot table:

![Pivot table](./images/SoD_Pivot_Table.png "Pivot table")  

Brainwave iGRC data model concept integrates the two following SoD concepts:  

- SoD Matrix (with a identifier, a name, a description)  
- SoD permission pair (attached to an existing SoD Matrix, and referencing a pair of two incompatible permissions).

The SoD Matrix and permission pair generates standard control discrepancies.

### Procedure

In order to define SoD Matrix, an additional target is available in collector palette:

![Collector palette](./images/SoD_Palet1.png "Collector palette")  

The SOD matrix target creates a new matrix in Brainwave data model:

![SOD matrix target](./images/SoD_Collect1.png "SOD matrix target")  

![SOD matrix target](./images/SoD_Collect2.png "SOD matrix target")  

In order to define SoD rules, an additional target is available in collector palette:

![Collector palette](./images/SoD_Palet2.png "Collector palette")  

This target add new SoD rules in an existing SoD matrix:

![SoD matrix](./images/SoD_Collect4.png "SoD matrix")  

A rule has to be inserted in an existing SoD Matrix. This rule references first permission incompatible with a second one:

![SoD matrix](./images/SoD_Collect3.png "SoD matrix")  

Additional information can be added for each risk:

![Parameters](./images/SoD_Collect5.png "Parameters")  

Some SoD components can be used in views to list information regarding collected SoD Matrix and SoD rules (permission pairs):

![SoD view](./images/SoD_View1.png "SoD view")  

### Example

The attached SODsample.facet includes an example of SoD rules collect, and SoD matrix report.

- `importfiles/SOD/SOD_example.xlsx`: excel sheet including some sample SoD rules
- `discovery/SOD/SOD.discovery`: excel sheet discovery
- `collectors/SOD/SOD.collector`: SoD Matrix and rules collect
- `collectors/SOD/SOD.javascript`
- `views/custom/SOD/SOD_matrix.view`: view to retrieve SoD matrix information
- `reports/custom/SOD/SOD_matrix.rptdesign`: sample SoD matrix report

### Downloads

[SODsample.facet](./assets/SODsample.facet)

## Depreciated Components

### Depreciated sources

Historically when developing a data collector line the only sources available were the following.

- Formatted source
- LDIF source
- Excel Source
- XML source
- CSV source

These sources only allowed the user to collect the raw data from the source file. All post processing actions had to be done in the collector line.  
In order to bypass this limitation a new source was created to replace all above mentioned sources: the filtered source (discovery).  

As a result, these sources remain in the product for compatibility reasons, however it is **highly** recommended to use a Filtered source.  

Please see the Filtered source description for more details.

#### File enumerator

The files enumerator source is delivered with the files enumerator facet.  
This facet allows the user to iterate on a number of input files in a collector line, different LDIF files corresponding to different domains, for example.  
This facet was developed before the addition of silos in the version 2015 that included this functionality by default in the product.  
As a result, this source remains in the product for compatibility reasons, however if you wish to iterate over input files it is highly recommended to use the iteration capabilities of silos:  

![Silo iteration](./images/silo-iteration.png "Silo iteration")

#### SOD control target

This target is deprecated. It is recommended to use both SOD matrix target and SOD matrix permission pair target to create SOD controls.  
This deprecated target was used to generate a project file (a .control) for each matrix cell. The new SOD matrix targets share the same goal but the matrix cells are stored in the Ledger.  
