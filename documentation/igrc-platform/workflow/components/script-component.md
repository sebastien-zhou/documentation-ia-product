---
layout: page
title: "Script component"
parent: "Components"
grand_parent: "Workflow"
nav_order: 10
permalink: /docs/igrc-platform/workflow/components/script-component/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Javascript

It is possible to include javascript component to a workflow to perform various tasks using the script component. This component allows you to call a javascript function to execute.

# Specific API's

## addReportInCache

Add a report into the web server cache in order to allow the users to have immediate access:

### Usage

```javascript
Workflow.addReportInCache(reportName: String [, reportParams: Object] [, timeslot: String]
  [, userId: String] [, userRoles: String] [, locale: String]): String
```

- `reportName`: Project relative filename of the report to generate
- `reportParams`: Report parameters. It is a `java.util.HashMap` with the parameter name as the key and a `java.util.ArrayList` of values (String, Date,...) as the value. This parameter can be omitted if the report does not expect any parameter
- `timeslot`: Timeslot used to generate the report. The current timeslot is used if the parameter is omitted or null
- `userId`: The user UID with which the report must be generated. If this parameter is omitted or null, the report is shared among all users
- `userRoles`: The user roles with which the report must be generated. This parameter must be set if the userId has been given
- `locale`: Language used to generate the report. If this parameter is omitted or null, the report uses the web server language
- `Return value`: A string with the error message or null if the report has been successfully generated

### Examples

**Standard reports** :    

```javascript
function add_cache() {
 var /* java.util.HashMap */ params = new java.util.HashMap();
 var /* java.util.ArrayList */ recordUid = new java.util.ArrayList();
 recordUid.add(dataset.recorduid.get());
 params.put("recorduid", recordUid);

 /* declared ID */
 workflow.addReportInCache("browsing/identitydetail.rptdesign", params, null, dataset.uid.get(), "user", "fr")
}
``` 

**Anonymous reports** :      

In the case of anonymous reports, _i.e._ reports whose content does not depend on the user, the configuration of the javascript is slightly different.   
An anonymous report is configured in the report declaration in the page :    

```
batch_report_anonymous = Report {
 title: "Batch report anonymous"
 report: "/reports/custom/anonymous.rptdesign"
 anonymous: True
}
```

The javascript is as followed:

```javascript
function add_cache_anoymous() {
 var /* java.util.HashMap */ params = new java.util.HashMap();
 /* declared ID */
 /* Anonymous */
 workflow.addReportInCache("/reports/custom/anonymous.rptdesign", params, null, null, null, "fr")
}
``` 

## executeView

Execute a view in the ledger on a specified timeslot.   

### usage

`Workflow.executeView(timeslot: String, viewName: String [, params: Object]): Array`   

- `timeslot`: A timeslot identifier or null to use the current timeslot
- `viewName`: The name of the view to execute
- `params`: A java.util.HashMap filled with parameters expected by the view
- `Return value`: An array containing the whole result set returned by the view. Each line is a java.util.HashMap containing the column name as key and the column value as value

## generateReport

Generate a report to a file. Several output format are supported and some parameters can be given to the report.

### usage

```javascript
Workflow.generateReport(timeslot: String, rptDesignFile: String [, outputFormat: String]
  [, locale: String] [, outputFile: String] [, params: Object]): String
```

- `timeslot`: A timeslot identifier or null to use the current timeslot
- `rptDesignFile`: The project relative path of the rptdesign file to generate
- `outputFormat`: The output format of the generated report (allowed formats are PDF, ODS, XLS, XLSZIP) or null for PDF
- `locale`: The language used to generate the report (server locale by default)
- `outputFile`: The absolute filename of the generated file or null to let the product generate a temporary file
- `params`: A java.util.HashMap filled with parameters expected by the report
- `Return value`: The absolute filename of the generated file. Always use this returned value even if outputFile parameter has been set
