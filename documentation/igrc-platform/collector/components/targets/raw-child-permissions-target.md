---
layout: page
title: "Raw child permissions target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 22
permalink: /docs/igrc-platform/collector/components/targets/raw-child-permissions-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

The raw child permision target is used to establish a link between 2 permissions in the raw security model. To understand the concepts behind the raw security model, please read the documentation for the raw right target.   
To define a raw security model the product provides the concepts of raw rights and raw permission links. Compared to rights, raw rights allows to define negative rights. Compared to permission links, raw permission links add several concepts like:  

- links between permissions of different applications are allowed  
- a perimeter can be attached to the link
- the link can be positive or negative
- a wave number (sort of link priority)

The behaviour of the raw permission link target is the same as the permission link target except that this target only accept monovalued attributes. If a permission has several children, you must enumerate the values containing the child permission codes and enter this target once per child.  

# The properties Tab

The properties are almost identical to the permission link target. Only the 'Hierarchy' tab is different to be able to specify the following attributes:   

- Attribute containing the application: it is the application to which the child permission belongs to. The product allows the link between a permission from application A to a child permission from application B. The application must exist in the Ledger otherwise the target will throw an exception  
- Attribute containing the direct sons: This is the attribute containing the child permission code. Beware that even if you give a multivalued attribute, only the first one will be used. The permission must exist in the Ledger otherwise no link is created (no error is thrown)  
- Permision perimeter: a perimeter code can be given to make a link with 3 concept (permission - permission - perimeter). The perimeter must exist otherwise the target throws an exception. Several links with the same permission pair may exist in the Ledger with a different perimeter.
- Negative links?: a boolean attribute containing true or false. This attribute is part of the link key. It means that the same permission pair can be store in the Ledger, one with a negative flag to true, one with a positive flag.
- Wave number: this is a number (no constraint on values) which can be used as a priority.  

It is important to understand that the product does not interpret, compile or analyse the raw rights and the raw permision links. Filling these information at collect time is for display purpose to show root cause or a real raw right.  

# Best practices

The raw permission link target can be used anytime, not only when there are negative rights in the application. Each time the compile model looses information, the raw rights and ram permission links can be used to store the complete application security model to display the most accurate information as root cause in the portal.

# Error handling

There are two situations where the target throws an error:  

- when the application code is not found
- when the perimeter code is not found  

If the permission codes are not found, the target exists without inserting any data in the Ledger.  
