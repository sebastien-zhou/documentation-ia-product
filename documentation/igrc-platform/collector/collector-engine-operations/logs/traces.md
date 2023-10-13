---
layout: page
title: "Traces"
parent: "Logs"
grand_parent: "Operation of the collector engine"
nav_order: 2
permalink: /docs/igrc-platform/collector/collector-engine-operations/logs/traces/
---
---

The implementation of the collector line generates relatively verbose traces in a file. The purpose of these traces is to be able to find the context if a functional problem occurs in the collector line. For this, a turning file mechanism is used, with only two files. Once a file is full, it is renamed and a new file is created.   
With this mechanism, if the collector line processes many records during runtime, the traces from the beginning of runtime are lost. But the purpose of these traces is not to reconstruct everything that has happened since the beginning of runtime, but to have the traces of the latest processes performed on the latest datasets. This allows us to reconstruct the context if a problem occurs and to understand the causes.
