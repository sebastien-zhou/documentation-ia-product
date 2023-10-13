---
layout: page
title: "Starting and ending points"
parent: "Principles of operation"
grand_parent: "Operation of the collector engine"
nav_order: 4
permalink: /docs/igrc-platform/collector/collector-engine-operations/principles-of-operation/starting-ending-points/
---
---
A collector line must define the primary source as a starting point. Otherwise, the collector line cannot be run. A collector line can only contain one starting point, and this starting point is always a source.   
A collector line may consist of several paths, each ending with a filter or a target. It is quite normal to have multiple terminals components (without outgoing transitions) in a collector line. A single ending point is not necessary.   
An ending point should only be defined in two cases:   

- when the collector line is called by another collector line.
- when the collector line is packaged as a source component or filter.

A single ending point may be defined in a collector line. The ending point does not mean that the collector stops when the component with the ending point is reached. The collector engine totally ignores the ending point when it is running the line. The ending point is only useful when a collector line is called by another collector line, packaged as a component or not. In this case, the datasets of the sub-collector line must go back to the main collector line. The ending point designates the component which gives its datasets to the calling line. Another way to understand the ending point is to imagine a virtual transition starting from the component and carrying the ending point towards the component of the calling collector line.
