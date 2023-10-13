---
layout: page
title: "Anonymize personal data (right to be forgotten GDPR )"
parent: "Components"
grand_parent: "Workflow"
nav_order: 11
permalink: /docs/igrc-platform/workflow/components/anonymize-personal-data/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

The 'Anonymization' workflow activities introduced in the product as of version 2017 R3, as it says allows the anonymization of personal data of users managed in product. This feature has been implemented in order to be compliant with the right to be forgotten as defined in the GDPR.  

# Attribute to anonymize

The activity allow to anonymize information stored in identity and owned accounts objects, it is possible to customize what attributes to anonymize through the project configuration.   

![Attribute to anonymize](../images/2018-05-22-17-52-12.png "Attribute to anonymize")         

### Identity

By clicking on "Set default", default identity attributes will be added to the list, default attributes are: nickName, givenName, middleName, surname, altName, fullName, mail, phone, mobile.

### Account

By clicking on "Set default", default account attributes will be added to the list, default attributes are: givenName, surname, userName, mail.

### Additional attributes

In addition to identity and account attributes there are other personal data attributes that will automatically be modified. These include reconciliations, delegations and the Workflow tickets.

# Anonymization component  

![Anonymization component](../images/2018-05-22_17_53_39-iGRC_Properties_-_demo_workflow_custom_anonymization.workflow_-_iGRC_Analytics.png "Anonymization component")         

Anonymization activity requires as an input the variable containing the list of identities(uid) to be anonymized.   
The procedure will modify the personnal data of the designated users on all timeslot (Portal and History).    

![Anonymization component](../images/2018-05-22_17_55_32-iGRC_Properties_-_demo_workflow_custom_anonymization.workflow_-_iGRC_Analytics.png "Anonymization component")         

This workflow is available for download in the Marketplace and ready for use with a page that allows to execute the anonymisation from the web portal: [here](https://marketplace.brainwavegrc.com/package/bw_gdpr_anonymisation/)   

By default, you need to have the role igrc\_administrator to access to this page from your admin menu.  

A complete documentation is also available for download attached to this page.  

# Download files

[Brainwave identity GRC - GDPR anonymisation V1.0 EN](https://download.brainwavegrc.com/index.php/s/jYPQTP69pnn3ag5)
