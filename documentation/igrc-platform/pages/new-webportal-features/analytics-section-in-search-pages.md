---
layout: page
title: "Analytics section in search pages"
parent: "New Webportal Features"
grand_parent: "Pages"
nav_order: 9
permalink: /docs/igrc-platform/pages/new-webportal-features/analytics-section/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

**_Version_**: 2015 R3 and onwards     

An analytics section has been added to the search pages as of version 2015 R3.     
Thanks to this section you can throw your search results in a dedicated pages or report for further analysis:   

![Analytics section in search pages](igrc-platform/pages/new-webportal-features/images/2015-07-09_08_53_00-Brainwave_Identity_GRC.png "Analytics section in search pages")

# How to enable/disable the feature?

The analytics section is attached to a 'feature'. The current user must have the feature to see the 'show/hide' analytics button.   

The corresponding features are located in the /webportal/features/pages.featureconfiguration element :  

|  **feature name** | **description** |
| identitysearch\_analytics |  Show the analytics panel in the identity search view |
| accountsearch \_analytics |  Show the analytics panel in the account search view |
| applicationsearch \_analytics |  Show the analytics panel in the application search view |
| groupsearch\_analytics |  Show the analytics panel in the group search view |
| organisationsearch \_analytics |  Show the analytics panel in the organisation search view |
| permissionsearch \_analytics |  Show the analytics panel in the permission search view |
| repositorysearch \_analytics |  Show the analytics panel in the repository search view |

# Managing analytics pages and reports

The search pages have been designed to create the links dynamically to analytics pages and reports taking advantage of the [tagging system](igrc-platform/pages/new-webportal-features/tagging-system-for-pages-and-reports.md). They will link automatically to all pages and reports that are properly tagged with the same concept and that expect to receive the UIDs as a parameter. The Identity Search page will link to all pages and reports that contain the tags **identity** and **byuids**. Follow the default tags and comply with the requirements in order to obtain the best results.  

# What parameters are sent?

Search pages will send:   

- The **uids**  of the concept being reviewed, serves as identifier of the elements selected in the search view.   

The page and report might use more parameters; However, they will not be sent by default by the search page. For that reason, it is recommended that any other parameter is declared optional.

# What are the Default Tags?

The minimal required tags are:  the concept tag and the **byuids** tag. However, best practice is to include a third tag that matches the category:   

|  **Tag** | **Description** | **Priority** |
|  **The concept tag** | This tag is directly associated to the concept. The tags used. **account, application, group, identity, organisation, permission, repository** | The priority declared on this tag is related to the order in which the link will be displayed. The value is one of the default priorities and is related to each of the categories. The idea is that that the link are displayed by category |
| **byuid** | This tags means that the page or report expect to receive the uid as a parameter. | Not used |
| **browsing**  | Browsing reports and pages | Default value is 200, declared in concept tag |
| **review**  | Review reports and pages | Default value is 300, declared in concept tag |
| **analytics** | Analytics reports and pages | Default value is 400, declared in concept tag |
| **mining** | Mining reports and pages | Default value is 500, declared in concept tag |
| **printable** | Tag used to identify the printable version of the detail page. Only one report by concept should be tagged as **printable.** By default , the old reports used as detail reports use this tag. | Default value is 100, declared in concept tag |

An example of a properly tagged analytics Page:    

![properly tagged analytics Page](igrc-platform/pages/new-webportal-features/images/2015-07-09_09_05_15-iGRC_Project_-_PortalFacets_webportal_pages_bw_analytics_reports_identity_orgmin.png "properly tagged analytics Page")

The uids parameter should be used as such in the views :

![uids parameter](igrc-platform/pages/new-webportal-features/images/2015-07-09_09_06_55-iGRC_Properties_-_PortalFacets_views_bw_analytics_reports_identity_analytics_org.png "uids parameter")

| **Important**: <br><br> Please note that due to a technical constraint the uids parameter won't be able to address more than 2000 distinct values.|
