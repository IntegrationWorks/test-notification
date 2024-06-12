# Function App


data "archive_file" "file_function_app" {
  type        = "zip"
  source_dir  = var.function_app_package_name
  output_path = "${var.function_app_package_name}.zip"
}

module "windows_function_app" {
  depends_on                = [data.archive_file.file_function_app]
  source                    = "../windows-function-app"
  app_service_plan_name     = var.app_service_plan_name
  app_settings              = var.app_settings
  app_sku                   = var.app_sku
  application_insights_name = var.application_insights_name
  function_app_name         = var.function_app_name
  location                  = var.location
  storage_account_name      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  providers = {
    azurerm = azurerm
  }
}

resource "null_resource" "function_app_publish" {
  depends_on = [module.windows_function_app]
  provisioner "local-exec" {
    command = "az functionapp deployment source config-zip --resource-group ${var.resource_group_name} --name ${module.windows_function_app.name} --src ${data.archive_file.file_function_app.output_path}"
  }
}

terraform {
  required_version = "~>1.7"
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      configuration_aliases = [azurerm]
      version               = "~> 3.0.2"
    }
    archive = {
      source                = "hashicorp/archive"
      configuration_aliases = [archive]
      version               = "~> 2.4.2"
    }

    null = {
      source                = "hashicorp/null"
      configuration_aliases = [null]
      version               = "~> 3.2.2"
    }
  }
}


