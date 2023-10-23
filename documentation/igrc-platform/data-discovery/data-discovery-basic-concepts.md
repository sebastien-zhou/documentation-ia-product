---
title: Data Discovery Basic Concepts
Description: Documentation related to basic concepts of Data Discovery
---

# Basic Concepts

The "Discovery" component allows you to discover source data and apply filtering, verification, and transformation rules to them.  
Among the available operations in Discovery, you will find:  

- Verification of the format of a string of characters or a date;
- Filtering records based on an arbitrary criterion, using pseudo-SQL or JavaScript syntax;
- Filtering records according to rules of de-duplication or verification of the presence of attributes;
- Computing new attributes from source data (format conversions, concatenation, normalizing values...)  

Thanks to this component, it is very easy to see the source data, no matter what entry format is used (CSV, LDIF, XML...) and to immediately evaluate the quality of the data.  
The Discovery component moves on to a systematic analysis of the file to produce the histogram of each attribute's values and allows you to build a list of rejected records exportable in Excel format as the rules are applied.  
All the operations performed in the Discovery are recorded as macros, and can therefore be reapplied by batch on any new file, which greatly reduces the repetitive verification tasks.  
Data filtering and transformation operations are performed in two stages:  

1. First perform the rejection operations
2. If the record was not rejected, the transformation operations are performed

The rejection operations are the first actions in the contextual menu, as seen below :  

![Menu](./images/1.PNG "Menu")  
**_The rejection operations in the contextual menu_**  

These operations appear in the left side of the configuration summary  

![Configuration summary](./images/2.PNG "Configuration summary")  
**_Example of results of a rejection operation_**

## Types of Files

### CSV

CSV discovery allows the analysis of files whose data are separated by a character (",", ";"...)  

The CSV format is specified in the RFC 4180, but CSV discovery is also able to analyze files that don't correspond to the specification as long as they contain separators.  

![CSV](./images/1-csv.png "CSV")  
**_Selecting CSV template for a new CSV discovery_**  

Once the CSV format has been selected and the file chosen, file analysis configuration is automatically suggested. These settings may be changed if needed:  

- File encoding format
- Column separators
- Multivalued value separator
- Text value separator
- Indicate whether the file contains a header with column names or not
- Ignore the X first lines before starting the file analysis.

![CSV 2](./images/2-csv.png "CSV 2")  
**_Import of the CSV file being processed_**

### Excel

EXCEL discovery allows the analysis of files in Microsoft XLS or XLSX format. EXCEL discovery allows the analysis of both spreadsheets and pivot tables.  

![Excel file](./images/2016-06-29_11_43_20-iGRC_Reports_-_iGRC_Analytics.png "Excel file")  
**_Selecting an Excel file template_**  

Once the EXCEL wizard has been selected and the file chosen, a wizard displays the various options, and it is possible to:  

- select the sheet to process (by its name or an order number)
- indicate which row the table starts on
- indicate which column the table starts on
- indicate up to which row the table should be processed
- indicate which column the table ends on
- indicate whether the table contains a header row

![Excel file 2](./images/2016-06-29_11_52_08-iGRC_Reports_-_iGRC_Analytics.png "Excel file 2")  
**_Import of the Excel file being processed_**  

It is also possible to process pivot tables with the option "All data must be gathered in a multivalued attribute starting with column X." If this option is checked, all the values starting in column X are gathered in a multivalued attribute. A second multivalued attribute is created with the corresponding header rows.  

![Excel file 3](./images/2016-06-29_11_54_01-iGRC_Reports_-_iGRC_Analytics.png "Excel file 3")  
**_Verifying the attributes of the imported Excel file_**  

This pre-processing, associated with actions on the multivalued attributes (5.2) and the collector numbering component, allows the analysis and loading of data from pivot tables.

### LDIF

LDIF discovery allows the analysis of files in LDIF format (RFC 2849). LDIF files are exported LDAP or X500 directory files.  

![LDIF file](./images/1-ldif.png "LDIF file")  
**_Selecting an LDIF file template_**  

Once the LDIF wizard has been selected and the file chosen, a wizard displays the various options.

![LDIF file 2](./images/2-ldif.png "LDIF file 2")  
**_Import of the LDIF file being processed_**  

In particular, it is possible to:  

- select the file encoding
- select the sub-tree to process and the depth of the search; a dedicated wizard displays the arborescence for this

![LDIF file 3](./images/3-ldif.png "LDIF file 3")  
**_Type of object to be selected with an imported LDIF file_**  

- select the type of object to analyze and the associated filtering restrictions (strict filtering or not on object classes). A dedicated wizard allows you to select a typical entry

![LDIF file 4](./images/4-ldif.png "LDIF file 4")  
**_Detail of the selected object for filtering an imported LDIF file_**

### Formatted

Formatted files are often text report type files from centralized sites (Mainframe). They don't contain separators; fields are identified by their position (characters 1 to 8 = field 1, characters 9 to 15 = field 2...)

![Formatted file](./images/2016-06-29_11_43_29-iGRC_Reports_-_iGRC_Analytics.png "Formatted file")  
**_Selecting FORMATTED file template_**  

Once the FORMATTED wizard has been selected and the file chosen, a wizard displays the various options.  

![Formatted file 2](./images/2016-06-29_12_06_41-iGRC_Properties_-_toto_discovery_test_excelfile.png "Formatted file 2")  
**_Import of the Formatted file being processed_**  

It is possible to specify:  

- the file encoding
- the separation character used for multivalued attributes
- whether the file contains a header line with column names
- whether it needs to skip X lines before starting to process the file
- whether only certain rows of the file should be taken into account. Filtering is then performed with a regular expression. This setting may be useful in the case of a "dump" file from a central site that contains many elements of a varying nature.  

If you wish to adjust the column selection, just place the cursor in the right spot in the preview area, and then click on the "Set/Remove a Separation" button.

![Formatted file 3](./images/2016-06-29_14_45_39-iGRC_Project_-_iGRC_Analytics.png "Formatted file 3")  
**_Verification of the attributes of the imported FORMATTED file_**

### XML

XML discovery allows you to extract data from an XML type file.  

![XML file](./images/1-xml.png "XML file")  
**_Selecting an XML file template_**  

Once the XML wizard has been selected and a file chosen, a wizard appears. It allows you to select the object to extract from the XML file. Object selection is performed with the help of the "Selected elements" setting. This setting must contain an XPATH expression that references the element in question.  

It is also possible to click on the element in the preview pane to fill in this field.  

![XML file 2](./images/2-xml.png "XML file 2")  
**_Import of the XML file being processed_**  

The Discovery's attributes correspond to the various attributes of the selected objects.  
Here is an example of attributes extracted on the basis of an XML object that contains XML sub-objects:  

If the selected object contains sub-objects, their attributes are also extracted as attributes. Careful, though: this principle does not handle multiple sub-objects, only 1/1 relationship types. In this case, only one of the sub-objects will be taken into account.

![XML file 3](./images/3-xml.png "XML file 3")  
**_Verification of the attributes of the imported XML file_**

### Line

LINE type discovery allows the analysis of log files.

![Line file](./images/1-line.png "Line file")  
**_Selecting a LINE file template_**  

Once the LINE wizard has been selected and the file chosen, a wizard appears. This wizard allows you to:  

- Select the file encoding type
- Indicate whether you wish to ignore empty lines
- Indicate whether it should skip X lines before beginning the file analysis

![Line file 2](./images/2-line.png "Line file 2")  
**_Import of the LINE file being processed_**  

A LINE type discovery loads the lines in a single attribute named "line." The true analysis of this line is then performed with actions like "Extract the characters into a new attribute," which will go through the line and extract the information in typed attributes.  

![Line file 3](./images/3-line.png "Line file 3")  
**_Overview of the LINE file attribute_**  

We invite you to consult the "screencasts" of examples on [http://expert-exchange.brainwavegrc.com](http://expert-exchange.brainwavegrc.com/). They illustrate in particular how the log files are analyzed with this discovery.

## First Level of Record Filtering

### Skip the X First Records

This setting allows you to skip X lines (or X records in the case of formatted data such as LDIF files) before starting the processing.  

![Record](./images/1-export.png "Record")  
**_Ignoring the first X records_**  

### Select a Maximum of X Records

This setting allows you to limit the analysis to the first X records.  
We recommend that you use this setting when you are setting up your Discovery on large files (>100MB) in order to limit the analysis to the first few records. This will allow you to have a more reactive configuration interface when you are setting up the Discovery.  

![Record 2](./images/2-export.png "Record 2")  
**_Limit the analysis to the X first records_**  

### Filter with a Query in SQL Format

It is possible to select only a subset of records. Do this by using a query in SQL format. You will find the corresponding documentation in the "Collector Configuration Guide."  
Note that this first-level filtering does not start any event or rejection; it is only used for preselecting data. If you wish to perform data rejection, to process data quality issues, for example, we suggest that you use the "rejection" actions, as these will allow you to associate events with rejections in order to generate log files.  

![Record 3](./images/3-export.png "Record 3")  
**_Filter using a query format_**

## Data Types Settings

It is possible to change the type of data of an attribute to convert it into another data format. To do so, click on the type column that corresponds to the attribute.  

![Data settings](./images/1-data.png "Data settings")  
**_Setting the type of an attribute_**  

The attribute will then be converted into a numerical value, date, or Boolean value as the file is read.  
Format configuration happens in the first tab:  

![Data settings 2](./images/2-data.png "Data settings 2")  

Regarding the dates, the format to use is the Java Format. To do so, you need to rely on the following table:  

![Table](./images/MicrosoftTeams-image.png "Table")  

For example, the format of date like:  

- "12/24/2019 4:23:30 PM" is "MM/dd/yyyy h:mm:ss a" which will be converted to "20191224162330"  
- "24/12/2019 16:23:30" is "dd/MM/yyyy HH:mm:ss" which will be converted to "20191224162330"  

**_Setting the attribute format_**  

> [!warning] The source file data must be correctly formatted to set a date/Boolean/whole value. If the attributes must be pre-processed or filtered, you must use transformation actions in order to convert these attributes into the right type in new computed attributes.  

![Converting the attribute format to date format](./images/4-data.png "Converting the attribute format to date format")  
**_Converting the attribute format to date format_**  

![Creating a Boolean attribute](./images/5-data.png "Creating a Boolean attribute")  
**_Creating a Boolean attribute_**

## Rejects

### Reject Empty Values

This action allows the rejection of empty values for an attribute.  

Rejecting empty values is done by right-clicking on the attribute then choosing "reject empty values".  

![Rejection of empty values](./images/2016-06-29_15_00_57-iGRC_Project_-_toto_discovery_test_AD_users_test.discovery_-_iGRC_Analytics.png "Rejection of empty values")  
**_Rejection of empty values_**

### Reject Values not Conforming to a Specific Date Format

This action will compare the date records in the source file and reject the ones who do not conform to the format you specified.

![Reject values](./images/2016-03-29_12_15_16-Reject_values_not_conforming_to_a_date_format.png "Reject values")

### Reject Duplicated Values

## Set a Default Value

This action allows you to set a value in an attribute if it is empty.  
The value can be a static or dynamic value (with syntax like macro {...}, illustrated in chapter 5.1).  

![Setting a default value](./images/worddav365e3a06a8ed062645697f294c9a2684.png "Setting a default value")  
**_Setting a default value for an empty attribute_**  

It is thus possible to associate a condition to the application of this action. Also, this action used consecutively on the same attribute, with the use of the conditional clause, allows (if, else if, else) type operations to be performed. We invite you to consult the "screencasts" on [http://expert-exchange.brainwavegrc.com](http://expert-exchange.brainwavegrc.com/) for a demonstration of this type of use.

## Operations

### Operations on String Attributes

This entry contains all the operations that can be performed on string type attributes, such as:  

#### Convert to Date into a New Attribute

To convert a string type attribute into a date format, just right-click on the attribute -> **Operations on string attributes**  -> **Convert to date into a new attribute.**

![Converting a string type attribute into a date](./images/2016-06-29_17_53_50-.png "Converting a string type attribute into a date")  
**_Converting a string type attribute into a date_**  

Then enter the settings of the new attribute.  

Local language gives an indication as to how the days are written in the file.
For instance, if the month are written in plain text in your source file, you might see this:  
04 Feb 2016  
"Feb" means that the local language is English, so you would have to put "en" in the local language field.  

![Configuring a new date type attribute](./images/2-operations-on-string-attributes.png "Configuring a new date type attribute")  
**_Configuring a new date type attribute_**  

Once the new attribute has been created, it will appear in the list of attributes. The date format must be filled out with a pattern. You will find the documentation about the pattern at this link:  
[http://docs.oracle.com/javase/1.4.2/docs/api/java/text/SimpleDateFormat.html](http://docs.oracle.com/javase/1.4.2/docs/api/java/text/SimpleDateFormat.html*)  

Here are some examples:

![Date format pattern](./images/3-operations-on-string-attributes.png "Date format pattern")  
**_Date format pattern_**  

#### Normalize the Value into a New Attribute

The principle is to eliminate all the special characters contained in the composition of the attribute's values (example of special characters: "ç", "_", "'" "^"...). You can perform this operation by right-clicking on the attribute name-> **operations on string attributes->Normalize value into a new attribute**.  

#### Extract DN Values into a New Attribute

You can extract the values of a DN type attribute into a multivalued attribute. The values are stacked so that the first value of the multivalued attribute corresponds to the end of the DN value.  

![Extracting a DN value into a new attribute](./images/2016-06-29_17_52_04-.png "Extracting a DN value into a new attribute")  
**_Extracting a DN value into a new attribute_**  

A practical usage case is as follows:  
The DN of users contains useful complementary information (example: the organization to which the person belongs) in this format:  
cn=abdel Kader, or=DSICORP, or=users, or=acme, or=com  
The application of this action on the DN in order to build a new "DNS" attribute will then allow the simple creation of a computed attribute "organization" which contains the sought-after value in the syntax {dataset.DNS.get(1)}.

#### Separate the Parts of a Value into a New Attribute

The operation separates the parts of an attribute's value into a new multivalued attribute.  
Example of value to separate: DSIO/OPS/CORP. In this example, we will put the parts of the value into a new multivalued attribute. To do this, just:  

- Right-click on the attribute name-> **Operations on string attributes** -> **Split parts of a value into a new attribute**.

![Example of extracting an attribute's value](./images/2016-06-29_17_41_34-iGRC_Project_-_toto_discovery_test_AD_users_test.discovery_-_iGRC_Analytics.png "Example of extracting an attribute's value")  
**_Example of extracting an attribute's value_**  

- then enter the name of the new attribute and the separating character

![Configuring the new multivalued attribute](./images/6-operation.png "Configuring the new multivalued attribute")  
**_Configuring the new multivalued attribute_**  

It is important to note that the operation works if and only if the separator between the value's elements is the same.  

#### Extract the Characters into a New Attribute

It is possible to extract a value's characters into a new attribute. This operation is generally used to extract the elements present in a log file. In order to perform the operation, right-click on the attribute name-> **Operations on string attributes->Extract characters into a new attribute**.  

![Extracting the values from an attributes](./images/2016-06-29_17_46_36-.png "Extracting the values from an attributes")  
**_Extracting the values from an attributes_**  

You have two options:  

- Extract the N first characters: this allows you to set the number of characters to put into a new attribute. You can go through the string from the beginning or the end by checking the appropriate box.
- Extract the N first characters until the first occurrence of the separator. You can go through the string from the beginning or the end by checking the appropriate box.

![Extracting the characters from an attribution](./images/8-operations-on-string-attributes.png "Extracting the characters from an attribution")  
**_Extracting the characters from an attribution_**  

> [!warning] The extracted characters will be consumed, which means that the initial attribute value is modified at the end of the operation.

### Operations on Date Attributes

Two types of operations are possible on date type attributes:

#### Compute the Time between Two Dates into a New Attribute

This operation allows you to deduct the number of days since a person left the company, for example. To perform this operation, right-click on the first date type attribute > **Compute time between two dates in a new attribute**.  

![Operations on date attributes](./images/2016-06-29_17_59_05-.png "Operations on date attributes")  

Then enter the new attribute name, the second attribute date, and chose a unit of time.  

![Operations on date attributes 2](./images/2016-06-29_18_01_31-Compute_time_between_two_dates_in_a_new_attribute.png "Operations on date attributes 2")  

#### Add/Subtract Time to a Date in a New Attribute

This is the opposite operation of "Compute time between two dates in a new attribute." To perform this operation, right-click on the date type attribute-\> **Operations on date attributes->Add/Subtract time to a date in a new attribute**.  

![Operations on date attributes 3](./images/2016-06-29_18_03_18-.png "Operations on date attributes 3")  

Then fill out the new attribute's name, the length of time, and the unit of time.  

![Operations on date attributes 4](./images/2016-06-29_18_04_54-iGRC_Project_-_toto_discovery_test_AD_users_test.discovery_-_iGRC_Analytics.png "Operations on date attributes 4")  

### Operations on Attributes

#### Rename an Attribute

You can change an attribute's name by choosing "Rename Attribute".  

![Rename Attribute](./images/2016-05-11_15_29_23-.png "Rename Attribute")  

In the dialog that opens, you just have to write the new name you want to give to the attribute.  

![Rename Attribute 2](./images/2016-05-11_15_31_49-Renaming_attribute_samaccountname.png "Rename Attribute 2")  

Before you click OK, clicking on "Preview >" gives you a list of files impacted by the renaming.  

![Rename Attribute 3](./images/2016-06-29_18_18_08-Renaming_attribute_samaccountname.png "Rename Attribute 3")  

Here we can see that two files will be impacted: the discovery file we are using, and the collector that was using the attribute that was renamed. This means that the product will change the name in the collector file automatically in addition to changing it in the discovery.  

When there are modifications on another file as in this case, the other file will be closed if it was opened in another tab.  

#### Rename Attribute Values

You can rename attribute values on the fly. To do so, select the appropriate value(s) in the lower left part of the editor, right-click, and choose "Replace selected values."

![Renaming a list of attributes](./images/2-operations.png "Renaming a list of attributes")  
**_Renaming a list of attributes_**  

An editor opens and allows you to set the replacement value(s).  

![Setting the replacement value of a list of attributes](./images/3-operations.png "Setting the replacement value of a list of attributes")  
**_Setting the replacement value(s) of a list of attributes_**  

#### Ignore this Attribute in Collector Line

You can ignore attributes that will not be in the collector file, in order to have less clutter when selecting them.  
There are two ways of doing this:  

- you can select the attribute and press "DEL"
- or you can right click the attribute and select "Ignore this attribute in collector line (DEL)  

![Ignore this attribute in collector line](./images/2016-05-11_16_03_36-.png "Ignore this attribute in collector line")  

The attribute will not be shown by default anymore. If you want to see ignored attributes, you can do so by clicking on the "eye" icon in the top right corner of the attribute list:  

![Ignore this attribute in collector line](./images/2016-05-11_16_08_55.png "Ignore this attribute in collector line")  

The ignored attributes will appear, you can tell them apart because they will be greyed out.

#### Use this Attribute in Collector Line

Of course, the opposite operation is also possible. For this you have to select the ignored attribute (it should be greyed out) that you want to use again, right click and choose "Use this attribute in collector line (INS)":  

![Ignore this attribute in collector line](./images/2016-05-11_16_39_11-.png "Ignore this attribute in collector line")  

The attribute will be back with the used attributes and you will be able to select it in the collector file.  

## Exports

### Export Rejected Values

You can do a CSV export of rejected values. To do so, right-click on any value in the "Rejected records" view.  

![Exporting rejected values](./images/worddav6821d32e35dfca91ee32319c0e45b823.png "Exporting rejected values")  
**_Exporting rejected values_**  

### Export Transformed Data

You can do a CSV export of all the data processed in the discovery. To do so, right-click on any value in the "Results"' block.  

![Exporting transformed data](./images/worddav6821d32e35dfca91ee32319c0e45b823.png "Exporting transformed data")  
**_Exporting transformed data_**

## Add a Date Attribute

Adding a Date attribute gives two choices :

- **Adding the current date**  

For this option, the attribute will contain the date when it has been computed. It could be useful if you need to show the exact loading date of the data.  

![Adding the current date](./images/2016-05-09_16_56_10-Add_a_Date_attribute.png "Adding the current date")  

- **Adding the last modified date of the file**  

Choosing this will create an attribute with the source file's last modification date.  

![Adding the last modified date of the file](./images/2016-05-09_18_00_06-Add_a_Date_attribute.png "Adding the last modified date of the file")  

Please note that these attributes will not show up in the attributes list, but you will see their value in the "Results" block on the upper right side of the Analysis screen.  

Here are the results you will get:  

![Result](./images/2016-05-09_17_58_39-iGRC_Project_-_demo2016_discovery_demo_Elyxo.discovery_-_iGRC_Analytics.png "Result")  

## Update an Attribute Value

It is possible to update an attribute's value from the discovery interface.  
This action is different from the other discovery actions because it will modify the actual value of the attribute, not create a new one.  

Similarly to computed attributes, the update can contain static or dynamic values. Dynamic values can rely on any other values of the current record. The component uses JavaScript macro syntax laid out in the "Collector Guide."  
To update an attribute's value, right-click on the attribute and select "Update an atribute value".  

![Updating an attribute's value](./images/2016-04-13_19_31_04-.png "Updating an attribute's value")  
**_Updating an attribute's value_**  

You can also use conditions, which can be generated  

![Updating an attribute](./images/2016-04-13_19_18_37-Replace_each_value_of_the_list.png "Updating an attribute ")  
**_Updating an attribute to 'true' for rows with a 'cn' starting by 'systemmailbox'_**  

The keyboard shortcut "Ctrl+Space" allows you to display the JavaScript query wizard.  
A wizard is also present on the right side of the "Condition" setting. It enables you to configure the conditions without needing to write the corresponding JavaScript code.  

![JavaScript query assistant](./images/3-update.png "JavaScript query assistant")  
**_JavaScript query assistant_**
