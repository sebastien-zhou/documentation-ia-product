---
layout: page
title: "Search Pages and Navigation System"
parent: "New Webportal Features"
grand_parent: "Pages"
nav_order: 4
permalink: /docs/igrc-platform/pages/new-webportal-features/search-pages-and-navigation-system/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

![Search Pages and Navigation System](../images/img4.png "Search Pages and Navigation System")   

# What is new in the Search Pages?

Search pages have been reviewed and completely modified. A new widget has been included to bring the richness of the core search engine to the webportal. The widget support 2 modes of operation: simple and advanced.
In the simple mode, the most commonly used fields are exposed to offer the possibility to filter. In advanced mode, it allows to create advanced queries like the desktop client would.      
The capabilities of the new search system don't stop there. When a query has been built the set of results are kept in the [Detail Page]({{site.baseurl}}{% link docs/igrc-platform/pages/new-webportal-features/detail-pages.md %}). It is represented as a Navigator:    

![Search Pages](../images/img6.png "Search Pages")   

The navigator is a widget that allows to move from an element to another in the set of results. It also allows to go back to the search in case the user needs to modify it.   

But the navigator is not only present in the [Detail Page]({{site.baseurl}}{% link docs/igrc-platform/pages/new-webportal-features/detail-pages.md %}) , any page can support the navigator functionality. It has also been implemented in the new pages that handle the reports category browsing.   

![Search Pages](../images/img5.png "Search Pages")   

This allow the user to browse in depth the details of the elements in the result set.

# How Does the Search Widget Work?

The Search Widget is called **SearchEdition** and requires a **SearchDefinition**. They are declared as following:    

![Search Widget](../images/img7.png "Search Widget")    

The search definition can be serialized to be sent as a parameter. This is needed so that the next page can use the definition to support the navigation function together with the parameter **paramSearchMode** which is a boolean flag indicating whether there is a search defined or not:    

![Search Widget](../images/img8.png "Search Widget")   

This two parameters are sent by default from the Search Pages to the [Detail Page]({{site.baseurl}}{% link docs/igrc-platform/pages/new-webportal-features/detail-pages.md %}) and from there to all the [pages and reports it links to]({{site.baseurl}}{% link docs/igrc-platform/pages/new-webportal-features/links-to-reports-and-pages-from-detail-pages.md %}). The target pages may use them to show a navigator. By default , the navigator is supported in all browsing pages.

# How does the Navigator Work?

For a Page to support the navigator function it should:   

- Receive as parameters a **search definition** and a **paramSearchMode**   

![Navigator](../images/img11.png "Navigator")

- Define a variable to hold the UID of the selected item. The navigator will modify this variable, so all the datasets in the page should use this variable to represent the current item. It is recommended to use the paramConceptUid as an initial value of this variable:   

![Navigator](../images/img14.png "Navigator")  

- Declare a navigation list  that is build from the search definition   

![Navigator](../images/img15.png "Navigator")  

- Insert a navigation object , customizing the desired behavior when clicking on ** back-link** .  
 Example:

![Navigator](../images/img13.png "Navigator")  

This is in general the way the navigator is implemented in the browsing pages.   

# How to limit the autocompletion scope

As of version `2016 R3 SP6` a fonctionality has been added that allow the consultant to limit the autocompletion results of the SearchEdition widget. In other words this allow the consultant to limit the entries visible for a given user through the autocomplete.    
For this a new parameter has been added to the `SearchEdition`: `completion-view`   

This can be configured either :   

1) By passing the desired parameters to a specified view:   
```
SearchEdition {
 definition: applicationSearch
 layout: Layout { grab: horizontal True vertical False }
 simple-mode-columns: 2
        simple-mode-layout: SimpleModeLayout {
     code { label: $application.code },
     name { label: $application.displayname }
 }
 completion-view: [
 Application as <view> with <page parameters> to <view paramters>
 ]
}
```
2) By using a view where the perimiter has been configured and the perimeters have been defined in the corresponding `.roles` files. See [Features and Roles]({{site.baseurl}}{% link docs/igrc-platform/pages/features-and-roles/features-and-roles.md %}) for more information on how to configure perimeters in the `.roles` files.   

Several components can be declared at the same time. The list of applicable components is as followed:  

- Application
- Account
- Asset
- Group
- Identity
- JobTitle
- Organisation
- Permission
- Reconciliation
- Repository
- Right
- TicketLog
- Usage

| **Note**: <br><br> Please note that only the declared components will be filtered.|
