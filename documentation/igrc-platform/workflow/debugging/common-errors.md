---
layout: page
title: "Common errors"
parent: "Debugging"
grand_parent: "Workflow"
nav_order: 1
permalink: /docs/igrc-platform/workflow/debugging/common-errors/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# org.activiti.engine.ActivitiIllegalArgumentException: duedate is null

If you have the previous error, you probably have a reminder set in the past. This means that the settings for reminders require more time than the actual task deadline allows. The above error "duedate is null" however might not be linked to the task where the reminder settings are incorrect. It is possible that the error concerns the previous task. The trick is then rather to look for the next task; that is the one that failed to be created (its reminders caused the error).

![Workflow error due date](../images/wf_error_duedate.png "Workflow error due date")   

In the example above, scpDateExpiration needs to be at least 6 days away (two time three), otherwise the reminder system will fail.   

See: [Time management](igrc-platform/workflow/time-management.md) for detailed information on reminders.  

# String or binary date would be truncated

If you have the following error :     

```
### Error updating database.  Cause: com.microsoft.sqlserver.jdbc. SQLServerException:
String or binary data would be truncated.
### The error may involve org.activiti.engine.impl.persistence.entity.VariableInstanceEntity.insertVariableInstance-Inline
### The error occurred while setting parameters
### SQL: insert into ACT_RU_VARIABLE (ID_, REV_,     TYPE_, NAME_, PROC_INST_ID_, EXECUTION_ID_,
	TASK_ID_, BYTEARRAY_ID_,     DOUBLE_, LONG_ , TEXT_, TEXT2_)     
values (     ?,     1,     ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?,     ?     )
### Cause: com.microsoft.sqlserver.jdbc.SQLServerException: String or binary data would be truncated.
...
```

It is because one of the variables used in your process is too big to be stored in the activiti database (it is not truncated by default, and cannot be).     

To avoid this error please check the lengths of attributes used in Process Names, Task Names, etc. Please also verify that you are not using a multivalued attribute in one of these, as it could contain a long list, which once converted as string is too long.    

> **Beware**: Once this error occures, you will, most likely, have to delete the activiti database to start over (modified workflows are not anymore taken into account).  

# Empty process list in the task manager

If you find yourself with an empty list in the task manager, you can probably find the following error in the log files :     

```
[com.brainwave.portal.ui.handler.pages.utils.TreeDataModel1V] - Error building tree set
java.lang.NullPointerException ...
```

This can be caused by having one of the following values empty in your workflow:    

- progressCurrent
- progressTotal

Please check that you set a value, or set a default value for both variables in your workflow definition.   
For sub-processes, use the update tab of the start element to set a default value to these variables (defaults are not applied for sub-processes values).

# Prepared or callable statement has more than 2000 parameter markers

When using Microsoft's SQL server there is a limit to the number of parameters passed to a view. This results in the following error :     

```
2016-04-11 18:47:47,699 ERROR [Workflow] - #Error: Une exception est survenue
dans l'appel WorkflowManager.listProcessInstances(ProcessFilter(status equals 1,dataset.test equals TEST))
org.apache.ibatis.exceptions.PersistenceException:
### Error querying database.  Cause: java.sql.SQLException: Prepared or callable statement
has more than 2000 parameter markers.
### The error may exist in org/activiti/db/mapping/entity/Execution.xml
### The error may involve org.activiti.engine.impl.persistence.entity.ExecutionEntity.selectProcessInstanceByQueryCriteria
### The error occurred while executing a query
### SQL: SELECT SUB.* FROM (     ...
### Cause: java.sql.SQLException: Prepared or callable statement has more than 2000 parameter markers.
	at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:23)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:107)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:98)
	at org.activiti.engine.impl.db.DbSqlSession.selectListWithRawParameter(DbSqlSession.java:423)
	at org.activiti.engine.impl.db.DbSqlSession.selectList(DbSqlSession.java:414)
	at org.activiti.engine.impl.persistence.entity.ExecutionEntityManager.findProcessInstanceByQueryCriteria(ExecutionEntityManager.java:113)
	at org.activiti.engine.impl.ProcessInstanceQueryImpl.executeList(ProcessInstanceQueryImpl.java:485)
	at org.activiti.engine.impl.AbstractQuery.execute(AbstractQuery.java:158)
	at org.activiti.engine.impl.interceptor.CommandInvoker.execute(CommandInvoker.java:24)
	at org.activiti.engine.impl.interceptor.CommandContextInterceptor.execute(CommandContextInterceptor.java:57)
	at org.activiti.engine.impl.interceptor.LogInterceptor.execute(LogInterceptor.java:31)
	at org.activiti.engine.impl.cfg.CommandExecutorImpl.execute(CommandExecutorImpl.java:40)
	at org.activiti.engine.impl.cfg.CommandExecutorImpl.execute(CommandExecutorImpl.java:35)
	at org.activiti.engine.impl.AbstractQuery.list(AbstractQuery.java:132)
	at com.brainwave.iaudit.workflow.runtime.engine.WorkflowProcessFilter.executeQuery(WorkflowProcessFilter.java:248)
	at com.brainwave.iaudit.workflow.runtime.engine.WorkflowProcessFilter.executeQuery(WorkflowProcessFilter.java:149)
	at com.brainwave.iaudit.workflow.runtime.WorkflowManager.listProcessInstances(WorkflowManager.java:1516)
	at com.brainwave.iaudit.workflow.runtime.WorkflowManager.listProcessInstancesWithVariables(WorkflowManager.java:1475)
	at com.brainwave.portal.ui.handler.pages.extensions.DataExtensions.fetchUnfilteredDataSet(DataExtensions.java:1701)
	at com.brainwave.portal.ui.handler.pages.extensions.DataExtensions.fetchDataSetInternal(DataExtensions.java:403)
	at com.brainwave.portal.ui.handler.pages.extensions.DataExtensions.fetchDataSet(DataExtensions.java:321)
	at com.brainwave.portal.ui.handler.pages.extensions.DataExtensions$13.apply(DataExtensions.java:1261)
	at com.brainwave.portal.ui.handler.pages.extensions.DataExtensions$13.apply(DataExtensions.java:1)
	at org.eclipse.xtext.xbase.lib.IterableExtensions.forEach(IterableExtensions.java:399)
	at com.brainwave.portal.utils.tools.IterableExtensions.each(IterableExtensions.java:92)
	at com.brainwave.portal.ui.handler.pages.extensions.DataExtensions.fetchUnfilteredDataSet(DataExtensions.java:1315)
	at com.brainwave.portal.ui.handler.pages.extensions.DataExtensions.fetchDataSetInternal(DataExtensions.java:403)
	at com.brainwave.portal.ui.handler.pages.extensions.DataExtensions.fetchDataSet(DataExtensions.java:335)
	at com.brainwave.portal.ui.handler.pages.utils.GridDataBatch.updateRows(GridDataBatch.java:94)
	at com.brainwave.portal.ui.handler.pages.utils.GridDataBatch.init(GridDataBatch.java:69)
	at com.brainwave.portal.ui.handler.pages.rendering.SelectionWidgetsRenderer.buildBatch(SelectionWidgetsRenderer.java:6339)
	at com.brainwave.portal.ui.handler.pages.rendering.SelectionWidgetsRenderer.access$16(SelectionWidgetsRenderer.java:6337)
	at com.brainwave.portal.ui.handler.pages.rendering.SelectionWidgetsRenderer$26.apply(SelectionWidgetsRenderer.java:1641)
	at com.brainwave.portal.ui.handler.pages.rendering.SelectionWidgetsRenderer$26.apply(SelectionWidgetsRenderer.java:1)
	at com.brainwave.portal.ui.handler.pages.utils.XJob.run(XJob.java:69)
	at org.eclipse.core.internal.jobs.Worker.run(Worker.java:54)
Caused by: java.sql.SQLException: Prepared or callable statement has more than 2000 parameter markers.
	at net.sourceforge.jtds.jdbc.SQLParser.parse(SQLParser.java:1139)
	at net.sourceforge.jtds.jdbc.SQLParser.parse(SQLParser.java:156)
	at net.sourceforge.jtds.jdbc.JtdsPreparedStatement.<init>(JtdsPreparedStatement.java:98)
	at net.sourceforge.jtds.jdbc.ConnectionJDBC2.prepareStatement(ConnectionJDBC2.java:2445)
	at net.sourceforge.jtds.jdbc.ConnectionJDBC2.prepareStatement(ConnectionJDBC2.java:2403)
	at sun.reflect.GeneratedMethodAccessor33.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
	at java.lang.reflect.Method.invoke(Unknown Source)
	at org.apache.ibatis.datasource.pooled.PooledConnection.invoke(PooledConnection.java:245)
	at com.sun.proxy.$Proxy53.prepareStatement(Unknown Source)
	at org.apache.ibatis.executor.statement.PreparedStatementHandler.instantiateStatement(PreparedStatementHandler.java:72)
	at org.apache.ibatis.executor.statement.BaseStatementHandler.prepare(BaseStatementHandler.java:82)
	at org.apache.ibatis.executor.statement.RoutingStatementHandler.prepare(RoutingStatementHandler.java:54)
	at org.apache.ibatis.executor.SimpleExecutor.prepareStatement(SimpleExecutor.java:70)
	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:56)
	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:259)
	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:132)
	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:105)
	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:81)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:104)
	... 34 more
```

If you come across this error you have to modify the structure of your workflow so that the number of parameters passed to a view is systematically less than 2000.

# Only language locales are supported

Sample `igrcportal.log` file:

```
2020-04-29 15:35:15,225 INFO [com.brainwave.portal.ui.handler.pages.internal.PagesRegistry] - Loading page file custom/workflows/nls.page
2020-04-29 15:35:15,226 ERROR [com.brainwave.portal.ui.handler.pages.internal.PagesRegistry] - Only language locales are supported: search
2020-04-29 15:35:15,226 ERROR [com.brainwave.portal.ui.handler.pages.internal.PagesRegistry] - Only language locales are supported: recherche
```

There is an issue with some NLS definition in the pages.  
The errors above are cause by the following NLS entries:  

```
myNLS = NLS [
	search.message [en "Check the "search" option to show results" fr "Cocher l'option "recherche" pour afficher les résultats"]
]
```

Since the string separators are incorrect, `search` and `recherche` are seen as ISO country codes (instead of `en` and `fr`).  
A fix would be to use other separators inside the strings:

```
myNLS = NLS [
	search.message [en "Check the 'search' option to show results" fr "Cocher l'option 'recherche' pour afficher les résultats"]
]
```