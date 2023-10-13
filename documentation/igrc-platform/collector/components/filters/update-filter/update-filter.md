---
layout: page
title: "Update filter"
parent: "Components : Filters"
grand_parent: "Components"
nav_order: 7
permalink: /docs/igrc-platform/collector/components/filter/update-filter/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

The **Update filter** component is an all-purpose collect component that allows to modify the collect current dataset in various ways.   
13 common tasks can be done directly by configuration only.   
More complex modifications can be achieved programatically using javascript.

The common tasks are the following:

- add new attribute, rename, duplicate or delete an attribute
- modify single-valued attribute: modify the value, replace all occurrences of one value with another, set default value if attribute is empty, convert a String attribute to a Date attribute
- manipulate multi-valued attributes: cleaning, adding values, filtering values, replacing values  
- change the silo name attribute

The update will be performed on each and every row of this collect.

# The properties tab folder

## Filter tab

The **Filter** property tab allows to view/modify basic parameters of the component:   

- **Identifier** displays the internal identifier of the component, useful in debug mode or for reading collect log files.
- **Display name**  for the **Update filter** , to be displayed in the collector editor.
- **Follow just one link**  option defines how multiple transition collects are being processed.   
If checked, only the first transition with an activation condition evaluated to true will be executed.   
If unchecked, all transitions with an activation condition evaluated to true will be executed.

![Filter](igrc-platform/collector/components/filters/update-filter/images/filter.png "Filter")

## Description tab

The **Description** property tab allows adding notes on the component, such as description of what the component is doing.

![Descriptin tab](igrc-platform/collector/components/filters/update-filter/images/tab_desc.png "Descriptin tab")

## Updates tab

The Updates tab allows to display and modify the list of update operations in this component.  

![Updates tab](igrc-platform/collector/components/filters/update-filter/images/tab_updates.png "Updates tab")   

You can carry out the following tasks:

- **Add** allows to add a new operation through configuration wizard.  
You can select from 13 differents actions.  
The various actions are detailed in the following sections.  

![Add](igrc-platform/collector/components/filters/update-filter/images/add.png "Add")   

- **Edit** allows modifying the currently selected operation
- **Up / Down** allows to reorganize actions processing order. First actions are executed first.
- **Delete** deletes the currently selected action from the list.  
- The right panel displays details on the selected action
- **Modification function** allows creating or selecting a javascript function to perform the modifications. See section below for details.

The sections below details the 13 operations plus javascript based update operation.

### 1 Add an attribute

This action allows to define a new named attribute in the dataset, with an initial computed value.   
The attribute can be used in further actions and in other components of the collect.   
The attribute will be added to the end of the list. It can be moved towards the beginning using **Up** button.

- **Attribute** defines the unique name of the attribute withing the current dataset.
- **Value Type** sets the type of the attribute. The following types are valid: String, Number, Boolean and Date.
- **This attribute can be multivalued** determines whether the attribute is single valued or multi-valued.   
Multi-valued attributes are like varying size lists.
- **Value** sets an initial computed _Macro_ expression value for the new attribute. a Macro is a mix of static (string) and javascript expressions enclosed in braces.  
Read more on Macros : [03 Macros et scripts](/docs/igrc-platform/collector/macros-and-scripts/).
- **Description** is an optional description of the purpose of this attribute
- **Trigger an error if the attribute to add already exists**  option will trigger an error in the log event file if an attribute with the same name already exists in the dataset.  
If checked, **Event** lets you define the specific event name to trigger

![Add an attribute](igrc-platform/collector/components/filters/update-filter/images/1_add.png "Add an attribute")   

### 2 Modify an attribute

This action allow you to set a new value for an existing attribute.

- **Attribute** selects the attribute to be modifed from the dataset. Use the right arrow menu to select an attribute
- **Value** defines the new value using a -Macro- expression. Read more on Macros : [Macros et scripts](igrc-platform/collector/macros-and-scripts/macros-and-scripts.md)   
- **Trigger an error if the attribute to modify does not exist**  option will trigger an error in the log event file if the attribute to select was dynamically removed without notice ( this should not normally occur)   
If checked, **Event** lets you define the specific event name to trigger

![Modify an attribute](igrc-platform/collector/components/filters/update-filter/images/2_modify.png "Modify an attribute")   

### 3 Replace an attribute value

This action allow you to replace an occurrence of a value for a given single-valued attribute by another value.   
If the attribute contains another value, its value is not modified.

- **Attribute** selects the attribute from the dataset for which values should be replaced. Use the right arrow menu to select an attribute
- **Old Value** sets the value to search and replace. This is a static value that will be interpreted based on the attribute type.
- **Value** defines the new value using a -Macro- expression. Read more on Macros : [Macros et scripts](igrc-platform/collector/macros-and-scripts/macros-and-scripts.md)   
- **Trigger an error if the attribute to modify does not exist**  option will trigger an error in the log event file if the attribute to select was dynamically removed without notice ( this should not normally occur)   
If checked, **Event** lets you define the specific event name to trigger

![Replace an attribute](igrc-platform/collector/components/filters/update-filter/images/3_replace.png "Replace an attribute")   

### 4 Set a default value if an attribute is empty

This action allow you to set a default value for a given attribute if its current value is null or empty string.

If the attribute value is not null, it's not modified.

- **Attribute** selects the attribute to be modifed from the dataset. Use the right arrow menu to select an attribute
- **Value** defines the default value using a -Macro- expression. Read more on Macros : [Macros et scripts](igrc-platform/collector/macros-and-scripts/macros-and-scripts.md).
- **Trigger an error if the attribute to modify does not exist**  option will trigger an error in the log event file if the attribute to select was dynamically removed without notice ( this should not normally occur)   
If checked, **Event** lets you define the specific event name to trigger

![Default](igrc-platform/collector/components/filters/update-filter/images/4_default.png "Default")   

### 5 Change the name of the silo

This actions allows to change  on-the-fly the dynamic name of the silo, that is the value of _config.siloName_variable._   
This could be useful for example if several input files are gathered into one single source file and must be processed in the same collect line.    

- **Value** defines the value for the dynamic silo name as a -Macro- expression. Read more on Macros : [Macros et scripts](igrc-platform/collector/macros-and-scripts/macros-and-scripts.md).

![Silo](igrc-platform/collector/components/filters/update-filter/images/silo.png "Silo")   

### 6 Convert a string to a date

This action is a shortcut to create a new _Date_ attribute based on the string value of another, and using a date-time conversion format.

- **Attribute to convert** lets you select the source attribute which value will be converted. The attribute can be of any type.
- **New name** lets you set the name for the newly created date attribute.
- **Format** lets you set the conversion format to use. You can either select a predefined format from the right list, or type a custom format using y M d H.
- **Description** lets you set an optional description for the new attribute stating its purpose.

![Date](igrc-platform/collector/components/filters/update-filter/images/5_date.png "Date")   

### 7 Deletion of an attribute

This action allows you to dynamically remove an existing attribute from the current dataset.  
Once deleted, the attribute won't be available in further actions or collect components.

- **Attribute to delete** lets you select the attribute to delete from the dataset.  

![Delete](igrc-platform/collector/components/filters/update-filter/images/5b_delete.png "Delete")   

### 8 Rename an attribute

This action allows you to give a new name to an existing attribute from the current dataset. Values are kepts unchanged but will be accessed through the new name.

- **Attribute to rename** lets you select the attribute to modify from the current dataset.
- **New name** is the new name for the attribute. This new name must not exist already in the dataset.

![Rename](igrc-platform/collector/components/filters/update-filter/images/5c_rename.png "Rename")   

### 9 Duplicate an attribute

This action allows you to duplicate an attribute with a different name and the same initial values.

- **Attribute to duplicate** lets you select the attribute to duplicate from the current dataset.
- **New name**  is the name for the duplicate attribute. This new name must not exist already in the dataset.

![Duplicate](igrc-platform/collector/components/filters/update-filter/images/6_duplicate.png "Duplicate")   

### 10 Clean a multivalued attribute

This action allows you to clean up multivalued attributes by removing empty or null values and/or duplicate values.  
It can also synchronize other multivalued lists with the removed rows.

- **Attribute** lets you select the attribute to clean up. only multivalued attributes can be selected.
- **Remove empty of null values**  option determines if null or empty values should be removed from the list of values of the attribute
- **Remove duplicate values** option determines if duplicate values should be removed from the list, keeping only the first occurrence of each
- **Attribute1,Attribute2,Attribute 3**  lets you select up to 3 other multivalued attributes, of the same size, that should be kept in sync with the cleaned attribute.  
That is, for each row index that was removed from the list ( because it was null/duplicate), the same row index will be removed from the synchronized list.   

![Clean multivalued attribute](igrc-platform/collector/components/filters/update-filter/images/7_clean_MV.png "Clean multivalued attribute")   

### 11 Add a value in a multivalued attribute

This actions allows to add one or move values to a multivalued attributes, either from another single or multivalued attribute, or from a computed value.

- **Attribute** : lets you select the multivalued attribute to modify. Only multivalued attributes can be selected.
- **Add an attribute**  : lets you optionally select another attribute ( single or multivalued) from which values should be copied. If empty, the attribute is ignored
- **Value** : optionally define an macro expression which value will be added to the list. the value computed by the macro expression must be of the same type as the list to modify.  
If empty, this field is ignored.  
- **Do not add values if they already exist**  option determines whether values that already exist in the list can be added. If checked, duplicates values are not added.

![Add multivalued attribute](igrc-platform/collector/components/filters/update-filter/images/8_add_MV.png "Add multivalued attribute")   

### 12 Filter some values of a multivalued attribute

This action allows you to filter values from a list attribute, matching a given condition.  
It can also synchronize other multivalued lists with the removed rows.

- **Attribute** lets you select the multivalued attribute to filter. only multivalued attributes can be selected.
- **Keep matching values** option determines that the values in the list matching the condition will be kept and the values not matching will be removed from the list
- **Remove matching values** option on the opposite, that the values in the list _not_ matching the condition will be kept and the values matching will be removed from the list   

There are 3 possible matching conditions:   

> **1.**  **Another attribute** : compares the elements in the list with the value(s) of another attribute
>> - If the attribute to match is single-valued, items that are equal to the matching attribute single value will be selected
>> - if the attribute to match is multi-valued, items that are equal to_any_ value in the maching attribute values will be selected.

- **Attribute** : select another attribute to match. This could be either a single-valued or multi-valued attribute   

> **2.**  **Computed expression** : compares the elements in the list with the value of a macro expression.
> > - Items in the list that are equal to the value of the computed expression will be selected

- **Value** : type a macro expression , which value will be compared to each item in the list. Read more on Macros : [Macros et scripts](igrc-platform/collector/macros-and-scripts/macros-and-scripts.md).

> **3.**  **Pattern** : matches the elements in the list against a regular expression pattern.
> > - Items in the list that that match the pattern will be selected. Syntax of the regular expression pattern follows javascript RegExp syntax.   

- **Regular Expression** : type a valid regular expression pattern
- **Test Value** : helper field, to test your regular expression. If the test value does not match the regular expression, a message "Test value does not match the regular expression" is displayed

- **Attribute1,Attribute2,Attribute3**  lets you select up to 3 other multivalued attributes, of the same size, that will be kept in sync with the filtered attribute.  
That is, for each row index that was removed from the list ( according to filtering conditions), the same row index will be removed from the synchronized lists.

![Filter multivalued attribute](igrc-platform/collector/components/filters/update-filter/images/9_filter_MV.png "Filter multivalued attribute")   

### 13 Replace values of a multivalued attribute

This action allows you to replace all values from a list attribute with another static or computed value.

- **Attribute** lets you select the multivalued attribute to be processed. only multivalued attributes can be selected.
- **Value** defines the replacement value for each item using a -Macro- expression. Read more on Macros : [Macros et scripts](igrc-platform/collector/macros-and-scripts/macros-and-scripts.md).

| **Note:** <br><br> The replacement value can use the original value of each item in the list.  
In this case, the original value will be available as a single-valued attribute with the same name.<br> For example, to capitalize all values in a multivalued attribute called _list1_, you would use the following expression:  {dataset.list1.get().toUppercase()}|

![Filter multivalued attribute](igrc-platform/collector/components/filters/update-filter/images/10_replace_MV.png "Replace multivalued attribute")   

### Javascript modification

This fields allows you to use a javascript function to perform the modifications.

![Function](igrc-platform/collector/components/filters/update-filter/images/function.png "Function")   

**Modification function** : Name of the function that performs the modifications, without parentheses.   
This function must have an empty signature.

Here is an example of function:
```
function doUpdate() {
 // add new attribute
    dataset.add("computedAttr" );

    var value = null;
    switch(dataset.type.get()) {
     case "A": value = "John"; break;
     case "B": value = "Michael"; break;
     case "C": value = "Eric" ; break;
        case "D" : value = "La reponse D"; break;
    }
    dataset.get("computedAttr").set(value);
}
```

If both configuration actions and a javascript modification function are defined, the javascript function will be executed _after_ the configuration actions.

## Attributes Tab

The **Attributes** tab allows to declare dataset attributes that may have been created inside the javascript modify function.   
When using a javascript function to perform the modifications, you may have to create new attributes using **dataset.add()** API.   
In this case, you need to decleare them , so that they are known by the collector and can be used in further components.

![Attributes tab](igrc-platform/collector/components/filters/update-filter/images/tab_attrs.png "Attributes tab")   

# Best practices

- Always try to perform your modifications using an existing predefined update, before using javascript. This will ensure the modifications are done in the most efficient way.
- Data qualify modifications that apply directly to source attributes should be preferably be done in the discovery.
