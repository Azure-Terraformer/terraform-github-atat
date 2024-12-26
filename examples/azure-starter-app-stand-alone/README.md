The Azure Starter App Stand Alone Module is an all-in-one Terraform solution that seamlessly provisions both the Dual Backend and Azure Starter App without any external dependencies. Designed for simplicity and efficiency, this module enables users to set up, test, and tear down their entire Terraform infrastructure in a single operation. By integrating dual Terraform state backends for non-production and production environments, it ensures high availability and robust state management. 

Additionally, it deploys a complete Azure Terraform Starter App with automated GitHub Actions workflows for Terraform operations. Ideal for rapid testing, demonstrations, or getting started with Terraform on Azure, the Stand Alone Module provides everything needed to quickly deploy and manage a resilient and scalable Azure infrastructure effortlessly.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.10.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app"></a> [app](#module\_app) | ../../modules/azure-starter-app | n/a |
| <a name="module_backend"></a> [backend](#module\_backend) | ../../modules/azure-dual-backend | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.backend_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of the application to be deployed. This name is used for resource identification and naming conventions within the infrastructure. | `string` | n/a | yes |
| <a name="input_azure_nonprod_subscription"></a> [azure\_nonprod\_subscription](#input\_azure\_nonprod\_subscription) | The Azure Subscription ID for the non-production environment where non-production resources will be provisioned. | `string` | n/a | yes |
| <a name="input_azure_prod_subscription"></a> [azure\_prod\_subscription](#input\_azure\_prod\_subscription) | The Azure Subscription ID for the production environment where production resources will be provisioned. | `string` | n/a | yes |
| <a name="input_github_email"></a> [github\_email](#input\_github\_email) | The email address associated with the GitHub account used for committing changes. This is used to attribute commits to the correct user. | `string` | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | The name of the application to be deployed. This name is used for resource identification and naming conventions within the infrastructure. | `string` | n/a | yes |
| <a name="input_github_repository_description"></a> [github\_repository\_description](#input\_github\_repository\_description) | A brief description of the GitHub repository. This helps in understanding the purpose and scope of the repository. | `string` | n/a | yes |
| <a name="input_github_repository_name"></a> [github\_repository\_name](#input\_github\_repository\_name) | The name of the GitHub repository to be created. This name should be unique within the specified GitHub organization. | `string` | n/a | yes |
| <a name="input_github_repository_visibility"></a> [github\_repository\_visibility](#input\_github\_repository\_visibility) | The visibility level of the GitHub repository. Accepted values are 'public', 'private', or 'internal'. Determines who can view and access the repository. | `string` | n/a | yes |
| <a name="input_github_username"></a> [github\_username](#input\_github\_username) | A brief description of the GitHub repository. This helps in understanding the purpose and scope of the repository. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed. Examples include 'eastus', 'westeurope', 'centralus', etc. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Specifies the version of Terraform to use for the deployment. Defaults to '1.9.8'. It is recommended to use this version to ensure compatibility. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->