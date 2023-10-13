---
layout: page
title: "SOD matrix target"
parent: "Components :Targets"
grand_parent: "Components"
nav_order: 21
permalink: /docs/igrc-platform/collector/components/targets/sod-matrix-target/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This target is used to save a SOD matrix in the Ledger. This matrix can be seen as a table with permissions in rows and columns. Each cell is an SOD control between the permission in row and the permission in column. If this cell is filled with all the SOD details, it means that an identity can not have both permissions. All identities having both permissions are considered as discrepancies.    
This target can be used to create a matrix and then, for each pair of toxic permissions, the SOD matrix permission pair target sould be called.  

# The properties Tab

Creating a SOD matrix is very easy. The name (a unique identifier) and the display name are enough to build a SOD matrix in the Ledger.   
Optionnaly, you can add some 9 custom values and a type of matrix used only in application views (the product does not read this attribute to generate SOD discrepancies).  

# Best practices

Use both the SOD matrix target and SOD matrix permission pair target instead of the deprectated SOD control target. This deprecated target was used to generate a project file (a .control) for each matrix cell. The SOD matrix targets share the same goal but the matrix cells are stored in the Ledger.

# Error handling

If the matrix already exists, the target does nothing.
