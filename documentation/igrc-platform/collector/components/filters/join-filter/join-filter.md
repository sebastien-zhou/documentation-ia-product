---
layout: page
title: "Join filter"
parent: "Components : Filters"
grand_parent: "Components"
nav_order: 4
permalink: /docs/igrc-platform/collector/components/filter/join-filter/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Usage

This property allows to join two sources, in order to obtain a dataset containing information from both sources.  

![Join diagram]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/join-filter/images/join_diag.png "Join diagram")   

It has two distinct modes of operation (cache is enabled or not) which are detailed in the section Operating mode below.  

# The properties Tab

## Filter

In this tab you can see/modify general parameters of the component. You will find the following:

- _Identifier_ (shown in Debug mode for example)
- _Display name_ for the _Join filter_
- _Follow just one link_ option which sets the transition mode. If it is checked, only the first transition with an activation condition evaluated to true will be executed. If it is unchecked, all transitions with an activation condition evaluated to true will be executed.

![Join1]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/join-filter/images/join1.png "Join1")   

## Description

This property allows adding comment regarding actions done by this component.

![Join2]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/join-filter/images/join2.png "Join2")   

## Source

This property allows to select which one of the two attached sources is the secondary one, i.e. the source used to augment the dataset.  

![Join3]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/join-filter/images/join3.png "Join3")   

## Attributes

This property allows to map attributes of the secondary dataset to attributes of the main dataset.  

![Join4]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/join-filter/images/join4.png "Join4")   

For example, in this case, the _name_ attribute of the secondary source (_discoverysource - company_) will be added to the main dataset under the name _company\_name_.  

## Policy

This property allows to specify the behavior of the join when less than one or more than one records of the secondary dataset matches.  

![Join5]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/join-filter/images/join5.png "Join5")   

## Cache

This property allows to specify the behavior of the cache (see next section).

![Join6]({{site.baseurl}}/docs/igrc-platform/collector/components/filters/join-filter/images/join6.png "Join6")   

# Operating modes

## With cache activated

When the cache is active, you need to specify both the _Key attribute from main dataset_ and the _Key attribute from secondary dataset_ whose values will then be matched by equality. The secondary source is iterated once and the key and corresponding dataset are kept in a cache. When the main source records are retrieved, the cache is examined to see if there exists a corresponding dataset (less than one or more than one matches are handled accordingly to the _Policy_ property described above). If such a dataset is found, the main and secondary datasets are merged according to the _Attributes_ property described above.  

## With cache deactivated

When the cache is not active, for each record of the main source, the secondary source is fully iterated, each records being merged to the main dataset according to the _Policy_ and _Attributes_ property. In the secondary source, you should provide a _SQL syntax request_ in the _Request_ property. In this request, the attributes of the main dataset are available under the _param_ namespace.  
For example, the request    
`SELECT * FROM dataset WHERE dataset.id LIKE UPPER(param.id) + '%'`

in the secondary source will match when the _id_ attribute of the main source (_param.id_) is "_acme"_ and the _id_ attribute of the secondary source (_dataset.id_) is _"ACME123_".  

# Best practices

The cache should <u>always</u> be enabled as the performance impact of its deactivation is severe (the secondary source is iterated for each dataset of the main source). If you have complex matching rules, for example matching on more than one attributes, it will always be more efficient to activate the cache and use computed attributes (either at the discovery level or using an update filter) as the matching attributes.  
