---
layout: page
title: "Source type component"
parent: "Principles of operation"
grand_parent: "Operation of the collector engine"
nav_order: 1
permalink: /docs/igrc-platform/collector/collector-engine-operations/principles-of-operation/source-type-component/
---
---

A source type component's objective is to list the records from a repository. The components available as standard in the product process only file type sources. The extraction of data from client repositories in the form of files is not supported by the product and must be addressed in integration mode.   
The general principle of operation of a file type source component is to read a record and transmit it to the next component. The notion of record depends on the type of file. This is a set of attributes constituting a single object. For example, for a CSV file, it is a line in the file. For an LDIF file, it is an entry consisting of several lines, each giving the value of an attribute. This record goes through all components according to the transitions established in the collector line. When the record has been processed by the last component, the source reads the next record, and so on until the end of the file.   
Source type components read the records and convert them into a Dataset type structure in order for data to be transmitted in a common format and standardized throughout the collector line. This data structure is called 'dataset' (DataSet). A dataset is a list of attributes. Each attribute is named and may contain multiple values.   
File type sources offer the following specific options:

- File characteristics: File name and file encoding are the options common to all types of files. Specific characteristics like the separator and columns for a CSV file or the root to process (lower DN) for an LDIF file are present according to the file format.
- Verification of file size: Some verifications may be carried out on file size, date of the file, and the file pattern. These options are useful to avoid processing a file that would be too short (probably truncated), too old (maybe obsolete), or incomplete in terms of pattern (missing column in a CSV file, for example).

All of the sources offer the following options:

- Selection of a subset of records: This option provides the possibility of selecting certain records by their numbers. The settings allow you to ignore the X first records and process only the Y following records. This filtering doesn't take into account the content of the records. For a filter related to content, use the SQL query.
- Filtering records by SQL query: The objective of filtering by SQL query is to filter the records according to their content. This type of filtering works no matter what the source type is, because the SQL filter is applied once the source has retrieved the data and transformed them into a DataSet. Only SELECT queries are authorized and the main table name must be 'dataset'. The 'where' clause allows you to test the values of the dataset attributes. All the standard SQL functions are present, such as upper, lower, trim, substring, left, concat...
- Sorting records: The purpose of sorting records is to present the records in a collector line in a certain order. This option is especially useful when a source is used in association with a grouping component.   

Source type components mainly contribute to the establishment of the database pattern. The pattern is the definition of the set of attributes handled in the different components of the collector line. The definition includes the name and attribute type (String, Number, Date, or Boolean) and multivalued indicator. Each source defines the attributes corresponding to the columns or tags present in the input file, which automatically fill in the pattern of the collector line. On the other hand, the source script adds no attribute declaration to the pattern. Attributes generated in JavaScript must be declared manually in the component's properties.   

| **Important:** <br><br> the declaration of an attribute in the pattern does not guarantee the presence of the attribute in the dataset during the execution of the collector line. Only columns or tags having a value will create an attribute in the dataset.
