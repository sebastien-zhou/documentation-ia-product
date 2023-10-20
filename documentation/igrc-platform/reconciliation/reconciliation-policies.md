---
layout: page
title: "Reconciliation policies"
parent:  "Reconciliation"
grand_parent: "iGRC Platform"
nav_order: 2
has_children: true
permalink: /docs/igrc-platform/reconciliation/reconciliation-policies/
---

When creating a reconciliation rule, it is not known for which repository it applies. It is only in the Result tab of the rule editor that you can filter by repository name to view the accounts that have been reconciled there.     
The reconciliation policy allows you to define, for each reconciliation rule, the repository in which it must be executed.   
This way the reconciliation policy allows you to globally define the reconciliation operations to perform, repository by repository. Once a reconciliation policy is configured, it can be referenced in the execution plan and be automatically executed on new orphan accounts on each data load.  

---

<span style="color:red">**Important:**</span> Please note that reconciliation policy can be resource consuming depending on complexity of the reconciliation rule used and also on number of account criteria within the rule.

The first stage in the reconciliation is used to set the cache up with the data used to be used. It is possible fot the progress bar to appear stuck before the account reconciliation is started.

---