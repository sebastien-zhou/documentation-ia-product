---
layout: page
title: "Importing and exporting manual reconciliations"
parent: "Reconciliation policies"
grand_parent: "Reconciliation"
nav_order: 6
permalink: /docs/igrc-platform/reconciliation/reconciliation-policies/import-export-manual-reconciliations/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

To allow synchronization of the manually updated reconciliations between various environments or between different timeslots the possibility of exporting and importing reconciliations has been developed.

The exported reconciliations can then be accessed or corrected before being reimported into another analysis period and/or environnement.

This applies both to accounts that have been reconciled with people in the database and accounts marked as ownerless or having an owner who has left; we can combine all the actions linked to the reconciliation that were performed individually outside of the reconciliation policy.

# Exporting manual reconciliations

There are two methods to export all manual reconciliations performed either in the studio or in the portal

1. Navigate to the **Timeslots**  tab next to the ledger, select an analysis period and choose the **export the manual reconciliations of this timeslot**  option.    

![Export the manual reconciliations via the timeslot window](./images/1-exporting_manual_reconciliation-csv.png "Export the manual reconciliations via the timeslot window")   

2. Directly in the file menu of the studio.

![Export the manual reconciliations from the file menu](./images/reconciliation_export_file_menu_selection.PNG "Export the manual reconciliations from the file menu")   


In both cases a window will open that asks you to provide the file name. It is possible to change the project or the timeslot on which you wish to export the manual reconciliations.   

![Export the manual reconciliations of this timeslot](./images/2-exporting_manual_reconciliation-csv.png "Export the manual reconciliations of this timeslot")      

Upon clicking finish the file is created. Each line has account attributes, the attributes of the identity with which it was reconciled as well as the reconciliation information (ownerless account code, reconciliation comment, etc.)   

![Export the manual reconciliations of this timeslot](./images/3-exporting_manual_reconciliation-csv.png "Export the manual reconciliations of this timeslot")  

# Input file generation

In addition to exporting the reconciliation file it is possible to manually create it. To do so the file **must** respect the following format:
1. Format : CSV
2. Mandatory columns
    - Account repository code (cannot be empty and must be the first column of your file)
    - Account identifier (cannot be empty)
    - hrCode (cannot be empty)
    - mail (can be empty)
    - surname (if present in the file, cannot be empty)
    - givenname (can be empty)
    - Reconciliation leave date (can be empty)
    - Reconciliation comment (can be empty)

---

<span style="color:grey">**NOTE:**</span> `mail`, `surname` and `givenname` columns are used if the identity cannot be found with the `hrCode`. So, they are optional but must be present.

---

Here is an example of input file expected :
![CSV Manual Reconciliation Import file sample](./images/reconciliation_import_input_file_example.PNG "CSV Manual Reconciliation Import file sample")

# Importing manual reconciliations

In the same manner as the export Importing manual reconciliations can be done using different methods in the studio, importing manual reconciliations can be done 
1. In the timeslot tab 
2. Using the dedicated import menu

## In the Timeslots tab

Importing manual reconciliations is found in the **Timeslots**  tab, under the **Import the manual reconciliations of another timeslot**  option.    

--- 

<span style="color:grey">**NOTE:**</span> When using this method, once a timeslots has been validated, it is no longer possible to import manual reconciliations.

![Import the manual reconciliations of another timeslot](./images/1-importing_manual_reconciliation.png "Import the manual reconciliations of another timeslot")     

---

Once the link clicked the import reconciliation wizard opens. It is then necessary to:
1. Select the project to import the reconciliations to
2. Select the timeslot to import reconciliations to
3. Select the CSV file containing the reconciliation to be imported
4. If desired check the option to overwrite the existing reconciliations

![Import the manual reconciliations of another timeslot](./images/2-importing_manual_reconciliation.png "Import the manual reconciliations of another timeslot")     

By clicking finish you initialize the import process, which ends by displaying the number of accounts it was possible to reconcile compared to the total number in the file. 

![Import the manual reconciliations of another timeslot](./images/3-importing_manual_reconciliation.png "Import the manual reconciliations of another timeslot")  

Incorrect reconciliations are automatically written to another CSV file with the same name as the original file but suffixed with `\_rejected`.      

## Using the import menu

Using the import menu provides similar results to the process detailed above. The process is as follows:

1. In an opened iGRC Studio, go to the `File` menu and click on `Import...`
![Import...](./images/reconciliation_import_file_menu_selection.PNG "Import...")
2. Expand the iGRC Analytics menu, select the `Import manual reconciliations` choice and then, click `Next`
![Import manual reconciliations](./images/reconciliation_import_wizard.PNG "Import manual reconciliations")
3. In the next step, select your project and then, click `Next`
![Project selection](./images/reconciliation_import_project_selection.PNG "Project selection")
4. In the next step, select the desired timeslot when you want to import your manual reconciliation file and the input file and then, click `Finish`
![Project selection](./images/reconciliation_import_timeslot_and_file_selection.PNG "Project selection")
5. If the operation succeeds, the following window should be displayed:
![Import successful](./images/reconciliation_import_file_succeed_operation.PNG "Import successful")

---

<span style="color:grey">**NOTE:**</span> If you wish to overwrite existing reconciliations in the selected timeslot, please check the option `Overwrite existing reconciliations`

---

Incorrect reconciliations are automatically written to another CSV file with the same name as the original file but suffixed with `\_rejected`.  