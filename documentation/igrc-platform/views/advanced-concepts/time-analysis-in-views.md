---
layout: page
title: "Time analysis in views"
parent: "Views: Advanced Concepts"
grand_parents: "Views"
nav_order: 9
permalink: /docs/igrc-platform/views/views-advanced-concepts/time-analysis-in-views/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

Time analysis concept has been introduced as of iGRC 2016 version, to compare information from one timeslot to another. This option is also available the view editor.   

# Prerequisites

## Compatibility matrix

|  2015 |   |  |  |  2016 |  |  |
|  R1 | R2 | R3 | R4 | R1 |  R2 |  R3 |
|  XXX | XXX | XXX | XXX | Yes | Yes |  Yes |

## Dependencies

No specific dependencies.

# Procedure

In the View editor, new targets have been added for specific elements - as "Identities", "Accounts", "Permissions", "Asset" etc... - and it is now possible to join the element with **_the same element from other timeslots_** , as shown below:   

![Procedure]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/2016-11-04 11_31_20-iGRC Properties - testr3sp1_views_custom_previousTs.view - iGRC Analytics.png "Procedure")             

The view will return elements that are present both in the selected timeslot AND in other timeslots as well.   

![Procedure]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/2016-11-04 11_33_49-iGRC Properties - testr3sp1_views_custom_previousTs.view - iGRC Analytics.png "Procedure")             

## View 1 : Identities that exist at least in one other timeslot

The results of this view will only display identities from the selected timeslot that were also present on other timeslots.   

<u>Example:</u>   

Let's consider the following timeslots with those identities:   

T1-\> ADAM, OLIVER, LAURA    
T2-\> ADAM, BERNARD, FRANCK   
T3-\> ADAM, BERNARD, SAMI, LAURA   
T4-\> NICOLAS, MAYA   

Results will depend on the selected timeslot (timeslot selection in the results tab) :    

- T1 results:only ADAM and LAURA, who are present both in T1 and in other TS.
- T2 results: ADAM and BERNARD
- T3 results: ADAM, BERNARD and LAURA
- T4 results: no result

It's also possible to choose a specific timeslot to be compared with. For example, to compare data from one timeslot with data from the previous timeslot, a specific attribute, **timeslotuid** , should be used :   

![Procedure]({{site.baseurl}}/docs/igrc-platform/views/advanced-concepts/images/2016-11-04 11_43_33-iGRC Properties - testr3sp1_views_custom_previousTs.view - iGRC Analytics.png "Procedure")             

## View 2 : Identities that were present in the previous timeslot

Among other values,the **timeslotuid**  attribute can be filtered on the value "**previous timeslot**" to narrow down the comparison to the previous timeslot.   

It is also possible to use other attributes, as **_timeslotcommidate_**  attribute to filter on a date instead of filtering on a specific timeslot.   

<u>Example</u>:   

If we use the same example as above on View 2 :   

T1-\> ADAM, OLIVER, LAURA   
T2-\> ADAM, BERNARD, FRANCK   
T3-\> ADAM, BERNARD, SAMI, LAURA   
T4-\> NICOLAS, MAYA   

Only the identities present both in the selected timeslot and its previous timeslot will be displayed :   

- T1 results: No result, as there is no previous timeslot
- T2 results: ADAM (the only identity present both in T1 and T2)
- T3 results: ADAM, BERNARD (Identities present both in T2 and T3)
- T4 results: no result

# Known limitations

With this new targets, the type of joint (INNER or LEFT join) is not taken into account. The view filters results as an INNER join by default.    

The timeslot attribute "timeslotuid" with the specific filter criteria "previous timeslot" can only be used with the target described above ("join with the same XXX in other timeslots"). Using the filter criteria "previous timeslot" on other target will not display any result.   

However, the other timeslot attributes can be used with any type of target.
