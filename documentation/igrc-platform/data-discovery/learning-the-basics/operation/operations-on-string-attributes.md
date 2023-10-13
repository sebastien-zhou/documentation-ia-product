---
layout: page
title: "Operations on string attributes"
parent: "Operations"
grand_parent: "Learning the basics"
nav_order: 1
permalink: /docs/igrc-platform/data-discovery/learning-basics/operations-on-string-attributes/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

This entry contains all the operations that can be performed on string type attributes, such as:    

# Convert to date into a new attribute

To convert a string type attribute into a date format, just right-click on the attribute -\> **Operations on string attributes**  -\> **Convert to date into a new attribute.**   

![Converting a string type attribute into a date](igrc-platform/data-discovery/learning-the-basics/images/2016-06-29 17_53_50-.png "Converting a string type attribute into a date")   
**_Converting a string type attribute into a date_**    

Then enter the settings of the new attribute.   

Local language gives an indication as to how the days are written in the file.
For instance, if the month are written in plain text in your source file, you might see this:   
04 Feb 2016   
"Feb" means that the local language is English, so you would have to put "en" in the local language field.   

![Configuring a new date type attribute](igrc-platform/data-discovery/learning-the-basics/images/2-operations-on-string-attributes.png "Configuring a new date type attribute")   
**_Configuring a new date type attribute_**    

Once the new attribute has been created, it will appear in the list of attributes. The date format must be filled out with a pattern. You will find the documentation about the pattern at this link:   
[http://docs.oracle.com/javase/1.4.2/docs/api/java/text/SimpleDateFormat.html](http://docs.oracle.com/javase/1.4.2/docs/api/java/text/SimpleDateFormat.html*)   

Here are some examples:

![Date format pattern](igrc-platform/data-discovery/learning-the-basics/images/3-operations-on-string-attributes.png "Date format pattern")   
**_Date format pattern_**   

# Normalizing the value into a new attribute

The principle is to eliminate all the special characters contained in the composition of the attribute's values (example of special characters: "ç", "\_", "'" "^"...). You can perform this operation by right-clicking on the attribute name-\> **operations on string attributes-\>Normalize value into a new attribute**.   

# Extract DN values into a new attribute

You can extract the values of a DN type attribute into a multivalued attribute. The values are stacked so that the first value of the multivalued attribute corresponds to the end of the DN value.    

![Extracting a DN value into a new attribute](igrc-platform/data-discovery/learning-the-basics/images/2016-06-29_17_52_04-.png "Extracting a DN value into a new attribute")   
**_Extracting a DN value into a new attribute_**   

A practical usage case is as follows:   
The DN of users contains useful complementary information (example: the organization to which the person belongs) in this format:    
cn=abdel Kader, or=DSICORP, or=users, or=acme, or=com   
The application of this action on the DN in order to build a new "DNS" attribute will then allow the simple creation of a computed attribute "organization" which contains the sought-after value in the syntax {dataset.DNS.get(1)}.

# Separating the parts of a value into a new attribute

The operation separates the parts of an attribute's value into a new multivalued attribute.  
Example of value to separate: DSIO/OPS/CORP. In this example, we will put the parts of the value into a new multivalued attribute. To do this, just:   

- Right-click on the attribute name-\> **Operations on string attributes** -\> **Split parts of a value into a new attribute**.

![Example of extracting an attribute's value](igrc-platform/data-discovery/learning-the-basics/images/2016-06-29_17_41_34-iGRC_Project_-_toto_discovery_test_AD_users_test.discovery_-_iGRC_Analytics.png "Example of extracting an attribute's value")   
**_Example of extracting an attribute's value_**   

- then enter the name of the new attribute and the separating character

![Configuring the new multivalued attribute](igrc-platform/data-discovery/learning-the-basics/images/6-operation.png "Configuring the new multivalued attribute")   
**_Configuring the new multivalued attribute_**   

It is important to note that the operation works if and only if the separator between the value's elements is the same.   

# Extract the characters into a new attribute

It is possible to extract a value's characters into a new attribute. This operation is generally used to extract the elements present in a log file. In order to perform the operation, right-click on the attribute name-\> **Operations on string attributes-\>Extract characters into a new attribute**.   

![Extracting the values from an attributes](igrc-platform/data-discovery/learning-the-basics/images/2016-06-29_17_46_36-.png "Extracting the values from an attributes")   
**_Extracting the values from an attributes_**    

You have two options:   

- Extract the N first characters: this allows you to set the number of characters to put into a new attribute. You can go through the string from the beginning or the end by checking the appropriate box.
- Extract the N first characters until the first occurrence of the separator. You can go through the string from the beginning or the end by checking the appropriate box.

![Extracting the characters from an attribution](igrc-platform/data-discovery/learning-the-basics/images/8-operations-on-string-attributes.png "Extracting the characters from an attribution")   
**_Extracting the characters from an attribution_**    

**_<u>Warning</u>_** : The extracted characters will be consumed, which means that the initial attribute value is modified at the end of the operation.
