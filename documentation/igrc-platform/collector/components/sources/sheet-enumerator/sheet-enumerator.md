---
layout: page
title: "Source : Sheet enumerator for Excel file source"
parent: "Components : Sources"
grand_parent: "Components"
nav_order: 4
permalink: /docs/igrc-platform/collector/components/sources/sheet-enumerator/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This source component allows to enumerate the sheets belonging to an Excel workbook.  

Four attributes are added to the dataset:  

- _filename_ will be the file name of the Excel file (string),  
- _sheetname_ will contain the name of the current sheet (string),  
- _sheetnumber_ will contain the index number of the current sheet (number),  
- _totalnumberofsheets_ will contain the total number of sheets of the Excel workbook (number).  

# The properties Tab

## Source

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _target_
- _Excel File (XLS, XLSX)_ is the path to the Excel file to use  
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Source](igrc-platform/collector/components/sources/sheet-enumerator/images/xls1.png "Source")

## Description
This property allows adding comment regarding actions done by this component.  

![Description](igrc-platform/collector/components/sources/sheet-enumerator/images/xls2.png "Description")
