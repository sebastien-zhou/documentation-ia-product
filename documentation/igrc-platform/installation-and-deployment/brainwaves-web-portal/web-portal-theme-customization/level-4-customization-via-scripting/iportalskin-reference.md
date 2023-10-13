---
layout: page
title: "IPortalSkin java reference"
parent: "Level 4 - Customizing the layout via Java coding"
grand_parent: "Web portal customization"
nav_order: 1
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Interface IPortalSkin

Public interface IPortalSkin    

This interface provides a contract for Brainwave custom skin classes base implementation: com.brainwave.portal.ui.skin.PortalSkinBase   


## Method Summary

| **Modifier and Type** | **Method and Description** |
| `void` | `compactHeader(boolean compact)`<br> expands / collapse the top header.|
| `void` | `createContent(org.eclipse.swt.widgets.Composite parent)` <br> this method is called to create the portal content: header, toolbar and page content area|
| `com.brainwave.portal.ui.utils.widgets.BreadCrumbBar` | `getBreadCrumbBar()` <br> an instance of BreadCrumbar to display the optional breadcrumbs for a page, at the top of the page area.|
| `org.eclipse.swt.widgets.Button` | `getErrorLogButton()` |
| `org.eclipse.swt.widgets.Button` | `getHeaderCompactButton()`<br> a two-state button (of type SWT.TOGGLE)<br>to hold that button that expands/collapse the top header|
| `org.eclipse.swt.widgets.Label` | `getHeaderTitle()` |
| `org.eclipse.swt.widgets.Control` | `getLoadingIcon()`<br> the icon that will dynamically hold the loading animated image.|
| `org.eclipse.swt.widgets.Button` | `getMainMenuButton()`<br>the burger button in the toolbar|
| `com.brainwave.portal.ui.visualization.navbar.INavBar` | `getNavBar()`<br>the navigation panel, which implements INavBar.|
| `org.eclipse.swt.widgets.Composite` | `getPageArea()`<br>a composite that will hold the selected content of the page, without the bread crumbs|
| `org.eclipse.swt.widgets.Button` | `getPermaLinkButton()` |
| `org.eclipse.swt.widgets.Button` | `getTimeslotLabel()`<br>The button that displays the name of the current timeslot, and allows selecting another timeslot |
| `org.eclipse.swt.widgets.Button` | `getUserBtn()`<br>the widget to display the name of the current user, <br>and a drop down menu.|
| `org.eclipse.swt.widgets.Control` | `getUserIcon()` |

## Method Detail

### createContent
```
void createContent(org.eclipse.swt.widgets.Composite parent)   

this method is called to create the portal content: header, toolbar and page content area   

**Parameters**:   

parent - : the container for the page,
```

### compactHeader
```
void compactHeader(boolean compact)   

expands / collapse the top header.   

**Parameters:**   

compact -
```

### getHeaderTitle
```
org.eclipse.swt.widgets.Label getHeaderTitle()   

**Returns:**   

the widget for the header title, or null if not present   
```

### getPermaLinkButton
```

org.eclipse.swt.widgets.Button getPermaLinkButton()   

**Returns:**   

the widget for the permalink button , or null if not present   
```

### getUserIcon
```
org.eclipse.swt.widgets.Control getUserIcon()   

**Returns:**   

the widget to hold the dynamic image of the user. Usually it's an icon button return null if not present    
```

### getUserBtn
```
org.eclipse.swt.widgets.Button getUserBtn()   

the widget to display the name of the current user, and a drop down menu. It's usually a Button   

**Returns:**   

the widget if present, or null if not present   
```

### getErrorLogButton
```
org.eclipse.swt.widgets.Button getErrorLogButton()
```

### getMainMenuButton
```
org.eclipse.swt.widgets.Button getMainMenuButton()

the burger button in the toolbar   

**Returns:**   

the widget or null if not present  
```

### getNavBar
```
com.brainwave.portal.ui.visualization.navbar.INavBar getNavBar()

the navigation panel, which implements INavBar. Two implementations are provided: HNavTabs and VNavTabs   

**Returns:**   

the widget, or null if not present   
```

### getLoadingIcon
```
org.eclipse.swt.widgets.Control getLoadingIcon()   

the icon that will dynamically hold the loading animated image. It's usually a Button widget   

**Returns:**   

the widget, or null if not present   
```

### getHeaderCompactButton
```
org.eclipse.swt.widgets.Button getHeaderCompactButton()   

a two-state button (of type SWT.TOGGLE) to hold that button that expands/collapse the top header   

**Returns:**   

the widget, or null if not present   
```

### getTimeslotLabel
```
org.eclipse.swt.widgets.Button getTimeslotLabel()   

The button that displays the name of the current timeslot, and allows selecting another timeslot   

**Returns:**   

the widget, or null if not present   
```

### getPageArea
```
org.eclipse.swt.widgets.Composite getPageArea()   

a composite that will hold the selected content of the page, without the bread crumbs   

**Returns:**   

the widget, or null if not present   
```

### getBreadCrumbBar
```
com.brainwave.portal.ui.utils.widgets.BreadCrumbBar getBreadCrumbBar()   

an instance of BreadCrumbar to display the optional breadcrumbs for a page, at the top of the page area.   

**Returns:**   

the widget, or null if not present
```
