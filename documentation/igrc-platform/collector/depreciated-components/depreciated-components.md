---
layout: page
title: "Depreciated Components"
parent: "Data Collection"
grand_parent: "iGRC Platform"
has_children: true
nav_order: 5
permalink: /docs/igrc-platform/collector/depreciated-components/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Depreciated sources

Historically when developing a data collector line the only sources available were the following.

- Formatted source
- LDIF source
- Excel Source
- XML source
- CSV source

These sources only allowed the user to collect the raw data from the source file. All post processing actions had to be done in the collector line.   
In order to bypass this limitation a new source was created to replace all above mentioned sources: the filtered source (discovery).   

As a result, these sources remain in the product for compatibility reasons, however it is **highly** recommended to use a Filtered source.   

Please see the Filtered source description for more details.

# File enumerator (facette)

The files enumerator source is delivered with the files enumerator facette.   
This facette allows the user to iterate on a number of input files in a collector line, different LDIF files corresponding to different domains, for example.   
This facette was developed before the addition of silos in the version 2015 that included this functionality by default in the product.   
As a result, this source remains in the product for compatibility reasons, however if you wish to iterate over input files it is highly recommended to use the iteration capabilities of silos :  

![Silo iteration](igrc-platform/collector/depreciated-components/images/silo-iteration.png "Silo iteration")

# SOD control target

This target is deprecated. It is recommended to use both SOD matrix target and SOD matrix permission pair target to create SOD controls.   
This deprecated target was used to generate a project file (a .control) for each matrix cell. The new SOD matrix targets share the same goal but the matrix cells are stored in the Ledger.  
