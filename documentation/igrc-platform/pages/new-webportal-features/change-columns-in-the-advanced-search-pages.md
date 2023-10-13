---
layout: page
title: "Change columns in the advanced search pages"
parent: "New Webportal Features"
grand_parent: "Pages"
nav_order: 10
permalink: /docs/igrc-platform/pages/new-webportal-features/changes-colums/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context  

**_Version_**: 2015 R1 and onwards      

The columns displayed in the advanced search pages depend on standard views of the default project. If you wish to change the columns displayed it is necessary for you to change the default search page as well as the view used.     

| **Note**: <br><br> It is highly recommended to create a new view and/or rule when applying these modifications to the default project as other pages can depend on the default view. Changes applied to the view could then affect other pages.|   

Here are the steps to follow :   

1. locate the view used in the advance search page
2. navigate and change the corresponding view adding your required attributes
3. Add the columns to display to the page
4. Apply the changes to the web portal

# Locate the used view

The first step would be to locate the views used in the advanced search page. As an example to add a column to the advanced group search you should navigate to : \webportal\pages\group\search.page     

In the case of the group search, the view used in the search page is found:     

```
groupData = Dataset {
   search: Search {
     definition: groupSearch
     view: br_group_searchpoint
   }
}
```

# Navigate and apply changes to the view  

When navigating to the view you can see that each attribute in the view corresponds to a column in the advanced search page. You can add your desired attributes to the view. In the following example the importaction and deleted action attributes were added to the view.    

If you have duplicated view to work on a seperate copy do not forget to change the name of the view called in the page (e.g. the br\_group\_searchpoint in the groupData).   

![Attribute](../images/addAttribute.png "Attribute")    

To be made visible in the webportal, the added attributes must also be added the corresponding page search.page.   

| **Note**: <br><br> It is not recommended to add a new component to the view as it can impact the results directly. If you are required to add a component then only add LEFT JOINS !|

# Add the columns to display to the page

In the page locate the table corresponding to the displayed data and add the columns corresponding to the attributes added to the view. For each added attribute the corresponding following block should be added :      

```
Column {
 column: repository_ATTRIBUTE
 header: $prepository.ATTRIBUTE
 width: 250px
 sortable: True
 initially-masked: True
}
```
The initially-masked option enables you to initially display or not the column.  

# Apply the changes to the webportal  

Applying the changes to the web portal will depend on your technical configuration. You have three possible configurations :   

1. If the project is included in the WAR you have to re-export the war file.
2. If you chose to detach the project from the WAR but did not activate the option to automatically reload modified pages you have to restart the web portal
3. If you chose to detach the project from the WAR and activated the option to automatically reload modified pages you have to refresh the page   

You can find the type of configuration used in your context in the Web portal and Export tabs of your technical configuration.

# Remarks

You should note that, as each search page depends on a different initial component if you change the displayed columns for the advanced Identity search, these changes will not apply to the advanced group search. The modifications have to be done for each initial component.
