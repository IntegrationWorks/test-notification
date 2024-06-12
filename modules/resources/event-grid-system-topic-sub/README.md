# Event Grid System Topic Subscription

This directory acts as a module to define an Event Grid System Topic and Event Grid System Topic Subscription. The resources are defined in [main.tf](main.tf).

## main.tf

As mentioned above this defines two resources, an Event Grid System Topic and Event Grid System Topic Subscription.

### File Parameters

All parameters are defined and described in [variables.tf](variables.tf). These variables are injected when the module is defined.

### azurerm_eventgrid_system_topic

This resource defines an Event Grid System Topic. Events are published to the system topic. Resources can subscribe to the topic to be alerted of new Events.

[Full Reference Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_system_topic)

### azurem_eventgrid_system_topic_event_subscription

This resource defines an EventGrid System Topic Subscription. It allows you define an endpoint which is alerted of any events. In this case, it is an Azure Function which is triggered anytime an event is published.
