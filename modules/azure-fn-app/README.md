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
| <a name="module_action-azure-login-test"></a> [action-azure-login-test](#module\_action-azure-login-test) | Azure-Terraformer/action-azure-login-test/github | 1.0.0 |
| <a name="module_dotnet_codebase"></a> [dotnet\_codebase](#module\_dotnet\_codebase) | Azure-Terraformer/codebase-terraform-azure-fn-app-dotnet/github | 1.0.30 |
| <a name="module_github_environments-terraform-azure"></a> [github\_environments-terraform-azure](#module\_github\_environments-terraform-azure) | Azure-Terraformer/environment-terraform-azure/github | 1.0.3 |
| <a name="module_github_identity"></a> [github\_identity](#module\_github\_identity) | Azure-Terraformer/github-credential/azuread | 1.0.10 |
| <a name="module_terraform_codebase"></a> [terraform\_codebase](#module\_terraform\_codebase) | Azure-Terraformer/codebase-terraform-azure-fn-app/github | 1.0.20 |
| <a name="module_terraform_gitflow"></a> [terraform\_gitflow](#module\_terraform\_gitflow) | Azure-Terraformer/action-azure-application/github | 1.0.30 |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [github_actions_variable.application_name](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_branch.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [github_user.current](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of the application. | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | The user information for committing changes to the repository, including name and email. | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_core_name"></a> [core\_name](#input\_core\_name) | The core name used for referencing foundational components from this project. | `string` | n/a | yes |
| <a name="input_delay_after_environment_creation"></a> [delay\_after\_environment\_creation](#input\_delay\_after\_environment\_creation) | The delay in seconds to wait after creating an environment before proceeding. | `number` | `10` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Determines whether to automatically delete feature branches after they are merged. | `bool` | `true` | no |
| <a name="input_environments"></a> [environments](#input\_environments) | A map of environments, each containing configuration details such as subscription ID, branch name, reviewing users and teams, and backend settings. | <pre>map(object({<br>    subscription_id = string<br>    branch_name     = string<br>    reviewing_users = list(string)<br>    reviewing_teams = list(string)<br>    backend = object({<br>      resource_group_name  = string<br>      storage_account_name = string<br>      state_container_name = string<br>      plan_container_name  = string<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | The GitHub organization where the repository will be created. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The operating system type for the resources (e.g., 'linux', 'windows'). | `string` | n/a | yes |
| <a name="input_primary_location"></a> [primary\_location](#input\_primary\_location) | The primary geographical location where resources will be deployed. | `string` | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | A brief description of the GitHub repository. | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the GitHub repository. | `string` | n/a | yes |
| <a name="input_repository_visibility"></a> [repository\_visibility](#input\_repository\_visibility) | The visibility level of the GitHub repository (e.g., 'public' or 'private'). | `string` | n/a | yes |
| <a name="input_root_namespace"></a> [root\_namespace](#input\_root\_namespace) | The root namespace under which all classes will be organized within the .NET solution. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform to use for this module. | `string` | `"1.9.8"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->