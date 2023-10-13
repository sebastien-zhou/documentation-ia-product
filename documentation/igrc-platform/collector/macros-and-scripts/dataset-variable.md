---
layout: page
title: "Dataset variable"
parent: "Macros et scripts"
grand_parent: "Collector"
nav_order: 3
permalink: /docs/igrc-platform/collector/macros-and-scripts/dataset-variable/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

A dataset is a collector of attributes, where each attribute may contain multiple values. The dataset is the element which is passed between the components of a collector line. It may be altered or completed by each component.   

When a collector line runs, the `dataset` variable is implicitly declared and contains the current dataset. It is thus possible to reach the content of the dataset within a component (for example, in the modifying component in the form of a macro) or in JavaScript.   

A collector line has a data pattern. The pattern lists all the attribute names declared in each component and their characteristics (type of attribute and multivalued indicator). The pattern helps to offer completion of the attributes in the collector line editor. It is also used when the collector line runs to performing implicit operations of data conversion. For example, when an attribute is declared by a source component as `date` type, it can be upgraded or modified by another component by passing a string. The collector engine converts the value according to the declaration in the pattern.   

The pattern is shown in the collector line editor in the Properties view when no component is selected.   

You cannot bypass the pattern while the line collector is running. An attribute can only receive values of the type declared in the pattern (after implicit conversion if needed). On the other hand, it is quite possible at runtime to dynamically add new attributes whose characteristics you specify (type of attribute and multivalued indicator) in the constructor of the `Attribute` class.

**Warning** : Having declared an attribute in the pattern (for example, in a source type component) does not add the attribute in the dataset at runtime. The attribute is only present if it is added by component or a script. The standard behavior of the source type components (for example, CSV) is to create the attribute in the dataset only if a value is present in the file. In the case of a CSV file, if the `uniqueID` column is empty for some records, the dataset will not contain the `uniqueID` attribute for records that have no value in this column. When trying to read an attribute not present in the dataset, `null` is returned. Therefore, we have to test this value before manipulating the data, as shown in the following code:
```
var attr = dataset.get("unique_ID");
if (attr != null) {
  print(attr);
}
```

This test should also be done in macros, for example, in the modifying component. The following code is a macro component set in the modifying component in order to capitalize the `unique_ID`. Since the unique ID may be absent, you must use a ternary expression to process the case of a `null` attribute:   

`{dataset.unique_ID != null ? dataset.unique_ID.get().toUpperCase(): ''}`   

This macro tests whether the attribute exists in the dataset. If it does, it returns the contents of the unique ID, capitalized. Otherwise, it returns an empty string.   

Let's take the example of an attribute called `myAttribute`, declared in a modifying component and valuated by a script. The following code allows us to add the attribute to the dataset with a value:
```
var attr = new Attribute("myAttribute");
attr.set("Paul");
dataset.add(attr);
```

In the example above, the first line creates an attribute without specifying the type of data or the multivalued indicator, because with the name of the attribute, the collector engine finds this information in the pattern.   

In the case of an attribute missing from the pattern, you must specify all the information as shown in the following example. The pattern is then completed dynamically with a new attribute.   
```
var attr = new Attribute("myAttribute", "String", false);
attr.set("Paul");
dataset.add(attr);
```

In the example above, the first line creates an attribute that does not exist in the pattern. The attribute is declared as being a `String` type and single-valued (multivalued parameter set to `false`).   

A dataset also contains a list of events. These events contribute to the identification of rejects or records with an anomaly. These events can be used in transitions between components to create conditional forking. Writing a JavaScript function is necessary to test for the presence of an event and to allow the transition to the next component or not. The following code shows a function that prevents it from moving to the next component if the `empty_unique_ID` event is detected:   
```
function testUniqueID() {
  return ! dataset.hasEvent("empty unique ID");
}
```

The `testUniqueID` function is configured in the transaction. When the dataset contains an `empty_unique_ID` event, the JavaScript function returns `false` which prohibits from moving on to the next component.   

It is important to note that the events present in the dataset have a very limited lifespan because they are deleted upon entering each component to avoid their accumulation while running through the dataset of the whole collector line.
