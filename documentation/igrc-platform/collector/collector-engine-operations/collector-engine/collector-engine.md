---
layout: page
title: "Collector engine states and it's components"
parent: "Operation of the collector engine"
grand_parent: "Collector"
has_children: true
nav_order: 2
permalink: /docs/igrc-platform/collector/collector-engine-operations/collector-engine/
---
---

The collector engine goes through several states as it is executed. The following diagram shows the sequence of the states:

![Collector engine states](./images/worddavc52dfa2d5eec6185b8f76274371a3329.png "Collector engine states")
**_Collector engine states_**  

The explanation of each state and of the transitions is given below:

- Initialising: This is the initial state of the collector line. In this state, the collector engine asks each component of the line to initialize itself. The boot order of the components is random. It is mainly a question of reading the configuration of the xml file, whose extension is .collect. If an error occurs, the engine stops the processes immediately without alerting any other component.

- Starting: In this state, the collector engine asks each component to prepare the environment allowing the processing of data. The notification order of the components is random. For example, for a file type source, the Starting state corresponds to opening the file, size, date, and first record starting point verifications. If an error occurs, the collector engine goes immediately into the Disposing state.

- Executing: This is the state in which all the data from the main source are read and processed by the different components, following the collector line transitions. When the collector engine goes into this state, it doesn't notify any component. It only asks the main source to constitute a dataset and to pass it to the following components through transitions. The call to the main source is repeated as long as the source produces a dataset. When the main source has no more datasets, the collector engine moves to the Flushing state. If an error occurs, the engine goes to the Disposing state which asks all the components to free up the allocated resources.

- Flushing: This is a state which allows components to handle the latest datasets which were pending or waiting for an event. This scenario happens for example with the grouping component which aggregates datasets into a single dataset. This component always keeps the last dataset in memory and only passes it along when the engine goes to the Flushing state. In this state, the engine notifies all the components so they may finish processing any retained datasets. Notification order of the components is random. If an error occurs, the engine goes to the Disposing state without finishing notifying the other components.

- Terminating: The collector engine goes into the Terminating state at the end of execution if no errors were encountered. All of the components are notified that the execution was successfully concluded. Notification order of the components is random. If an error occurs, the engine goes to the Disposing state.

- Disposing: This is the state in which all of the components are notified to free up the allotted resources. The notification order of the components is random. Unlike the other states, if an error occurs, the collector engine ignores the error and continues the notification of the other components so that all components may free up their resources.
