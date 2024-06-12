# Existing Resource Group
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}


# Service Bus Namespace and Queue Resources
module "service_bus_queue" {
  depends_on                 = [data.azurerm_resource_group.this]
  source                     = "../../modules/resources/service-bus"
  resource_group_name        = data.azurerm_resource_group.this.name
  location                   = var.location
  service_bus_namespace_name = var.service_bus_namespace_name
  service_bus_queue_name     = var.service_bus_queue_name
  service_bus_sku            = var.service_bus_sku
  providers                  = { azurerm = azurerm }
}




# Function App Resources
module "function_app" {
  depends_on            = [module.service_bus_queue]
  source                = "../../modules/resources/function-app-zip-deploy"
  resource_group_name   = data.azurerm_resource_group.this.name
  location              = var.location
  function_app_name     = var.function_app_name
  storage_account_name  = var.storage_account_name
  app_sku               = var.app_sku
  app_service_plan_name = var.app_service_plan_name
  app_settings = merge(var.app_settings, { "DELIVERY_UPDATE_QUEUE_KEY" = module.service_bus_queue.connection_string
    "DELIVERY_UPDATE_QUEUE_NAME" = var.service_bus_queue_name
  })
  application_insights_name = var.application_insights_name
  function_app_package_name = var.function_app_package_name
  providers = { azurerm = azurerm
    archive = archive
  null = null }
}


# Event Grid System Topic and Subscription
module "event_grid_sub" {
  depends_on            = [module.function_app]
  source                = "../../modules/resources/event-grid-system-topic-sub"
  resource_group_name   = data.azurerm_resource_group.this.name
  location              = var.location
  system_topic_name     = var.system_topic_name
  topic_type            = var.system_topic_type
  source_id             = module.service_bus_queue.id
  event_grid_sub_name   = var.event_grid_sub_name
  endpoint_id           = "${module.function_app.id}/functions/delivery_update_sub"
  event_delivery_schema = var.event_delivery_schema
  providers             = { azurerm = azurerm }
}
