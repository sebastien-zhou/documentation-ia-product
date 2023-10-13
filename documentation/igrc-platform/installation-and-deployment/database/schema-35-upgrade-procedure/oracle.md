---
layout: page
title: "Oracle"
parent: "Schema 35 upgrade procedure"
nav_order: 3
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Pre-requisits

Before atempting any upgrade of the database please go through all steps detailed in the page below.

[**Release notes**]({{site.baseurl}}{% link docs/igrc-platform/installation-and-deployment/database/schema-35-upgrade-procedure.md %}){: .ref}

# Procedure

## Determining script

Execute the following SQL script to determine the exact version of the script to run in order to upgrade the database schema.

```sql
SELECT cvalue AS "Curent Schema version",
	CASE 
		WHEN cvalue = 35 THEN 'Schema version up to date' 
		WHEN cvalue = 32 THEN 'oracle_BrailleR1_to_Curie.sql'
		WHEN cvalue = 31 THEN 'oracle_AderR1_to_Curie.sql'
		WHEN cvalue = 30 THEN 'oracle_2017R3_to_Curie.sql'
		WHEN cvalue = 29 THEN 'oracle_2017R2_to_Curie.sql'
		ELSE 'Schema version not recognised. Please contact the support service' 
    END AS "Script to execute"
FROM     
    tproperties
WHERE
    cpropertiesuid='VERSION'
```

## Download the Scipt

Depending on the version of the script displayed after the previous SQL request please download the correct script from the following list:  

|                                   Script                                    |
|:---------------------------------------------------------------------------:|
|    [oracle_2017R2_to_Curie.sql](./sqlscripts/oracle_2017R2_to_Curie.sql)    |
|    [oracle_2017R3_to_Curie.sql](./sqlscripts/oracle_2017R3_to_Curie.sql)    |
|    [oracle_AderR1_to_Curie.sql](./sqlscripts/oracle_AderR1_to_Curie.sql)    |
| [oracle_BrailleR1_to_Curie.sql](./sqlscripts/oracle_BrailleR1_to_Curie.sql) |

## Execuite the script

### Command line

To execute the upgrade script in command line execute to following command:

```
sqlplus <username>/<password>@<connect_identifier> @<Absolute Path to file>/oracle_XXXX_to_Curie.sql
```

where:
- `<username>` is the schema on which to execute the upgrade
- `<password>` is the users password
- `<connect_identifier>` is the Oracle Net database alias (@connect_identifier) of the database you want to connect to

For more information on SQLplus usage please refer to Oracle's documentation:
[https://docs.oracle.com/cd/A97630_01/server.920/a90842/qstart.htm](https://docs.oracle.com/cd/A97630_01/server.920/a90842/qstart.htm)

### SQL developer

Open the script in SQL developer directly and execute with the desired user. The owner of the schema.
