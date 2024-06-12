variable "system_topic_name" {
  type        = string
  description = "Event Grid System Topic resource name"
}
variable "location" {
  type        = string
  description = "The Azure Region resources will be deployed in"
}
variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}
variable "topic_type" {
  type        = string
  description = "The type of Event Grid System Topic"
}
variable "source_id" {
  type        = string
  description = "The ID of the Event Grid System Topic ARM Source"
}
variable "event_grid_sub_name" {
  type        = string
  description = "Name of the Event Grid Subscription Resource"
}

# variable "resource_group_id" {
#   type        = string
#   description = "Resource Group ID"
# }

variable "endpoint_id" {
  type        = string
  description = "The ID of the resource Subscribing to the Event Grid Topic"
}

variable "event_delivery_schema" {
  type        = string
  description = "Event Delivery Schema"

}
