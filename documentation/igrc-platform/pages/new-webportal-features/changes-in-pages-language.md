---
layout: page
title: "Changes in Pages Language"
parent: "New Webportal Features"
grand_parent: "Pages"
nav_order: 7
permalink: /docs/igrc-platform/pages/new-webportal-features/changes-in-pages-langages/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Changes in 2016

## Batched reports declaration  

New attributes in the Report block:     

- batched-only: (boolean): is the report a batched report  
- batch-start-event: (list of actions): actions to execute when accessing to a batched report that has not yet been scheduled  
- batch-pending-event: (list of actions): actions to execute when accessing to a batched report that has been scheduled but not yet completed

## Batched reports dataset

Allow to query the current queue of batched reports for the connected user, for example    

```
batchedReports = Dataset {
    batched-reports: BatchedReports {
        status: Submitted, Running
        submission-date: after Date.offset(-5 days)
    }
  }
```

The possible attributes of the BatchedReports block are:     

- with-anonymous: (a boolean predicate): also contains anonymous reports along with reported scheduled by the current user,
- status: (a list of execution status): batching statues are Completed, Submitted, Running and Error. A status can be preceded by the Not keyword in order to invert the selection,  
- submission-date: (a date interval): only contains reports submitted after or before a date or between two dates,
- completion-date: (a date interval): only contains reports completed after or before a date or between two dates.

## GoTo action

Two new variants of the GoTo action:    

- GoTo BackInHistory: sets the current page to the previously accessed page, the currently displayed page remains the head of the navigation history  
- GoTo BackInHistoryTruncate: sets the current page to the previously accessed page, the currently displayed page is removed from the head of the navigation history

## SetNavigator widget

New attributes in the SetNavigator widget:   

- selection-changed-event: (list of actions): actions to execute after the navigator's current position changed
- selection-index: (reference to a variable): references an integral mono-valued variable which will contain the navigator's current index  
- initial-index: (reference to a parameter): references an integral mono-valued parameter which will contain the navigator's starting index
- label-image: (image selection expression): an image built from an image selection expression which is displayed before the label
- label-styling: (style selection expression): a style built from a style selection expression which is applied to the label
- dropdown: the definition of a drop down box (see below)  

Note that initial-index: is ignored if the initial: parameter is not provided. The purpose of initial-index: is to speed up the initial selection of the navigator as, if only initial: is provided the widget has to find the corresponding index in the dataset, possibly iterating through a substantial part of it. However then initial-index: is provided, the navigator starts by querying the dataset at this index and then checks if the initial: value matches. If this is not the case (for example because the sorting order has changed), the dataset is iterated as if no initial-index: was provided.    

The drop down box is used to display a tabular view of the dataset bound to the SetNavigator, for example:     

```
SetNavigator {
        data: all_timeslots
        column: uid
        initial: initial_timeslot
        selection: selected_timeslot
        label: Concat(Current displayname, ' (', Current commitdate, ')')
        label-width: 400
        label-image: StringImageSelection(Current status) {
            when "C" then "ts_active.png"
            when "A" then "ts_archive.png"
        }
        label-styling: StringStyling(Current status) {
            when "C" then ts_active
            when "A" then ts_archive
        }
        show-first: False
        show-last: True
        show-count: False
        dropdown: Dropdown {
            text: Concat(Current commitdate, ' - ', Current displayname)
            image: StringImageSelection(Current status) {
                when "C" then "ts_active.png"
                when "A" then "ts_archive.png"
            }
            styling: StringStyling(Current status) {
                when "C" then ts_active
                when "A" then ts_archive
            }
            height: 300
        }
    }
```

## Table widget

New attributes in the Table widget:    

- initial-selection-index: (reference to a parameter): references an integral mono-valued parameter which will contain the table's starting index
- selection-index: (reference to a variable): references an integral mono-valued variable which will contain the table's current index   

As for the SetNavigator widget, initial-selection-index:is ignored if initial-selection: is not provided.     

## MultivaluedIterate action

This action allows to iterate over the values of one or more multi-valued expressions and execute a given list of actions for each iterated element.  

For example, if var\_elems is a multi-valued integral variable and var\_sum is a mono-valued integral variable, the actions  

`Set 0 to var_sum, MultivaluedIterate var_elems as elem [ Set Sum(var_sum, Current elem) to var_sum ]`    

will set var\_sum to the sum of the elements of var\_elems.     

As another example, if prm\_path contains the path to a file, for example "/a/b/c/d.txt", the action     

```
MultivaluedIterate Split prm_path using "/" as part index-as idx [
    IntCase(Current idx) {
      when = 1 then []
      otherwise [
        IntCase(Difference(SizeOf Split prm_path using "/", Current idx)) {
          when > 0 then [
            StringCase(var_directory) {
              when IsEmpty then [ Set Current part to var_directory ]
              otherwise [ Set Concat(var_directory, "/", Current part) to var_directory ]
            }
          ]
        }
      ]
    }
  ]
```

will set the parent directory of the file to the variable var\_directory ("a/b/c" in the example).     

## Total process progress in TaskInfo and ProcessInfo

The process total progress is accessible in TaskInfo(task, ProcessProgressTotal) and ProcessInfo(process, ProgressTotal).  

## Timeslot UID in TaskInfo and ProcessInfo

The timeslot UID used to launch a process is accessible in TaskInfo(task, TimeslotUID) and ProcessInfo(process, TimeslotUID).  

## Task filter in datasets

The TaskFilter block of page datasets allows two new attributes:    

- show-suspended: (boolean predicate): includes or not suspended tasks in the dataset  
- show-expired: (boolean predicate): includes or not expired tasks in the dataset

## Additional parameters to chart hyperlinks

The new attribute additional-link-parameters: to the Chart block allows to pass additional values to the hyperlink of SVG charts. For example:    

```
Chart {
    data: chart_data
    file: "pie.chart"
    series: Current name in "category", (Current ^value) as Integer in "series1"
    additional-link-parameters: selected_uids to uids
    layout: Layout {
      grab: horizontal True vertical True
    }
  }
```

## Selecting the first non empty value

The new binding expression NonEmpty allows to select the first non-null and non empty value from a list of expressions. For example:    

`NonEmpty(var1, var2)`  

Any number of expressions can be given.  

## Access to configuration variables

The new binding expression ConfigurationVariable can be used to retrieve the value of a project configuration variable. For example:    

`ConfigurationVariable "logPath"`  

Eventual macros are expanded.  

## Checkboxes changed event in Table

The new attribute checkboxes-changed-event: of the Table widget allows to specify a list of actions to be executed each time the value of the checkboxes variables are updated.  

## Javascript services

Javascript files can now be created inside the webportal/pages directory (and any sub-directories) and methods from these files can be referenced by services. The extension of these files must be '.javascript'.     
The service declaration block now allows the new attributes:     

- javascript-file: the name of the javascript file, relative to the root of the project,  
- javascript-method: the name of a method in the previously specified file.   

The method should not have parameters and, for StringService, IntService and BooleanService, return a value of the appropriate type. For EventService any return value is ignored.     

Inside the method, the dataset object already contains attributes for any input or output parameter specified in the service declaration.    
For example in the /webportal/pages/test\_js.javascript file:   

```
function test12() {
    if (dataset.invert.get()) {
        return dataset.surname.get() + " " + dataset.givenname.get();
    }
    return dataset.givenname.get() + " " + dataset.surname.get();
}
```

and in a .page file  

```
js12 = StringService {
    javascript-file: "/webportal/pages/test_js.javascript"
    javascript-method: test12

    givenname = Input {
        type: String
        mandatory: True
    }
    surname = Input {
        type: String
        mandatory: True
    }
    invert = Input {
        type: Boolean
        default: False
    }
}

test_js3 = Page {
    title: "[JS] Assignable Services in Table"
    tags: "TEST", "GENERAL"

    invert = Variable {
        type: Boolean
        initial: False
    }

    identities = Dataset {
        view: br_identity
    }

    Checkbox {
        variable: invert
        text: "Invert"
        modify-event: ReloadData(identities)
    }
    Table {
        data: identities
        label: Label {
            break: True
        }
        layout: Layout {
            grab: horizontal True vertical True
        }
        show-count: True

        Column {
            column: uid
            header: "UID"
            width: 300px
        }
        Column {
            column: fullname
            text: @js12(Current givenname to givenname, Current surname to surname, invert to invert)
            header: "Name"
            width: 100%
        }
    }  
}
```

The config object can be used to retrieve project global variable as defined in the configuration files, as well as four other attributes:  

- \_\_PRINCIPAL\_UID is the uid of the user viewing the page,  
- \_\_PRINCIPAL\_FULLNAME is the full name of the user viewing the page,
- \_\_PRINCIPAL\_LANGUAGE is the language of the user viewing the page,
- \_\_TIMESLOT\_UID is the timeslot of the current page.

For example, in the javascript file:  

```
function test11() {
    dataset.out_val = config.__PRINCIPAL_UID + "/" + config.__PRINCIPAL_FULLNAME + "
    (" + config.__TIMESLOT_UID + ")";
}
```

and in the page:  

```
js11 = EventService {
    javascript-file: "/webportal/pages/test_js.javascript"
    javascript-method: test11

    out_val = Output {
        type: String
    }
}

test_js2 = Page {
    title: "[JS] Event Services"
    tags: "TEST", "GENERAL"
    enter-event: Call js11(out_val from out_val)

    out_val = Variable {
        type: String
    }

...

}
```

Inside the javascript, any print call will be redirected to the igrcportal.log file. The debugger; token can be used to dump a bunch of information in the log file (which must allow debug level).  
