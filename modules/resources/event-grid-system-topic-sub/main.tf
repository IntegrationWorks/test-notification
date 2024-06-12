# Event Grid Subscription

resource "azurerm_eventgrid_system_topic" "this" {
  name                   = var.system_topic_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  topic_type             = var.topic_type
  source_arm_resource_id = var.source_id
}


resource "azurerm_eventgrid_system_topic_event_subscription" "this" {
  depends_on          = [azurerm_eventgrid_system_topic.this]
  name                = var.event_grid_sub_name
  resource_group_name = var.resource_group_name
  system_topic        = azurerm_eventgrid_system_topic.this.name
  azure_function_endpoint {
    function_id = var.endpoint_id
  }
  event_delivery_schema = var.event_delivery_schema

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
