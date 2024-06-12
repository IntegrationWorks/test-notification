
variable "location" {
  type        = string
  description = "The Azure Region resources will be deployed in"
  default     = "Australia East"
}

variable "resource_group_name" {
  type        = string
  description = "The name of an already existing Resource Group where resources will be deployed."
  default     = "james-sandbox"
}

variable "function_app_name" {
  type        = string
  description = "Function App resource name"
}

variable "storage_account_name" {
  type        = string
  description = "Function App's Storage Account resource name"
}

variable "app_sku" {
  type        = string
  description = "Function App's App Service Plan SKU"
}

variable "app_service_plan_name" {
  type        = string
  description = "Function App's App Service Plan resource name"

}


variable "function_app_package_name" {
  type        = string
  description = "Name for the .zip package created from the Function App repo files"
}

variable "application_insights_name" {
  type        = string
  description = "Application Insights resource name"
}

variable "app_settings" {
  type        = map(string)
  description = "Function App application settings (map of Key-Value pairs)"
}
variable "system_topic_name" {
  type        = string
  description = "Event Grid System Topic resource name"
}

variable "system_topic_type" {
  type        = string
  description = "Event Grid System Topic resource type"
}

variable "event_grid_sub_name" {
  type        = string
  description = "Event Grid Topic Subscription name"
}

variable "event_delivery_schema" {
  type        = string
  description = "Event Grid delivery schema"
}

variable "service_bus_namespace_name" {
  type        = string
  description = "Service Bus Namespace resource name"
}

variable "service_bus_queue_name" {
  type        = string
  description = "Service Bus Namespace Queue resource name"
}

variable "service_bus_sku" {
  type        = string
  description = "Tier of Service Bus"
}
