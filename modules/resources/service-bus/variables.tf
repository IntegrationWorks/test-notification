variable "service_bus_namespace_name" {
  type        = string
  description = "Service Bus Namespace resource Name"
}
variable "location" {
  type        = string
  description = "The Azure Region resources will be deployed in"
}
variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}
variable "service_bus_sku" {
  type        = string
  description = "Service Bus Tier (Must be 'Premium' to use Event Grid Subscription)"
}

variable "service_bus_queue_name" {
  type        = string
  description = "Service Bus Queue resource name"
}
