# Service Bus Namespace and Queue

This directory defines a module for provisioning a Service Bus Namespace and Queue as well as an authorization rule. These resources are defined in [main.tf](main.tf).

## File Parameters

All variables are defined and described in [variables.tf](variables.tf). These variables are injected when defining this module.

## Service Bus Namespace

The resource `azurerm_servicebus_namespace` defines the a Service Bus Namespace. This acts as a message broker along with queues or pub-sub topics.

[Full Reference Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace)

## Service Bus Queue

The resource `azurerm_servicebus_queue` defines a Service Bus Queue. Messages are sent to and received from queues. Queues store messages until the receiving application is ready to receive them.

[Full Reference Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue)

## Service Bus Authorization Rule

The resource `azurerm_servicebus_namespace_authorization_rule` defines an Authorization Rule. This uses SAS authentication to allow users or other resources access to the Service Bus Namespace and Queue using a token.

## Outputs

This module outputs some variables defined in [outputs.tf](outputs.tf). This allows variables from this module to be referenced by other resources.

|Variable|Description|
|--------|-----------|
|`connection_string`|The primary key connection_string for the Service Bus. This allows other resources to access the Service Bus. (**Note. this should probably be changed to something more secure such as using KeyVault.**)|
| `id` | This variable is the Service Bus Namespace's ID. This allows other resources to reference it. |
