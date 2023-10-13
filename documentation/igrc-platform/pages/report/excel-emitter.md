---
layout: page
title: "Excel emitter for reports"
parent: "Reports"
grand_parent: "Pages"
nav_order: 24
has_children: true
permalink: /docs/igrc-platform/pages/report/excel-emitter/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Updates

The following table indicates the updates applied to the excel emitter and from which versions these updates apply.

|Ability to freeze panes                                  |  |
|Ability to manage multiple tabs                          |  |
|Ability to rename tabs                                   |  |
|Ability to activate automatic filter on tables           |  |
|Ability to initiate the report from an XLS template file |  |
|Ability to write protect tabs with a password            |  |  
|Ability to set the option "fit to page"                  | 2016 R3 |
|Extensive support of XLSX export                         | 2016 R3 |
|Native Excel properties                                  | 2016 R3 |
|Excel Headers and Footers                                | 2016 R3 |
|Ability to hide sheets                                   | 2017 R3 |
|Data validation in cells using a list of values          | 2017 R3 |

# Updating the emitter

|*Note:* <br><br> starting with version iGRC 2015, the new emitter is provided out of the box. Only older versions may require a manual update.|

Whether in analytics or in the portal, the jar must be updated in `\plugins`
The jar is: `org.eclipse.birt.report.Engine.emitter.nativexls`

- Save this jar (do not just rename it, delete it completely from the directory)
- Replace with the new jar
- Analytics: update `c:\igrcanalytics\configuration\org.eclipse.equinox.simpleconfigurator\bundles.info` (edit the line referencing the nativexls bundle, you must update it with the name and version number of the new jar)
- Restart analytics / portal in CLEANUP mode (_e.g.:_ igrcanalytics.exe -clean)

# Excel report properties

The following report properties are transferred as Excel properties:
- Author
- Title
- Subject
- Comments

# Configuration options

## Multiple tabs

The Excel emitter supports page breaks and will generate a new tab every time a page break is detected.

## Header and footer

The header and footer defined in the report Master Page are recorded as native Excel header and footer.
Excel only supports a header/footer composed of a single GRID with 1 row and 3 columns (left, center, right) with no image.

By default, if no footer is defined on the right side, the page number is automatically inserted.

## Renaming tabs

- Select a report item (label, text or other... )
- Give it a name containing `sheetname` (the name must be unique, you can use sheetname1, sheetname2 ... if you have multiple tabs)
- The tab will be renamed as the report item value.

For instance, if your report contains a label which value is `APPLICATION`, naming this report item `sheetname1` will ensure the tab will be named `APPLICATION`.

## Freeze Panes

### At workbook level

This is then defined for all the pages.
- Declare a user property at the root of the report named: `ExcelFreezePane`
![User properties]({{site.baseurl}}/docs/igrc-platform/pages/report/images/freezepane1.png "User properties")

- Assign a string value to it ( `Advanced` tab of the properties); _e.g.:_ `3x5` where 3 and 5 are the columns and rows (starting with zero) position where frozen panes.
![Advanced]({{site.baseurl}}/docs/igrc-platform/pages/report/images/freezepane2.png "Advanced")

### At tab level
- the same user property can be defined on the report item carrying the information about the page (eg: its name contains the string `sheetname`, see **Renaming Tabs**)
- Give it value as a string type (3x5) where 3 and 5 are the columns and rows respectively (starting with zero) position where frozen panes.


## Template

- Declare a user String property at the root of the report called `ExcelTemplateFile`
- Give it a value ( `Advanced` tab of the properties) indicating the path[^1] to the template XLS or XLSX file
- The report will be generated as copy of the template file in which the report data are inserted in a new tab.


## Protect tabs

### At workbook level

If this configuration is applied then all sheets are read-only.
- Declare the user property (string) `ExcelPassword` at the root of the report
- Its value is the password protecting all pages

### At sheet level
- The user property String `ExcelPassword` can be defined on the report item carrying the information about the page (eg: its name contains the string `sheetname`, see **Renaming Tabs**)
- Its value is the password protecting the tab.

## Manage cell protection

By default, all cells are protected, e.g. they cannot be edited when the sheet is protected.
You can selectively disable cell protection by specifying the following user property on a Cell (Table or Grid) cell: "ExcelUnprotectCell".
This property must be set to "true" or "1" to disable cell protection.

## ~~Print on a single sheet~~ - DEPRECATED

| **WARNING:** <br><br>  the "ExcelFitOnePage" option is no longer supported as of version 2016 R3. The option has been replaced by the option `ExcelPrintFitToPage` (see section bellow) |

## Fit To Page

The `ExcelPrintFitToPage` option sets the print area in number of pages in width x height pages.
- Declare the user property `ExcelPrintFitToPage` at the root of the report
- Give it a value of format `111x111`, _e.g._:
    - To print the entire report on one page, provide the value `1x1` parameter
    - To print the report in a page width (_e.g.:_ list report), provide the value `1x999` parameter

## Automatic filter

In order to define an automatic filter on a table, give the table item a unique name containing the string `autofilter`:
![Automatic Filtering]({{site.baseurl}}/docs/igrc-platform/pages/report/images/autofilter1.png "Automatic Filtering")


| **Note:** <br><br> when exporting to XLS format AND protecting the sheet (using a password), the autofilter is disabled. This is Excel's standard behavior. You can bypass this by exporting in XLSX format. |

| **Note:** <br><br> this property does not work if a grid is present in the Table |

## Hide Sheet

The `ExcelHideSheet` option allows to hide sheets in a workbook.
- The option must be set on the report item carrying the information about the page (_e.g.:_ its name contains the string `sheetname`, see **Renaming Tabs**)
- Its value must be `1` or `true`

## Data Validation in cells

You can set a Data Validation constraint in a cell using a static list of values. This may be used, for instance, for forcing the selection of an authorized value when editing a review report.

The behavior of this Data Validation is:

- validation is confirmed against the static list of values
- the list of authorized values is displayed in a drop-down list when clicking on the report cell
- entering an invalid value displays an error message, which blocks the entry.

Two options are available:

- The `ExcelAuthorizedValues` option must be setup on a Cell (Grid, Table...). Its content must be a pipe-separated list of values. Example : `First Value|Second Value|Third Value`
- The `ExcelAuthorizedValuesErrorMessage` option can be setup at the report level. If set, it overrides the default error message when the user enters a value that is not valid. The default message is: `Error, invalid value!`

# Dynamic Property Values

User properties can be set at runtime using scripting.
For instance, for setting the report-wide `ExcelFitToPage` parameter:
```
reportContext.getReportRunnable().setProperty("ExcelFitToPage","2x3");
```

Conversely, you can access the value of the properties in your report, for instance using a Dynamic Text field:
```
<VALUE-OF>reportContext.getReportRunnable().getProperty("ExcelFitToPage")</VALUE-OF>
```

# Max Rows per Sheet

By default, the Birt report engine will limit the number of rows in any list or table to 10,000 before issuing a mandatory page break. This also applies to the Excel output, in which case the table content is split among several sheets (each sheet with 10,000 rows).

The following script can be added to any report to circumvent this limitation. The script must be added to the "beforeFactory" section of the report (in addition to the already existing function call `"beforeFactory();"`):

```
reportContext.getAppContext().put("MAX_PAGE_BREAK_INTERVAL", 500000);
```

# Known limitations

## FreezePane, Password

Do not define both overall (report) and tab level passwords!

## Autofilter

Use only **one** auto filter at a time on the same rows (there may be several `autoFilters` in consecutive tables in the vertical direction)

## FitToPage

The option is set at report level, so it is applied to all tabs in the same way.

## Missing Excel tabs

This is only the case when using a version prior to version 2014R3. When generating the report from the portal, the page breaks are ignored and all data are in a single tab.

[^1]: **WARNING:** an absolute path or a path relative to the directory "reports" of the project may be used to designate the template file.
