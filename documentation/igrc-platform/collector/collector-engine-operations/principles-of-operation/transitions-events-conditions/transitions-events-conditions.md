---
layout: page
title: "Transitions, events and conditions"
parent: "Principles of operation"
grand_parent: "Operation of the collector engine"
nav_order: 3
permalink: /docs/igrc-platform/collector/collector-engine-operations/principles-of-operation/transitions-events-conditions/
---
---

The components of a collector line are connected to each other by transitions. If several transitions start from a component, each of them is numbered in order to follow them in ascending order of their numbers.

![Numbered transitions](./images/1.png "Numbered transitions")   
**_Numbered transitions_**

A transition may carry a condition authorizing or preventing crossing the link to reach the next component. This condition is always expressed in the form of a JavaScript function call. In the graphical editor, text may be displayed expressing the condition clearly for an easier understanding of the collector line.

![Conditioned transitions](./images/2.png "Conditioned transitions")   
**_Conditioned transitions_**

The general principle of operation of the transitions is the following when there is at least one outgoing transition:

- Evaluation of all the JavaScript conditions: If a transition has no condition, we consider that it must be crossed to move to the next component. This step allows us to determine the entire list of transitions which must be performed before following a particular transition.
- If at least one transition remains in the list:
- Passing the first transition: The transition is performed and the next component is executed as well as all the following sub-components.
- Taking into account the 'Follow only one link' option: When the first following component and all the sub-components have finished running, the collector engine verifies the 'Follow only one link' option. This option, when activated, allows you to ignore other transitions after running the first one.
- If the 'Follow only one link' option is not activated:
- Passing all other transitions: Following the number order of the transitions, each transition is performed and the next component and all subcomponents are executed.   

The condition associated with a transition is a JavaScript activation expression which must return a Boolean to allow or prevent access to the next component. This macro is referenced in the transition in the 'activation function' field as shown in the following screenshot:   

It is important to note that the transition conditions are all evaluated before being performed, and not as the following components are running.   

![Activation expression in a transition](./images/3.png "Activation expression in a transition")   
**_Activation expression in a transition_**  

The return value of the activation expression is true if the transition can be performed, false otherwise. If the activation expression returns true, the next component is executed.   
In most cases, the activation expression tests the dataset contents as in the example above. However, in some cases, the passage of a transition must be made conditional upon the detection of a particular event. Indeed, some components generate events generally corresponding to working errors. For example, the modifying component of an attribute may generate an event if the attribute does not exist. The name of the event may be freely chosen. It becomes possible to pass on a particular transition when the event has been detected. The following code does the opposite as it prevents the transition from passing if the '_unknown attribute'_ event is detected:    
{dataset.hasEvent('unknown attribute')}   

It can be useful to combine a transition condition with the 'Follow only one link' option to make a connection of the 'if ... then ... else' type. If we take the previous example with the _'unknown attribute'_ event, it is possible to create two different paths depending on the detection or not of this event. The first transition should be crossed if the event has not been detected while the second transition should be crossed if the event is detected. Both transitions (and associated components) are exclusive. To achieve this conditional fork, just put a condition on the first transition and enable 'Follow only one link'. No condition is required for the second transition since it is performed only if the condition of the first transition is not verified.
