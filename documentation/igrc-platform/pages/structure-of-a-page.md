---
layout: page
title: "Structure of a Page"
parent: "Pages"
grand_parent: "iGRC Platform"
nav_order: 3
permalink: /docs/igrc-platform/pages/structure-of-a-page/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

In the Pages language all the elements are declared as objects. Objects are declared following the syntax:   

```
objectIdentifier = ObjectType {
    attribute: "Value"
}
```

There are many types of objects that we will cover in this and the following pages. Some of them:   

**Pages** are the main containers, they represent one page in the webportal and their identifier must be unique in the whole project. Pages is the object with the biggest scope and can contain many objects.   
**Parameters** , **Variables** , **Datasets** and **Records** are objects with a limited scope. Their identifiers must be unique in the page that contains them.   
**Widgets** don't require an identifier, they are objects that represent elements inside a page. They will be rendered and displayed.   

# Page Object

A page is declared in the following way:   

```
nameOfThePage = Page {
    title: "Title of the page"
}
```

This declares a Page object with the name or identifier **nameOfThePage**, the identifier must be unique in the whole project and it will be used to create links to this page.   

A page can have many attributes , but only 1 is required: title. To browse the list of attributes supported by the language, we can always use the autocompletion as a guide. Using the key combination **Ctrl + Space**  will show a list of possible keywords or objects to include:   

![Page Object]({{site.baseurl}}/docs/igrc-platform/pages/images/0301.png "Page Object")   

# Objects in a Page

After the attributes, the page will contain objects organised in **blocks** following this structure:   

![Objects in a Page]({{site.baseurl}}/docs/igrc-platform/pages/images/0302.png "Objects in a Page")   

All the blocks are **optional**  but they must be declared in that fixed order

# Import Block

The import block is a very particular block. It can be used to reference another file with resources that can be reused. The syntax is as following:   
`import "/webportal/pages/resources/mappings.page"`

# Hello World Page

A minimal hello world page will look like this:   

```
nameOfThePage = Page {
 title: "Hello Word Page"
     homepage-for: All priority 100000

 Text {
 value: "Hello World !!"
 compact: True
 }
}
```

We are using the Text widget to display a message.

# Things to Remember

- The identifier of each page <u>must be unique</u> in the project. Duplicated identifiers will cause errors when the webportal is started
- **Ctrl + Space** will activate the autocompletion
- **Ctrl + Clic** on some references will jump to the definition (other page, view, ...)
- Blocks of objects must be declared in the defined order: Parameters, Variables, Data-binding and Widgets
