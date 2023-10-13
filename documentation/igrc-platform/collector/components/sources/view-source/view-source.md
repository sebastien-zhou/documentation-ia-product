---
layout: page
title: "Source : View source"
parent: "Components : Sources"
grand_parent: "Components"
nav_order: 6
permalink: /docs/igrc-platform/collector/components/sources/view-source/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

The **View Source** component enables the use of view result as a input during the data collection phase. This component can be use to use data that is not related to the current timeslot.   
One use case is to inject Audit Logs data through a Logs Views source to compute Usage data.   
Another use case is to retrieve right reviews data (through a View source on Ticket Reviews) to collect theoretical rights.

| **Note** <br><br> The view source should be used with caution on regular Ledger Entities, such as accounts, applications, and identities, as the underlying view retrieves data from the **_previous_** timeslot.|

![Editor]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/view-source/images/editor.png "Editor")

# The Properties tab

## View tab

This tab lets you select the view to be used, and set parameters if needed.

- **Source view** : select the view to use as a source. This could be either an audit view, a business view or a logs view
- **Parameters** : you can set parameters to the view if needed.   
To set a parameter, click Add button, select a parameter for the list and set a view.

![Tab view]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/view-source/images/tabview.png "Tab view")

## Limits tab

This tab lets yous optionally set limits to the results of the view. You can skip rows and/or limit the maximum number of results returned by the view

- **Skip** : type a number to skip the first records of the view. If left blank, not records are skipped.
- **Select maximum** : type a number to limit the maximum number of records that will be returned by the view. Leave blank to return all records.

![Limits tab]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/view-source/images/tablimits.png "Limits tab")

## Description tab

This tab lets you put a description on the purpose of this component.

![Description tab]({{site.baseurl}}/docs/igrc-platform/collector/components/sources/view-source/images/tabdesc.png "Description tab")

# Best practices

- View Source should be used on data that is **not related** to a given timeslot, such as Audit Logs, Tickets, Ticket actions and Ticket Reviews,
- View Source should be used with caution on regular Ledger entities (such as accounts, applications, identities) because the view executes against the previous timeslot, which means the results will be inaccurate if entities have changed. View Sources do not retrieve data from the current sandbox.

## Theoretical rights example

One approach to defining the theoretical rights of people in the Ledger (_i.e._ what rights people are expected possess in a given application) is through rights reviews: Basically, you use the manual reviews settings (set by the reviewers) to create the theoretical rights matrix.

Rights reviews (associations between a person or a group of persons and an application) end up as ticket reviews objects in the Ledger, with a specific type.   

The collector will consist of the following components:   

- a **View Source** referring to a view that will retrieve all ticket reviews of a specific type (_e.g._ PERMISSIOSNREVIEW) with the associated people/application information.
- An **Update Filter** component that will set various attributes (_e.g._ right type) to ensure the adequate _Entitlement Model rules_ are executed
- A **Theoretical rights target**  component to store the rights matrix.
