---
title: "Index management"
description: "Index management"
---

# Index management

## Warning

Please note that **ALL** information provided in this page has to be done **ONLY** with the approval of Brainwave experts.  

Deleting indexes in the database can drastically impact the performance of the execution plan and the portal. If you perform the following actions without the approval of Brainwave the performance of the solution can no longer be assured.   

If you have questions please don't hesitate to create a ticket on "Brainwave Online Support" :

[https://support.radiantlogic.com](https://support.radiantlogic.com)

## Procedure

The following procedure should **ONLY** be applied to existing projects. The project scope and perimeter **MUST** have been stabilized in time. Applying the following procedures to a project where the scope is changing can result in a degradation of the portal and/or of the execution plan.  

### DB Check

In the latest version of the `DB_check` you will find the list of unused indexes.  

Please use one of the following links for more information on the usage of the `DB_Check`

- [Microsoft SQLserver](how-to/database/sqlserver/performance-investigation-sql-server.md)  
- [Postgresql](how-to/database/postgresql/psql-performance-issue-investigation.md)  
- [Oracle](how-to/database/oracle/performance-investigation-oracle.md)  

### Managing indexes

The support service will have provided you with:

1. A list of indexes to delete from the database.
2. A file named `indexes_to_ignore.txt` containing the list of deleted indexes to be ignored during the Execution plan.  

You should then:

1. perform the drop of the indexes using the provided scripts  
2. Add the file `indexes_to_ignore.txt` to the `\configurations` folder of your project  

> [!warning] It is imperative that the list of deleted indexes correspond exactly to the list ignored indexes in the database.  

> The list fo indexes to ignore should **NOT** include the schema of the database.  

> It is not possible to delete the unique and primary keys, these indexes should not be included in the list of indexes to ignore.  

## Changes in the project scope

Assuming that a subset of indexes have been deleted and that the scope of the project has changed it is recommended to test the performance of the updated project to ensure the optimal performance of the execution plan. This is especially the case when adding new concepts to the project (for example the addition of theoretical rights, unstructured data, ...).  
