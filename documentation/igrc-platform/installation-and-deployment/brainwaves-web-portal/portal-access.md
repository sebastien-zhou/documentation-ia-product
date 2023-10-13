---
layout: page
title: "Portal Access"
parent: "Brainwave's web portal"
grand_parent: "Installation and deployment"
nav_order: 7
has_children: true
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Global principles

To login as a user in the Brainwave's portal, it needs to retrieve a Principal provided by the Tomcat server hosting the Portal.

Basically, this Principal is a structure containing:

* An identifier for the user, typically a `samaccountname` or a `login`
* A list of roles

More information can be found about the Principal [here](https://tomcat.apache.org/tomcat-8.0-doc/api/org/apache/catalina/realm/GenericPrincipal.html).

Retrieving all of the above informations to build the Principal is the Tomcat's work and depends on the configured authentication/authorization mechanism.

In all cases, the final goal is to:

* Authenticate & Authorize the user
* Build the Principal (i.e. retrieve user login and user static roles)
* Pass it to the Portal (Brainwave webapp hosted by the Tomcat)

From this Principal, the Portal will be able to:

* Check the existence of the user in the Ledger
* Determine his roles
* Allow the navigation to allowed resources

![Portal Identity view](../images/portal_authentication_authorization_sequence.png)

# AuthN/AuthZ mechanism

When integrating **Brainwave Identity GRC** in your environment, you will be faced with the **authentication** topic:  

* How to authenticate your web users?  
* What is/are the valid identity sources?  

**AuthN** mechanism of Portal users is delegated to Tomcat (aka the container) by implementing and configuring [JAAS](https://docs.oracle.com/javase/7/docs/technotes/guides/security/jaas/JAASRefGuide.html) Tomcat service.

Depending on the AuthN repository, it can be:

* A database
* An LDAP directory
* A flat file (not recommenced, to be used in DEV purposes only)

The AuthN mechanism can rely on several protocols to communicate with the AuthN repository:

* SAML
* LDAP
* JDBC

**AuthZ** mechanism rely on the `role` notion (aka container role). These roles are set after the AuthN step. They are obtained using the authorization process, which can be the same as the authentication one, statically or dynamically.

Dynamic roles are set using business rules based on data from Ledger and are **prioritized** over static roles.

> Note: The `user` role is mandatory to access the Portal.

Apache foundation provides standards Tomcat components to authenticate and authorize. Brainwave exploits some of them:

* [Basic form]({{ site.baseurl }}{% link docs/igrc-platform/installation-and-deployment/brainwaves-web-portal/portal-access/basic.md %})
* [LDAP]({{ site.baseurl }}{% link docs/igrc-platform/installation-and-deployment/brainwaves-web-portal/portal-access/ldap.md %})
* [SAML]({{ site.baseurl }}{% link docs/igrc-platform/installation-and-deployment/brainwaves-web-portal/portal-access/saml.md %})
* [HTTP Headers]({{ site.baseurl }}{% link docs/igrc-platform/installation-and-deployment/brainwaves-web-portal/portal-access/http-headers.md %})

# Portal Identity

Once the user is authenticated and the Principal is built and sent to the Brainwave webapp, the next step is to check the existence of the user in the Brainwave Ledger.

To do so, from the `Principal`, the login is passed on to the view defined in the `user.principal.view` property in the technical configuration's `webportal` tab (`br_portalidentity` by default).

![Portal Identity view](../images/portal_identity_view.png)

This view is used to retrieve the **Identity** associated to the **Account** returned from the `Principal login`, so that the dynamic roles can be computed (roles are based on identities, not accounts), according to role configuration (see .role files), and added to the list of static roles contained in the Principal.  

Notes:  

* This can be a business view;  
* If multiple identities are returned, the first one is kept (__not recommended!__).  
* The fields returned by this view can be used in Pages, using `Principal.fieldname`.  

> `preferredlanguage` contains the user's language (either collected or set via the settings in the portal).  

# Features & Roles

Once the user Identity is retrieved from the Portal Identity view, the next step is to determine **dynamic roles** (**static** roles are granted accordingly to the configured access).

To do so, the role configuration declared in the project will be used (located under `/webportal/features` folder).

All **dynamic** roles are linked to a `Rule` defined in the `Identities in role` field which determines a list of Identities based on a specific rule (for example, all `Identities` which are `Managers` of an `Organization`).

![Role configuration](../images/portal_roles_configuration.png)

![Dynamic Role Rule](../images/portal_dynamic_role_rule.png)

If the Identity is contained in the list returned by the Rule, the dynamic role is granted to the user.

> Notes: A dynamic role is **prior** to a static role. It means that, if a role can be determined statically (i.e. from the Tomcat) and dynamically (i.e. from Brainwave configuration), the dynamic configuration is applied.

Once dynamic roles are determined, this list is concatenated to the static user roles list and the user is allowed to navigate on the Portal, through all allowed resources (`Pages` and `Widgets`) according to **Features** granted by his **Roles**.

![Portal Identity view](../images/portal_roles_and_features.png)

More information about Roles and Features can be found [here](https://documentation.brainwavegrc.com/Braille/docs/igrc-platform/pages/features-and-roles//).