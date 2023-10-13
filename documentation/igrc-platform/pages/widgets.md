---
layout: page
title: "Widgets - Introduction"
parent: "Pages"
grand_parent: "iGRC Platform"
nav_order: 11
permalink: /docs/igrc-platform/pages/widgets-into/
---
---

Widgets objects can be found in the widget block of a page. They don't require an identifier, so the syntax to include them is simply:   

```
Widget {
  attribute: value
}
```

All the elements of a page are widgets that are rendered to be displayed or to interact with the users.    
They can be used to display information that was retrieved using the datasets and can also interact with the user to allow them to select items and more.   
We have many widgets available, they have been classified by their main purpose into 4 categories:   

- [Container widgets]({{site.baseurl}}{% link docs/igrc-platform/pages/containers-widgets.md %})
- [Display widgets]({{site.baseurl}}{% link docs/igrc-platform/pages/display-widgets/display-widgets.md %})
- [Selection widgets]({{site.baseurl}}{% link docs/igrc-platform/pages/selection-widgets.md %})
- [Special widgets]({{site.baseurl}}{% link docs/igrc-platform/pages/special-widgets.md %})

The configuration of the widgets is done basically by providing values to a list of attributes. Some of them have available a very specific list of attributes, but there is also some attributes that can be used with almost all widgets. This is what we consider the list of [commons attributes]({{site.baseurl}}{% link docs/igrc-platform/pages/widgets-common-attributes.md %}).
