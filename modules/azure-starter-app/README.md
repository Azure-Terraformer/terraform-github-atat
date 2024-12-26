The Dual-Backend Starter App module provisions a comprehensive Azure Terraform Starter application that establishes an end-to-end Terraform workflow utilizing a dual backend configuration for both non-production and production environments. This module sets up a simple Azure Terraform solution, including Terraform source code that deploys an Azure Resource Group. It integrates GitHub Actions to implement the Terraform Core Workflow, enabling automated infrastructure management.S

Additionally, the module configures GitHub Actions to impersonate an Entra ID identity, ensuring secure authentication with Azure and seamless interaction with the dual backend. By combining these components, the Dual-Backend Starter App streamlines the setup of resilient and scalable Terraform workflows, facilitating efficient and secure infrastructure provisioning across multiple environments.

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
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 3.0.2 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.10.0 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_atat"></a> [atat](#module\_atat) | Azure-Terraformer/atat-application-environment/github | 1.0.5 |
| <a name="module_github_identity"></a> [github\_identity](#module\_github\_identity) | Azure-Terraformer/github-credential/azuread | 1.0.10 |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [github_user.current](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | n/a | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | n/a | `any` | n/a | yes |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | n/a | `bool` | `true` | no |
| <a name="input_environments"></a> [environments](#input\_environments) | n/a | <pre>map(object({<br>    subscription_id = string<br>    branch_name     = string<br>    backend = object({<br>      resource_group_name  = string<br>      storage_account_name = string<br>      state_container_name = string<br>      plan_container_name  = string<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | n/a | `string` | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | n/a | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | n/a | `string` | n/a | yes |
| <a name="input_repository_visibility"></a> [repository\_visibility](#input\_repository\_visibility) | n/a | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | n/a | `string` | `"1.9.8"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->