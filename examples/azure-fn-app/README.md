The Azure Function App Example Module builds upon the Dual Backend and Azure Function Core modules to deploy robust Azure Functions seamlessly. This module provisions a C# solution tailored for Azure Functions, ensuring it leverages the shared infrastructure and dual Terraform state backends for high availability and reliability. 

Additionally, it integrates comprehensive GitHub Actions workflows to support continuous integration, including build processes, unit tests, and integration tests for the .NET codebase. A dedicated GitHub Actions workflow is also provided to automate the deployment of the C# solution to the Azure Functions app. By combining infrastructure provisioning with automated CI/CD pipelines, the Azure Function App Example Module facilitates efficient development, testing, and deployment of scalable serverless applications on Azure.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.10.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app"></a> [app](#module\_app) | ../../modules/azure-fn-app | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of the application to be deployed. This name is used for resource identification and naming conventions within the infrastructure.<br><br>  It's best to keep this short and simple while also ensuring it is easily identifiable and relatively unique within your organization (or at least within the Subscriptions you are targetting). | `string` | n/a | yes |
| <a name="input_azure_nonprod_subscription"></a> [azure\_nonprod\_subscription](#input\_azure\_nonprod\_subscription) | The Azure Subscription ID for the non-production environment where non-production resources will be provisioned. | `string` | n/a | yes |
| <a name="input_azure_prod_subscription"></a> [azure\_prod\_subscription](#input\_azure\_prod\_subscription) | The Azure Subscription ID for the production environment where production resources will be provisioned. | `string` | n/a | yes |
| <a name="input_github_email"></a> [github\_email](#input\_github\_email) | The email address associated with the GitHub account used for committing changes. This is used to attribute commits to the correct user." | `string` | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | The GitHub organization under which the repository will be created. This should be the exact name of the GitHub organization. | `string` | n/a | yes |
| <a name="input_github_username"></a> [github\_username](#input\_github\_username) | The GitHub username that will be used for committing changes to the repository. Ensure this account has the necessary permissions within the GitHub organization." | `string` | n/a | yes |
| <a name="input_nonprod_backend"></a> [nonprod\_backend](#input\_nonprod\_backend) | Configuration for the backend storage used in the non-production environment. Includes resource group, storage account, and container names for Terraform state and plans. | <pre>object({<br>    resource_group_name  = string<br>    storage_account_name = string<br>    state_container_name = string<br>    plan_container_name  = string<br>  })</pre> | n/a | yes |
| <a name="input_prod_backend"></a> [prod\_backend](#input\_prod\_backend) | Configuration for the backend storage used in the production environment. Includes resource group, storage account, and container names for Terraform state and plans. | <pre>object({<br>    resource_group_name  = string<br>    storage_account_name = string<br>    state_container_name = string<br>    plan_container_name  = string<br>  })</pre> | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | A brief description of the GitHub repository. This helps in understanding the purpose and scope of the repository.<br><br>  This should describe the workload represented by the `application_name`. | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the GitHub repository to be created. This name should be unique within the specified GitHub organization.<br><br>  The GitHub repository name should correlate to the `application_name` as it will contain the source code for the infrastructure <br>  that is provisioned to Azure. | `string` | n/a | yes |
| <a name="input_repository_visibility"></a> [repository\_visibility](#input\_repository\_visibility) | The visibility level of the GitHub repository. Accepted values are 'public', 'private', or 'internal'. Determines who can view and access the repository. | `string` | n/a | yes |
| <a name="input_root_namespace"></a> [root\_namespace](#input\_root\_namespace) | The .NET Namespace that will be used to the names of the Visual Studio Solution and Project files as well as the default .NET namespace within the <br>  C# codebase. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Specifies the version of Terraform to use for the deployment. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->