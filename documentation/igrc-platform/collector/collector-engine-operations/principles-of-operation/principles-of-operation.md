---
layout: page
title: "Principles of operation"
parent: "Operation of the collector engine"
grand_parent: "Collector"
has_children: true
nav_order: 1
permalink: /docs/igrc-platform/collector/principles-of-operations/
---
---

A collector line consists of a sequence of components. A component is a processing unit in charge of performing a specific task. The product provides about twenty components as standard, but it is possible to add others without any programming to extend the features of the collector engine.   
The components are interconnected through directed transitions which signal the direction of data flow. The collector engine behaves like a sequencer which requires the source to read a record from the file and passes the record to the next component in accordance with the transitions, until the last component, which has no outgoing transition.   
A collector line always consists of a primary source. If we need to aggregate data from multiple sources, secondary sources may be implemented with joins but their operation is controlled by the primary source.   
Since the objective of the collector is to provide data to the ledger, a collector line generally includes one or more target components, each dedicated to providing a concept. It is quite normal to include multiple targets in a collector line. For example, if the LDIF export of the Active Directory is used as the source for accounts and identities, the collector line can serialize a target identity and target account.
