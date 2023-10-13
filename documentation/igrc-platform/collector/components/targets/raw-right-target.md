---
layout: page
title: "Raw right target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 23
permalink: /docs/igrc-platform/collector/components/targets/raw-right-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# usage

Each software vendor has designed a different security model for their applications. And even if looking at a single vendor, all applications do not share the same security model. For example, Microsot Sharepoint security model is completely different than the Share folder security model which is based on ACL with positive and negative rights and inheritance. Microsoft Exchange uses another security model, etc.    

The Brainwave model incorporates all application security models into a unique and generic model using the concepts of repository, accounts, groups, permissions, applications and rights. You can consider that these rights are part of the 'compiled' model. It means that these rights are the results of what people have. But in the real application, the rights may appear differently. To illustrate this difference, we can have a look at ACL for Fileshare.     

The security model for a Fileshare is to set ACL on folders. An ACL is a list of allowed or denied rights. Each right is an allowed or denied action for a given account or group. ACL are collected in Brainwave model using the FIleshare taget and goes into ACL tables. This is the exact snapshot of the fileshare security model with positive and negative rights, propagation, inheritance flags, etc. During the activation step, the Brainwave product examine all the ACL and compile them to produce positive rights between groups or accounts and folders. This is useful to answer quickly to the following question; What are the folders readable by John Doe. When answering this question, the product reads the rights in the Leger, not the ACL. ACL are only used and displayed when the user wants to understand the root cause (why John Doe has an access to the "Billing" folder). In the compiled version, there are no more negative rights. The other difference is that the goal of the right is to have a link between an account and a permission regardless how this link was in the original security model. For example, in the Fileshare, John Doe may belong to several groups giving access to the "Billing" folder. But this information is the root cause (stored in ACL tables). The right table contains a single link which is enough to display in a page or a report that he has access to the folder.   

In the world of data (for example FileShare) ACL are raw rights used for root cause to display the exact information found in the application and rights are the Brainwave compile rights used in views, rules and controls. Raw rights are like ACL in the world of role based application. When an application has a complex security model, this model is stored without any modification in the raw right table using this target. But using this target does not populate automatically the 'compiled' rights because the product does not know how to transform the raw right model into a compiled right model. So, in any case, the standard right target should be used to store the compiled and simplified version of the rights.  

# The properties Tab

The properties of a raw right target are exactly the same as the right target. The only difference is that the raw right target accepts a new property called 'negative right' which is a boolean (true for negative and false for positive).   

Like in the right target, the permieter is optional.  

# Best practices

The raw right target can be used anytime, not only when there are negative rights in the application. Each time the compile model looses information, the raw rights can be used to store the complete application security model to display the most accurate information as root cause in the portal.  

# Error handling

An error is raised if the application code is not found.   
If the permission is not found or the account is not found, the target does nothing.  
