---
layout: page
title: "Join with a secondary source"
parent: "Data Flow"
grand_parent: "Operation of the collector engine"
nav_order: 3
permalink: /docs/igrc-platform/collector/collector-engine-operations/data-flow/join-secondary-source/
---
---

The presence of a join in a collector line means that there are two data flows, one from the main source and the other from the secondary source. The secondary source is triggered by the join. The join is the synchronization point of two data flows that never mix.

The principle of the join is to reread the entire file from the secondary source for each primary record. This type of component is used to enrich a main record with information found in another file. Once a record goes through the join, the join component asks the secondary source to list all the secondary records. It is possible to match a main record with a specific secondary record on a join criterion such as a unique ID or an ID found in both data flows (in both files).   
To do this, the join passes the main dataset to the secondary source so that it can serve as a filter in the selection of records of the second file. In the secondary source component, a 'param' variable contains the main current dataset while the dataset variable denotes, as usual, the secondary dataset that has just been formed with the columns in the file.   
Records in the secondary source are selected by placing a filter that uses the SQL 'param' variable. In the following example, the main dataset contains the unique ID. The number is used to fetch the _email_ found in a second file that contains only two columns: _userid_ (the number) and _email_. At the secondary source level, the following SQL filter is set to find the record which matches the desired number (number present in the main dataset and designated by the 'param' variable):   

> > SELECT \* FROM dataset WHERE param.unique\_ID = dataset.userid   

In the example above, the join component asks the secondary source to list all the records. But the SQL filter only retains the records whose userid column in the secondary file is equal to the unique ID in the main file. Thus, only a record corresponding to the requested registration number and containing the email and userid is returned to the join. We note that the join is the component that calls a secondary source but it is the secondary source itself that performs the join operation by selecting the correct record.   
This operating principle offers the advantage of being generic. It applies regardless of the nature of the primary and secondary sources (file, script or other). However, in the case of a source file, the secondary file is reread for each record in the main dataset which degrades the overall performance of the collector line. It is possible to implement a cache for the join component in order to accelerate processing.   
Activating the cache means that the join component retrieves and keeps all the records from the secondary source in memory. The direct consequence is that the secondary source must, this time, provide all records without filtering because it is now the join component that performs the join operation between the two datasets. To do this, a setting in the join component allows the calculation of a key from each secondary record to compare it to a key derived from the main record. The algorithm used is as follows:   

- During the first pass in the join component
- Request the secondary source list out all the records
- For each secondary record, the join component
- Calculates a key from each secondary record
- Saves the key, records the pair in an association table (hashmap)
- During each main dataset pass, the join component
- Calculates a key from a main record
- Searches for the secondary record in the association table with the primary key   

> > SELECT \* FROM dataset WHERE dataset.unique\_ID LIKE 'A%'   

Note that all references to the 'param' variable have disappeared because the secondary source is no longer joined with the unique ID of the primary dataset.   

Note that the cache is a memory cache, so it is not recommended to implement it if the number of records is too large. The memory size used is directly related to the size of the secondary source file. One way to reduce the memory size is to only cache the information useful for processing. If we take the example above with the columns _userid_ and _email_, it is possible that the file read by the source contains other columns that should be ignored. In addition, if the unique IDs to be taken into account must begin with the letter 'A', there is no need to save all of the records the cache, particularly including unique IDs not starting with 'A'. To minimize the memory used in this case, you must first ensure you select only the _userid_ and _email_ columns in the source component and add an SQL filter which returns only records with a unique ID starting with 'A':
