# Function App Zip Deployment

This directory acts as a module to deploys a Function App resource and it's code.
These resources are defined in [main.tf](main.tf).

## File Parameters

All variables are defined and described in [variables.tf](variables.tf). These variables are injected when defining this module.

## Clone Function App Code

The resource `clone_fa_code` uses `terraform_data` to act as a do nothing container to run a git clone command for the function app repository.

[Full Reference Documentation](https://developer.hashicorp.com/terraform/language/resources/terraform-data)

## Package Function App Code

The resource `file_function_app` packages the downloaded repo into a zip file. This uses the `archive_file` data source.

[Full Reference Documentation](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file)

## Function App Module

This module defines all the resources required to provision an Azure Function App. The resources are defined in [../windows-function-app/main.tf](../windows-function-app/main.tf).

[Documentation](../windows-function-app/README.md)

## Publish Function App Code

The resource `function_app_publish`, runs an Azure CLI command locally, that deploys the Function App Code using zip deployment.

## Outputs

This module outputs some variables defined in [outputs.tf](outputs.tf). This allows variables from this module to be referenced by other resources.

|Variable|Description|
|--------|-----------|
| `id` | The id of the Function App resource. This allows other resources to reference the Function App |
