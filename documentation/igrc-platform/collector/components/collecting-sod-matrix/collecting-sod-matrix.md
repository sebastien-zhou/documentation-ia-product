---
layout: page
title: "Components : Collecting Sod Matrix"
parent: "iGRC : Collector-Components"
grand_parent: "iGRC : Collector"
nav_order: 4
permalink: /docs/igrc-platform/collector/components/collecting-sod-matix/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

This document describes how SoD Matrix are collected in Brainwave iGRC. Usually, SoD matrix are maintained in organization in different Excel sheets in specific format where each SoD rules is relative to an incompatibility of a rights/permission vs another one.

The traditional format for such matrix in external Excel sheets usually use pivot table:

![Pivot table](igrc-platform/collector/components/collecting-sod-matrix/images/SoD_Pivot_Table.png "Pivot table")   
> > > > > > Figure 1: SoD Pivot table example

Brainwave iGRC data model concept integrates the two following SoD concepts:   

- SoD Matrix (with a identifier, a name, a description)  
- SoD permission pair (attached to an existing SoD Matrix, and referencing a pair of two incompatible permissions).

The SoD Matrix and permission pair generates standard control discrepancies.

# Prerequisites

Brainwave iGRC 2016 R2

# Procedure

In order to define SoD Matrix, an additional target is available in collector palette:

![Collector palette](igrc-platform/collector/components/collecting-sod-matrix/images/SoD_Palet1.png "Collector palette")   

The SOD matrix target creates a new matrix in Brainwave data model:

![SOD matrix target](igrc-platform/collector/components/collecting-sod-matrix/images/SoD_Collect1.png "SOD matrix target")   


![SOD matrix target](igrc-platform/collector/components/collecting-sod-matrix/images/SoD_Collect2.png "SOD matrix target")   

In order to define SoD rules, an additional target is available in collector palette:

![Collector palette](igrc-platform/collector/components/collecting-sod-matrix/images/SoD_Palet2.png "Collector palette")   

This target add new SoD rules in an existing SoD matrix:

![SoD matrix](igrc-platform/collector/components/collecting-sod-matrix/images/SoD_Collect4.png "SoD matrix")   

A rule has to be inserted in an existing SoD Matrix. This rule references first permission incompatible with a second one:

![SoD matrix](igrc-platform/collector/components/collecting-sod-matrix/images/SoD_Collect3.png "SoD matrix")   

Additional information can be added for each risk:

![Parameters](igrc-platform/collector/components/collecting-sod-matrix/images/SoD_Collect5.png "Parameters")   

Some SoD componants can be used in views to list information regarding collected SoD Matrix and SoD rules (permission pairs):

![SoD view](igrc-platform/collector/components/collecting-sod-matrix/images/SoD_View1.png "SoD view")   

# Example

The attached SODsample.facet includes an example of SoD rules collect, and SoD matrix report.

- importfiles/SOD/SOD\_example.xlsx (excel sheet including some sample SoD rules)
- discovery/SOD/SOD.discovery (excel sheet discovery)
- collectors/SOD/SOD.collector (SoD Matrix and rules collect)
- collectors/SOD/SOD.javascript
- views/custom/SOD/SOD\_matrix.view (view to retrieve SoD matrix information)
- reports/custom/SOD/SOD\_matrix.rptdesign (sample SoD matrix report)

# Downloads

[SODsample.facet](https://download.brainwavegrc.com/index.php/s/yLDsAFYBxAfDmqb)
