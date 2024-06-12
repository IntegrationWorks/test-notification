# Global
location            = "Australia East"
resource_group_name = "notification-pattern"

# Function App
function_app_name         = "notif-delivery-fa"
storage_account_name      = "sanotifdevfa"
app_sku                   = "Y1"
app_service_plan_name     = "notif-delivery-fa-APS"
function_app_package_name = "notif-delivery-fa"
application_insights_name = "notif-delivery-fa"
app_settings = {
  "WEBSITE_CONTENTSHARE"                   = "notif-delivery-fa"
  "SCM_DO_BUILD_DURING_DEPLOYMENT"         = "true"
  "FUNCTIONS_WORKER_RUNTIME"               = "dotnet-isolated"
  "WEBSITE_USE_PLACEHOLDER_DOTNETISOLATED" = "1"
}

# Event Grid Subscription
system_topic_name     = "delivery-update-topic"
system_topic_type     = "Microsoft.ServiceBus.Namespaces"
event_grid_sub_name   = "delivery-update-sub"
event_delivery_schema = "CloudEventSchemaV1_0"

# Service Bus
service_bus_namespace_name = "delivery-update-bus"
service_bus_queue_name     = "delivery-update-queue"
service_bus_sku            = "Premium"


