---
layout: page
title: "Config variable"
parent: "Macros et scripts"
grand_parent: "Collector"
nav_order: 2
permalink: /docs/igrc-platform/collector/macros-and-scripts/config-variable/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

The `config` variable is available when running the collector line, and contains all the configuration values of the line and of the project configuration. All the configuration settings are present in the `config` object and accessible as properties. Values are always `String` types.   

These settings affect the behavior of the collector line. They allow us to avoid the presence of hard-coded values such as file names in the collector line settings. For example, for a CSV source, the `CSVfile` field may be filled with a macro instead of hard-coding `C:\data.csv`, as shown in the following example:   

`{config.csvfile}`   

The `csvfile` setting is declared in the collector line with `C:\data.csv` as its value.   

A configuration setting may be declared at the project level or at the collector line level. If a setting with the same name is declared on both levels, the collector level setting is used. This allows you to set a default value at the project level and override it in a collector line.   

The `config` variable is also present in scripting:  

`print(config.csvfile);`

There are two properties automatically filled in in the `config` variable:

- `projectPath`: is the absolute path of the project.
- `databaseName`: is the name of the database configuration.
