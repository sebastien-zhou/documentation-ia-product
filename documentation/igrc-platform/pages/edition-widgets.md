---
layout: page
title: "Edition Widgets"
parent: "Pages"
grand_parent: "iGRC Platform"
nav_order: 16
permalink: /docs/igrc-platform/pages/edition-widgets/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

Edition Widgets are generally linked to a variable.   

They will display the value of the variable, but they will also allow to user to interact and modify its value.   

![Edition Widgets ](igrc-platform/pages/images/1601.png "Edition Widgets ")        

# Edit

For string variables:   

```
Edit {
 variable: pageVariable
 label: "Edit Example"
}
```

![Edit](igrc-platform/pages/images/1603.png "Edit")        

# Combo

For string variables in a combobox. Here the values come from a list (static or dataset).   

```
Combo {
 variable: selectedIdentityUid
 label: "Combo Example"
 options: Dynamic {
 data: sourceData
 text: Current fullname
 value: Current uid
 }
}
```

![Combo](igrc-platform/pages/images/1604.png "Combo")        

# DateTime

For Date variables:   

```
DateTime {
 variable: dateVariable
 type: Date
}
```

![DateTime](igrc-platform/pages/images/1605.png "DateTime")        

# Checkbox

For a boolean variable:   

```
Checkbox {
 variable: booleanVariable
 label: "Checkbox Example"
}
```

![Checkbox](igrc-platform/pages/images/1606.png "Checkbox")        

# RadioButtons

For limited options:   

```
RadioButtons {
 variable: pageVariable
 label: "RadioButtons Example"
 Option {
 text: "Yes"
 value: 1
 }
 Option {
 text: "No"
 value: 0
 }
 Option {
 text: "Maybe"
 value: 3
 }
}
```

![RadioButtons](igrc-platform/pages/images/1607.png "RadioButtons")        

# Scale

For integer variables:   

```
Scale {
 variable: pageVariable
 label: "Scale Example"
 minimum: 0
 maximum: 100
 increment: 10
 show-value: Right
}
```

![Scale](igrc-platform/pages/images/1608.png "Scale")        

# Spinner

For integer variables:   

```
Spinner {
 variable: pageVariable
 label: "Spinner Example"
 minimum: 0
 maximum: 100
 increment: 10
}
```

![Spinner](igrc-platform/pages/images/1609.png "Spinner")        

# MultiEdit

For multivalued variables :   

```
MultiEdit {
 add-dialog: identityPicker returning outDisplayname
 buttons-presentation: Icon
 Element {
 variable: multivaluedVariable
 }
}
```

![MultiEdit](igrc-platform/pages/images/1610.png "MultiEdit")        

# Upload

To upload files:   

```
Upload {
 variable: pageVariable
 hide-comment: True
 show-controls: True
}
```

![Upload](igrc-platform/pages/images/1611.png "Upload")        
