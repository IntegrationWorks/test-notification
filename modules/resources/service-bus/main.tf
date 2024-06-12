# Service Bus and Queue

resource "azurerm_servicebus_namespace" "this" {
  name                = var.service_bus_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.service_bus_sku
  capacity            = 1
}
resource "azurerm_servicebus_queue" "example" {
  depends_on   = [azurerm_servicebus_namespace.this]
  name         = var.service_bus_queue_name
  namespace_id = azurerm_servicebus_namespace.this.id
}
resource "azurerm_servicebus_namespace_authorization_rule" "this" {
  depends_on   = [azurerm_servicebus_namespace.this]
  name         = "servicebus_auth_rule"
  namespace_id = azurerm_servicebus_namespace.this.id
  listen       = true
  send         = true
}

terraform {
  required_version = "~>1.7"
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      configuration_aliases = [azurerm]
      version               = "~> 3.0.2"
    }
  }
}
