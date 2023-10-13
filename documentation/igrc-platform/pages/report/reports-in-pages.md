---
layout: page
title: "Reports"
parent: "Pages"
grand_parent: "iGRC Platform"
nav_order: 24
has_children: true
permalink: /docs/igrc-platform/pages/report/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

Pages offer the option to open BIRT reports by pointing to the ".rptdesign" file located in ProjectPath/reports/   

![Report01](igrc-platform/pages/images/report01.png "Report01")        

Through the report viewer, you will be able to:   

- Navigate through the report content (table of content, pagination)
- Print the report
- Export the report in various formats (pdf, microsoft office, openoffice)

In order to be able to link to a report from pages we can declare the report with the report object Report.   

Reports are not part of the page. They are declared outside like Dialogs, NLS and Styles. They are considered as resources and can be imported from another file.

# Reports

Here is a simple example   

```
identityDetailReport = Report{
    report: "/reports/browsing/identitydetail.rptdesign" with recorduid to recorduid
    title: "Report Example"

    recorduid = Parameter{
        type: Integer
        recorduid-of: Identity
        mandatory: True
        hidden: True
    }
}
```

Mandatory attributes are marked in bold   
**title** the title of the report, similar to a page     

**report** the path to the .rptdesign and here we pass the paramaters of the report    
`report: "pathtoreport" with localparam to reportparam`    
the localparam must be declare in the Report block    
Check for the [parameters chapter](igrc-platform/pages/parameters.md) for more information about parameters    

**tags** here we can define tags an priorities if any, this can be used to create a [dataset of pages/reports](igrc-platform/pages/advanced-data-binding.md)     
`tags:"identity" priority 100, "byuid", "printable"`   
The report will be able to be found by using the tags identity,    
byuid and printable   

**dynamic-title** here we can change the name of the report using variables ,    
parameters of record columns    
`dynamic-title:Concat(Transform identity.hrcode using mayBeNullMapping," - ",Transform identity.fullname using mayBeNullMapping)`   
Title of the report will be changed dynamically to show the hrcode and identity fullname     

**icon** can be used to point to a small (16 px ) version of the icon to be used for the report  
`icon: "16/details/printable_16.png"`   

**large-icon** same as icon but an option to give a larger icon     
`large-icon: "48/details/printable_48.png" `   

**description** a description for the report   
Supports the [common attributes](igrc-platform/pages/widgets-common-attributes.md): **feature** and **background**
Supports the events: **enter-event** and **exit-event**. [ Learn more about events](igrc-platform/pages/events-and-actions.md)    

Then, the report can be called using the [GoTo Action](igrc-platform/pages/events-and-actions.md).    

For example:

```
Button {
    text: "Open Report"
    actions: GoTo Report identityDetailReport with selectedIdentityRecorduid to recorduid
}
```

# Declaring reports automatically

All the default reports are already declared in a page, thus you only have to import this page if you want to present a link to a report:   

`import "/webportal/pages/reports/standard.page"`   

For your own reports, most of the time you don't have to deal with the report declaration syntax as you can declare reports automatically through the Pages creation wizard.   

Here is how to do it:   

Create a new page and select 'Page declaring reports'  

![Page declaring reports](igrc-platform/pages/images/report02.png "Page declaring reports")        

Select the reports you want to publish in the web portal   

![report03](igrc-platform/pages/images/report03.png "report03")        

It will automatically create a file containing the reports declaration, such as:   

```
report = NLS {
    analysis_accountenabledusergone.title [en "Active accounts, identities gone" fr "Comptes actifs, identités parties"]
    analysis_accountenabledusergonedetail.title [en "Active accounts, identities leaved the company" fr "Comptes actifs appartenant à des personnes ayant quitté l'organisation"]
    analysis_accountreviewbyapplication.title [en "Account review" fr "Revue de comptes"]
}

analysis_accountenabledusergone = Report {
    report: "/reports/analysis/accountenabledusergone.rptdesign"
    title: $report.analysis_accountenabledusergone.title
}

analysis_accountenabledusergonedetail = Report {
    report: "/reports/analysis/accountenabledusergonedetail.rptdesign" with ^Quarter to ^Quarter, ^Repository to ^Repository
    title: $report.analysis_accountenabledusergonedetail.title
    ^Quarter = Parameter {
        mandatory: False
        hidden: True
        type: String
    }
    ^Repository = Parameter {
        mandatory: False
        hidden: True
        type: String
    }
}

analysis_accountreviewbyapplication = Report {
    report: "/reports/analysis/accountreviewbyapplication.rptdesign" with ^recorduid to ^recorduid, ^permission to ^permission
    title: $report.analysis_accountreviewbyapplication.title
    ^recorduid = Parameter {
        mandatory: True
        hidden: True
        type: Integer
        default: "11"
    }
    ^permission = Parameter {
        mandatory: False
       hidden: False
        type: String
        multivalued: True
        constraint: Lookup {
            data: br_permission
            value: Current applicationrecorduid
            text: Current displayname
            distinct: True
        }
    }
    br_permission = Dataset {
        view: br_permission
    }
}


```

You will then just have to import this file in your pages to link to your reports:   

`import "/webportal/pages/myreports/set1.page"`

```
mypage = Page {
    title:'test'
    homepage-for: All priority 100

    Button {
        text:'click me'
        actions: GoTo Report analysis_accountenabledusergone
    }

}
```

# Attaching a report to a web portal element

You can dynamically insert your reports into the web portal such as:   

- new items in the menus
- new analytics reports in the search views
- new analytics reports in the detailled views

In order to do so, you just have to leverage the 'tags' property. Any report with the right tags will be automatically added in the corresponding menu.      
Don't forget to specify as well some icons and descriptions as they will be used as well.   

Here is a simple example to add a report named 'My report sample' to the account details page:   

![report04](igrc-platform/pages/images/report04.png "report04")        

```
myReports = Report {
    title:'My report sample'
    report:"/reports/analysis/accountenabledusergone.rptdesign" with uid to uid
    tags:'account','byuid','browsing'
    icon:'16/details/browsing_16.png'
    large-icon:'48/details/browsing_48.png'
    description:'This is a simple example'

    uid = Parameter {
        label:"Concept Uid"
        type:String
        hidden:True
        mandatory:True
    }
}
```

As you can see, the menu added this new entry dynamically thanks to the 'account' and 'byuid' tags.   
Because of the 'byuid' tag, this report must have a 'uid' parameter positionned.   

Please refer to the following sections to learn more about the tags available in the brainwave web portal:   

[Tagging System for Pages and Reports](igrc-platform/pages/new-webportal-features/tagging-system-for-pages-and-reports.md)      
[Links to Reports and Pages from Detail Pages](igrc-platform/pages/new-webportal-features/links-to-reports-and-pages-from-detail-pages.md)   
[General Menu in the Home Page](igrc-platform/pages/new-webportal-features/general-menu-of-the-home-pages.md)     
[Analytics section in search pages](igrc-platform/pages/new-webportal-features/analytics-section-in-search-pages.md)   

# Linking back to a page from a report

Within a report you build links to others reports.   
This is a very convenient feature as, while in a report, the user can continue its drill-down investigations.   

Sometime, it is preferable to link the user back to a page or a standard activity, such as identity detail for instance.   
In order to do so you have to leverage a special syntax within the report engine link editor.   

Here is an example:   

![report05](igrc-platform/pages/images/report05.png "report05")        

While configuring the hyperlink you will have to select "drill-through" and a report.       
Although you have to select a report it won't be used as we will override the information (thus you can select the report itself for instance).   

In the report parameters you have to add a parameter named `__overridetarget`.   

This parameter contains as a string the link type and the target (see [actions and events](igrc-platform/pages/events-and-actions.md).         

Here for instance we specified that the link goes to the page named "repositoryDetailsPageRecorduid".   
You then have to add the other parameters, as required.   

Note that the `__overridetarget` parameter value is a string, as such it need to be surrounded by "".

# Batched Reports

Some reports can take a very long time to generate due to the significant amount of data they have to process.    
Two mechanisms are implemented in the portal to mitigate this:    

- Caching: once the report has been generated, an intermediate document is kept on the file system drastically speeding up subsequent accesses to this report.
- Batching: when a report generation is expected to be definitely too long for an interactive web session or if it consumes so much resources that it impacts the other portal users, it can be scheduled to be processed at a later time. It will be built by a background task and a notification can be sent to the issuer when the generation is completed.

We will explain the batching capabilities in this chapter.   

When the generation of a report is expected to be too time and resource consuming to be viewed interactively, the `batched-only: True` attribute can be specified in this report declaration. When a user requests such a report, if the cache intermediate document is found on the file system, the report is rendered immediately, otherwise the user is presented a message stating that the report generation has been scheduled and that it will be available at a latter time. A background process is responsible for managing the queue of scheduled reports, rendering one report at a time, in the order they were scheduled. The queue of scheduled reports can be accessed in a page dataset and displayed accordingly. Once the generation completes, the portal can be configured to execute a notify rule, thus sending an e-mail to the report issuer.    

Note that batched reports can also be anonymous (in the sense given in the previous section), in which case once a user as requested this report, it is available to any other user once it has been completed.   

Attributes:   

**batched-only** (boolean): is the report a batched report   

**batch-start-event** (list of actions): actions to execute when accessing to a batched report that has not yet been scheduled   

**batch-pending-event** (list of actions): actions to execute when accessing to a batched report that has been scheduled but not yet completed   

Here is an example of a batched report declaration:    

```
test_batched_report_1 = Report {
    report: "/reports/browsing/identitysearch_simple.rptdesign" with hrcodeParam to hrcode, surnameParam to surname, "*" to givenname, "hrcode" to sort
    title: "[Report] Batched report 1"
    tags: "TEST", "GENERAL"
    batched-only: True
    batch-start-event: Message Information "This report is batched. It will be available shortly"
    batch-pending-event: Message Information "This report is already batched. Come back later"

    hrcodeParam = Parameter{
        type: String
        default: "*"
    }

    surnameParam = Parameter{
        type: String
        default: "*"
    }
}
```

When a user will access to this report, instead of being displayed, the 'batch-start-event' or the 'batch-pending-event' will be triggered if the report has not been generated yet.   
The report is generated on a user per user basis, meaning that each user will have to generate the report on the first clic.

In order to present the batched reports available to your user, you have to leverage a dedicated dataset. Here is an example:   

```
batched1 = Dataset {
    batched-reports: BatchedReports
}

Table {
    data: batched1
    double-click:
        StringCase ( Current status ) {
                when "C" then [
                        GoTo Position Current position
                    ]
                }
    layout:
        Layout {
            grab: horizontal True vertical True
        }
    label:
        Label {
            value: $MyBatchedReports.list
            break: True
        }
    Column {
        column: status
        header: $MyBatchedReports.Status
        width: 100%
    }
    Column {
        column: title
        header: $MyBatchedReports.Title
        width: 100%
    }
    Column {
        column: submissionDate
        header: $MyBatchedReports.Submitted
        width: 200px
    }
    Column {
        column: completionDate
        header: $MyBatchedReports.Completed
        width: 200px
    }
}
```

You can also explicitly specify that a batched report is not related to a specific user context. In that case, once the report is generated it is available for all the users.   
This is called the 'anonymous' mode.   

Here is an example:   

```
test_batched_report_2 = Report {
    report: "/reports/browsing/identitysearch_simple.rptdesign" with hrcodeParam to hrcode, surnameParam to surname, "*" to givenname, "hrcode" to sort
    title: $BatchReportExample.Title
    tags: "TEST", "GENERAL"
    anonymous: True
    batched-only: True
    batch-start-event:
        Message Information $BatchReportExample.ReportIsBatched
    batch-pending-event:
        Message Information $BatchReportExample.ComeBackLater

    hrcodeParam = Parameter {
        type: String
        default: "*"
    }

    surnameParam = Parameter {
        type: String
        default: "*"
    }
}
```

You can present all the reports, including the anonymous reports to your user with the following configuration:   

```
Table {
    data: batched2
    double-click:
        StringCase ( Current status ) {
                when "C" then [
                    GoTo Position Current position
                ]
            }
    layout:
        Layout {
            grab: horizontal True vertical True
        }
    label:
        Label {
            value: $BatchReportsDemo.AnonymousAndBatched
            break: True
        }
    Column {
        column: status
        header: $BatchReportsDemo.Status
        width: 100%
    }
    Column {
        column: title
        header: $BatchReportsDemo.Title
        width: 100%
    }
    Column {
        column: submissionDate
        header: $BatchReportsDemo.Submitted
        width: 200px
    }
    Column {
        column: completionDate
        header: $BatchReportsDemo.Completed
        width: 200px
    }
}
```

You can filter batched reports with aditionnal commands within the dataset, for instance:   

```
batched3 = Dataset {
    batched-reports:
        BatchedReports {
            status: Submitted, Running, Completed
            submission-date: after Date.offset(-5 days)
        }
}
```

The possible attributes of the BatchedReports block are:    

- with-anonymous: (a boolean predicate): also contains anonymous reports along with reported scheduled by the current user,
- status: (a list of execution status): batching statues are Completed, Submitted, Running and Error. A status can be preceded by the Not keyword in order to invert the selection,  
- submission-date: (a date interval): only contains reports submitted after or before a date or between two dates,
- completion-date: (a date interval): only contains reports completed after or before a date or between two dates.  

A notify rule can be specified in the technical configuration under the key reports.batched.completed.notification. It will be executed each time a report generation completes.   

The notify rule must accept the three following parameters:     

- recipientUid the identity UID of the user who requested this report,  
- reportTitle the title of the report,  
- reportUrl the URL where the report can be directly accessed.

![report06](igrc-platform/pages/images/report06.png "report06")        

# Report caching capabilities

Some reports can take a very long time to generate due to the significant amount of data they have to process.   
Two mechanisms are implemented in the portal to mitigate this:    

- Caching: once the report has been generated, an intermediate document is kept on the file system drastically speeding up subsequent accesses to this report.
- Batching: when a report generation is expected to be definitely too long for an interactive web session or if it consumes so much resources that it impacts the other portal users, it can be scheduled to be processed at a later time. It will be built by a background task and a notification can be sent to the issuer when the generation is completed.  

We will explain the caching capabilities in this chapter.   

In BIRT, the rendering of a report is a two phases process:   

- the data used in the report are retrieved and are stored in an intermediate document (an .rptdocument file) along with basic layout preprocessing,
- this document is transformed according to the desired output format (HTML, PDF, etc...).  

By default, the portal keeps a persisted copy of these intermediate documents on the file system so that if the user asks again the same report only the second phase needs to be executed (see below for details on where and when).   

In the cache directory, each user have its own sub-directory (of the form `u_<userhash>` where userhash depends on the portal user login). This directory contains files of the form `<reportname>_<reporthash>.rptdocument` where reportname is the name of the report as defined in the .page file and reporthash is constructed using the following informations:   

- the identifier of the timeslot,
- the date of last modification of the corresponding .rptdesign file,
- the identifier and the roles of the user at the time of the generation,
- the parameters passed to the report.

When a report is displayed in the portal interface, the page header contains two icons used to reload the report:      

![Report](igrc-platform/pages/images/2015-06-24_16_55_17-Identity_GRC.png "Report")        

The left one reload the report using the cache, the right one removes the cached document before reloading the page (thus re-executing both rendering phases).   

Some aspects of report caching can be controlled by the following parameters of the technical configuration:   

- `reports.no-cache(true/false, false` by default): can be used to completely deactivate the caching functionality for all reports.
- `reports.compress-cache (true/false, false` by default): is the kept intermediate document compressed or not.   
**WARNING:**  if you change the value of this parameter the cache directory must be emptied before restarting the portal, otherwise all the currently cached reports will be considered as corrupted. enabling this feature has a strong impact on the cache size and almost no impact in performances.
- `reports.log-directory`: The BIRT engine log directory, used for advanced debugging purposes only. If unspecified it will be `<tomcat_home>/webapps/<application>/WEB-INF/workspace/.metadata/birt_logs`.
- `reports.cache-directory`: the filesystem directory where intermediate documents are kept: cached reports and batched reports. It must be the path of an existing writable directory on the file system. If unspecified, it will be `<tomcat_home\>/webapps/<application>/WEB-INF/workspace/.metadata/.plugins/com.brainwave.portal.ui.handler.pages/birt_reports`.  

Caching can be disabled for a given report by using the disable-cache: True report attribute. This can be useful if the report data are expected to change in-between timeslots (for example if it processes workflow informations, such as ticket logs or ticket actions).   

Here is an example:   

```
test_batched_report_2 = Report {
    report: "/reports/browsing/identitysearch_simple.rptdesign"
    title: $MyCustomNLS.MyReport2
    disable-cache: True
}
```

When a report is designed to have the strictly same content whoever the user viewing it is, it can be declared as an anonymous report using the anonymous: True report attribute. In this case, the cached intermediate document will be used for any user viewing the report and no principal or role information are passed to it. Note that this effectively disable restriction perimeters in views and rules as well as any eventual condition in the report depending on the user or its roles (technically the session in which the report is generated contains no value for the `USER_UID`, `USER_ROLES` and `USER_FEATURES` keys).   

Here is an example:   

```
test_batched_report_2 = Report {
    report: "/reports/browsing/identitysearch_simple.rptdesign"
    title: $MyCustomNLS.MyReport2
    disable-cache: True
    anonymous: True
}
```

Note: You can, and should, purge the cache directory on a regular basis without having to restart the web application server. Note that if a user is currently using a cached report while deleting the files, a temporary error will displayed on its web browser.   

# Exporting a report next to a user action

You can directly export a report in a given format next to a user action.   

here is a simple example:   

```
Button {
    text: $MyCustomNLS.ExportToPDF
    actions:
        ExportReport "/reports/browsing/identitysearch_simple.rptdesign"
            with
                "*" to ^hrcode,
                "*" to ^surname,
                "*" to ^givenname,
                "hrcode" to ^sort
            format
                "pdf"
            export-name
                "myreportname"

```

Consider reading [actions and events](igrc-platform/pages/events-and-actions.md) for more information about this.
