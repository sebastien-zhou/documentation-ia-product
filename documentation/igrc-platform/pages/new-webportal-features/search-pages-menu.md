---
layout: page
title: "Search Pages Menu"
parent: "New Webportal Features"
grand_parent: "Pages"
nav_order: 6
permalink: /docs/igrc-platform/pages/new-webportal-features/search-page-menu/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# What is New in the Search Pages Menu?

The Search Pages Menu has also been rewritten in order to be more dynamic. It takes advantage of the new [tagging system](igrc-platform/pages/new-webportal-features/tagging-system-for-pages-and-reports.md).

# How to customize it?

The new Search Pages Menu searches for pages or reports tagged using the default tags. In order to be properly displayed they should comply with the requirements.

# What are the Default Tags?

The Search Pages Menu uses the following tag:   

| **Set of Tags** | **Description** |  **Priority** |
|  "**conceptsearch**" | This includes pages or reports that have as main goal the search of concepts. For example: search of sharepoint elements .  | Priority is used to set the order of the buttons in the menu. It starts in 50 and finishes in 550 using increments of 50. |

It is compatible with the tags used in the [General Menu](igrc-platform/pages/new-webportal-features/general-menu-of-the-home-pages.md).

# What are the Requirements?

- The **description** field must be used since it will contain the text to be displayed in the button. The good practice being to keep this short. Example: Sharepoint. The **title** is not used in the Search Pages Menu to allow compatibility with the [General Menu](igrc-platform/pages/new-webportal-features/general-menu-of-the-home-pages.md).
- The **largeIcon** filed must be declared. It should be an image with size of 48px. It is recommended to follow the look-and-feel
- Search Pages must not expect to receive any parameter.
