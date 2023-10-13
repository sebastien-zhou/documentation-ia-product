---
layout: page
title: "SQL Filtering"
parent: "Data Collection"
grand_parent: "iGRC Platform"
has_children: true
nav_order: 4
permalink: /docs/igrc-platform/collector/sql-filtering/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

The data sources in a collector line offer filtering of datasets with an SQL query. SQL filtering provides a simple way to select datasets on criteria using standard syntax. This syntax can also handle multivalued attributes, called 'lists of values,' later in this chapter.

The operating principle of the SQL query is to consider the dataset that has just been created (for example, from a file) as a table containing a single row of data. The query is executed on each dataset. The query returns either the same dataset or no dataset which means that the values present do not meet the criteria expressed in the query.   

```
SELECT * FROM dataset WHERE dataset.unique_ID <> 'VIP'
```

In the example above, the query is executed on each dataset created by the source. If the registration number contains the value 'VIP', the dataset is rejected because the criteria in the WHERE clause specifies that the registration number must not contain 'VIP'.

Note that it is possible to address configuration variables of the project or of the collector line by prefixing their name with config as shown in the following example for the reject variable:   

```
SELECT * FROM dataset WHERE dataset.unique_ID <> config.reject
```

# Query Syntax

Only SELECT queries are authorized for SQL filtering. When the query is executed, the current dataset is considered as an SQL table whose columns are the dataset attributes. This table contains only one line consisting of attribute values. The main difference with a real SQL table is that each column may contain a list of values (corresponding to a multivalued attribute of the dataset).

## Main source

In the FROM clause of the SQL query, the only allowed table name is 'dataset'. The `*` character in the projection part returns all of the attributes of the dataset. However, it is possible to return only a part of the attributes of the dataset as shown in the following example:   

```
SELECT unique_ID, first_name, last_name FROM dataset
```

The source, when reading the file, creates a dataset with a certain number of attributes and then the SQL query is executed and only the unique ID, first and last name attributes are retained in the dataset transmitted to the next component.   

It is also possible to create a brand new attribute in the projection area as shown in the following example with the new attribute full\_name:   

```
SELECT unique_ID, first_name, last_name, concat(first_name, ' ', last_name) AS full_name FROM dataset
```

This method for adding a calculated attribute to the dataset, however, is not recommended because it bypasses the attribute declaration in the pattern. The direct consequence is that the collector editor will not suggest this name in the attribute selectors.

## Secondary source

In a source activated through a join component, two sets of data are handled:   

- dataset: dataset created by the secondary source
- param: dataset passed as a parameter by the join component

In a secondary source, the tables listed in the FROM clause may be dataset, param, or both. As before, it is also possible to restrict the attributes returned but they may come from dataset or from param as shown in the following query:   

```
SELECT unique_ID, first_name, last_name, param.date_arrival, param.date_departure FROM dataset
```

The attribute names without a table name (`unique_ID`, `first_name`, `last_name`) come from the table mentioned in the FROM clause (dataset) whereas the two attributes `date_arrival` and `date_departure` come explicitly from the param dataset. It is possible to retrieve the entire dataset and some attributes of param as shown in the following query:   

```
SELECT *, param.date_arrival, param.date_departure FROM dataset
```

Finally, if you wish to retrieve all of the attributes (dataset and param), both of the following syntaxes work:   

```
SELECT * FROM dataset, param
SELECT *, param.* FROM dataset
```