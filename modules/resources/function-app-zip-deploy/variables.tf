variable "resource_group_name" {
  type        = string
  description = "Resource Group"
}

variable "function_app_name" {
  type        = string
  description = "Function App resource name"
}

variable "location" {
  type        = string
  description = "The Azure Region resources will be deployed in"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account resource name"
}

variable "app_service_plan_name" {
  type        = string
  description = "App Service Plan resource name"
}

variable "app_sku" {
  type        = string
  description = "value"

}
variable "app_settings" {
  type = map(string)
}

variable "application_insights_name" {
  type        = string
  description = "Application Insights resource name"
}



variable "function_app_package_name" {
  type        = string
  description = "Name for the .zip package created from the Function App repo files"
}
