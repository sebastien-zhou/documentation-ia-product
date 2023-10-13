---
layout: page
title: "DataSet and data pattern"
parent: "Data Flow"
grand_parent: "Operation of the collector engine"
nav_order: 1
permalink: /docs/igrc-platform/collector/collector-engine-operations/data-flow/dataset-data-pattern/
---
---

In a collector line, some components declare attributes. This is particularly the case of source components (CSV, LDIF, ...) in which a correspondence is established between the columns of the file and the attributes of the dataset which runs in memory. The modifying component also declares attributes. All these declarations are involved in the formation of the collector's data pattern. The data pattern is the inventory of all the attributes handled during the execution of the collector line. An attribute in the pattern is characterized by a name, a type (String, Number, Date, or Boolean) and a multivalued indicator. Attributes thus declared cannot change type or multivalued indicator when running.   
When running, a JavaScript function may dynamically declare a new attribute by specifying its name, type and multivalued indicator. The pattern is then completed with this new definition.   
A dataset is the element that is transmitted from one component to another by following transitions of the collector line. The dataset contains a set of attributes, where each attribute may contain one or more values as declared in the pattern (multivalued indicator). It is important to note that all the attributes declared in the collector line may not be present at all times in the dataset at runtime. Indeed, the source components only add attributes corresponding to a non-empty column in the file to the dataset. The following diagram shows the structure of a data set:

![Diagram dataset](./images/worddavc5cde702087dd35c6ac01c810f783e32.png "Diagram dataset")
**_Structure of a dataset_**

It is important to understand this structure if you want to manipulate the dataset in a JavaScript function or a macro. There are APIs that allow you to list out each nesting level and alter the dataset or the content of a particular attribute.
