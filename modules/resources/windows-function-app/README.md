# Windows Function App Module

This module defines the resources necessary to deploy a Windows Function App. This includes a Storage Account, Application Insights, App Service Plan and the Function App itself. These resources are all defined in [main.tf](main.tf).

## File Parameters

All variables are defined and described in [variables.tf](variables.tf). These variables are injected when defining this module.

## Storage Account

The `azurerm_storage_account` resource defines a Storage Account. This is required for Function Apps running on the `Consumption plan`. The storage account is used to store the function's files. Also it is used for logs and facilitating certain features of the underlying function infrastructure.

[Full Reference Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account)

## Application Insights

The `azurerm_application_insights` resource allows you to view and analyse information about the Function App such as logs.

[Full Reference Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights)

## App Service Plan

The `azurerm_service_plan` resource defines the App Service Plan the Function App runs on. App Service Plan's define a set of compute resources for the Function App to run on.

[Full Reference Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan)

## Windows Function App

The `azurerm_windows_function_app` resource defines a Windows Function App. An Azure Function App is a serverless compute service that lets you run event-triggered pieces of code without managing servers. You can write code in various languages and trigger it by events like HTTP requests, events, or timer schedules.

[Full Reference Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app)

## Outputs

|Variable|Description|
|--------|-----------|
| `id` | The ID of the Function App. This allows other resources to reference it. |
| `name` | The name of the Function App. This allows other resources to reference it. |
