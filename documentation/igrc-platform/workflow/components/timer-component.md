---
layout: page
title: "Timer Component"
parent: "Components"
grand_parent: "Workflow"
nav_order: 3
permalink: /docs/igrc-platform/workflow/components/timer-component/
---
---

To poll repeatedly until a certain condition is met you need to define an iteration on the timer activity (see the page on [Itérations](igrc-platform/workflow/iterations-and-subprocesses.md) for more information).   

The timer activity has to be set for sequential tasks, with :   

- A main variable the size of the maximum number of tries you wish to perform
- A stopping condition that will indicate when the polling has been successful.   

This will effectively result in the timer task being repeated until either the condition is met or the number of tries has been exhausted. At the end of each task, a scripting function will be called that will perform the necessary actions and, if successful, will set the variables so that the iteration can end. Here is an example of what a process using this could look like :

![Timer](../images/timer.png "Timer")   

Of course, it is entirely possible that, instead of a single script function, a whole activity or a group of activities is what needs repeating. In that case, you can use an embedded subprocess (see [Itérations](igrc-platform/workflow/iterations-and-subprocesses.md) for more information) which will perform the same iteration on timer and activities both. Here is what it could look like :   

![Timer 2](../images/timer2.png "Timer 2")   


| **Note**: <br><br> that we are not restricted to a fixed period of time between two tries. As the time span can be specified using a macro, we can build any sequence of time intervals that we want.|  

A very easy way to do this is by setting a multivalued variable of type Number, with the right sequence of time delays. For example, let's create a variable named _delays_ in which we put the numbers 1,2,4,8,16,32,64,128. We put in the timer activity configuration : Wait {dataset.delays.get()} hours, and we add _delays_ to the variable in the iteration list (it can even be the main iteration variable). This will result in waiting for time intervals that grow twice longer each try, until we either exhaust our choices or succeed in our task.  
