---
layout: page
title: "Manual reconciliation"
parent: "Reconciliation rules"
grand_parent: "Reconciliation"
nav_order: 5
permalink: /docs/igrc-platform/reconciliation/reconciliation-rules/manual-reconciliation/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

The result details interface lets you intervene dynamically in the account reconciliation. It is possible to perform manual reconciliation operations on accounts that were not reconciled. This operation is done from a rule result or from the Ledger.

# Manual reconciliation from a rule result

It is possible that a reconciliation rule does not reconcile an account with an identity. This is generally the case with service accounts, accounts belonging to people who have left the company or whose owner identity has changed surname, first name, etc. By selecting the account, you can perform various operations:

## Account owner update

Click on the ![Icon](../images/reconciliation-rule-01.png "Icon") icon located on the right side of the screen. This command allows you to reconcile the account with its owner identity that you select by replacing the criteria search field or by double clicking directly on the identity name.

![Selecting an owner identity of an account](../images/worddava37529e872f8cd71b81c7e77f34f4f32.png "Selecting an owner identity of an account")   

You can add a description to the account reconciliation in the comment field.

![Adding a comment](../images/worddavcee8c2ac725e25825766edcfb2fc40ac.png "Adding a comment")   

You can display the results of your reconciliation by using the **"Only reconciled accounts"** filter on the **'Ledger'** screen .   

## Mark account as ownerless

Click on the ![Mark account as ownerless](../images/2016-07-11_09_59_30-iGRC_Properties_-_demo_reconciliation_demo_AD_fullname.reconrule_-_iGRC_Analytic.png "Mark account as ownerless") icon located on the right side of the screen. This command allows you to mark an account as a service account.  

![Reconciliation of an ownerless account](../images/worddavd7808f3213d48c272e6f3a199e592155.png "Reconciliation of an ownerless account")     

## Mark account as belonging to a leaver

Click on the icon ![Mark account as belonging to a leaver](../images/2016-07-11_10_18_24-iGRC_Properties_-_demo_reconciliation_demo_AD_fullname.reconrule_-_iGRC_Analytic.png "Mark account  as belonging to a leaver"). 
This command allows you to mark an account belonging to someone who has left the company.   

![Confirmation of an account belonging to a leaver](../images/reconciliation-rule-02.png "Confirmation of an account belonging to a leaver")     
## Delete account reconciliation 

You can delete a reconciliation by using the icon ![Delete account reconciliation ](../images/2016-07-11_10_21_44-iGRC_Properties_-_demo_reconciliation_demo_AD_fullname.reconrule_-_iGRC_Analytic.png "Reconciliation of a Delete account reconciliation ") located on the right of the ledger tab.    

![Delete account reconciliation](../images/worddavfcff7e11191be34b6329f1bb652db35c.png "Reconciliation of a Delete account reconciliation")     


---

<span style="color:grey">**NOTE:**</span> A reconciliation rule can, in some cases, bring up multiple identities for the same account (for example with perfect homonyms). In this situation you can intervene manually on the account in order to reconcile the correct identity in the **'Rule'** sub-tab..

---

# Manual reconciliation from the Ledger

It is possible to manually reconcile an account from the Ledger. You have to activate the iGRC Ledger view and click on the **"Account"** tab to make the list of all the accounts appear. By double clicking on an account, you can perform the same operations as in the **"Manual reconciliation from a rule result"** section.      

![Manual reconciliation from the Ledger](../images/worddavdaf81c08b9f72fff60764e895389058d.png "Manual reconciliation from the Ledger")       
