---
layout: page
title: "Reconciliation rules"
parent: "Reconciliation"
grand_parent: "iGRC Platform"
nav_order: 1
has_children: true
permalink: /docs/igrc-platform/reconciliation/reconciliation-rules/
---

The reconciliation rule engine is based on the data contained in the Ledger. The principle of a reconciliation rule is to find items in the Ledger that make it possible to make a link between an account and its user. For example: 

- Which identity does the account whose login is the same as the login of a user belong to?
- Who does the account belong to whose standardized name resembles the name of the user?
- Which is the identity that owns the account whose login starts with the first letter of the first name followed by the surname of a user?
- etc.   

A reconciliation rule is configured by combining a series of criteria based on the Ledger's identity concept, a bit like a question. The rule returns the list of item identifiers that answer the question asked.    
Please note that the software is capable of generating appropriate reconciliation rules by itself. For more details please go to the **Automatic generation of reconciliation rules** section of this document.
