The `azure-fn-core` Module leverages the Azure Dual Backend to manage Terraform state across both non-production and production environments, ensuring robust state management and high availability. Designed to provision shared infrastructure for Azure Functions applications, this module optimizes costs and enhances operability by deploying a multi-region Azure Functions App Service Plan. 

Additionally, it establishes central resources within the primary region, including a Log Analytics Workspace, Application Insights, and Key Vault, to facilitate comprehensive observability and secure secret management. By centralizing these essential services, the Azure-Fn-Core Module streamlines the deployment process, reduces Azure expenditures, and ensures scalable, reliable infrastructure for Azure Functions applications across multiple environments.

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
| <a name="module_action_azure_login"></a> [action\_azure\_login](#module\_action\_azure\_login) | Azure-Terraformer/action-azure-login-test/github | 1.0.1 |
| <a name="module_codebase"></a> [codebase](#module\_codebase) | Azure-Terraformer/codebase-terraform-azure-fn-core/github | 1.0.11 |
| <a name="module_gitflow"></a> [gitflow](#module\_gitflow) | Azure-Terraformer/action-azure-application/github | 1.0.31 |
| <a name="module_github_environments"></a> [github\_environments](#module\_github\_environments) | Azure-Terraformer/environment-terraform-azure/github | 1.0.3 |
| <a name="module_github_identity"></a> [github\_identity](#module\_github\_identity) | Azure-Terraformer/github-credential/azuread | 1.0.10 |

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
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of the application to be deployed. This name is used for resource identification and naming conventions within the infrastructure.<br><br>  It's best to keep this short and simple while also ensuring it is easily identifiable and relatively unique within your organization (or at least within the Subscriptions you are targetting). | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | The user information for committing changes to the repository, including name and email. | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_delay_after_environment_creation"></a> [delay\_after\_environment\_creation](#input\_delay\_after\_environment\_creation) | GitHub Environments have a glitch that causes them to not be available immediately after creation is reported. Environment variables <br>  will fail unless there is some time granted to allow for the Environment creation to complete. This setting adds a fixed amount of time<br>  after the creation of the environment before provisioning additional resources. | `number` | `10` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | The setting that controls whether the GitHub repository deletes the feature branch automatically after the merge. | `bool` | `true` | no |
| <a name="input_environments"></a> [environments](#input\_environments) | Configuration for each of the environments for this application.<br><br>  Each Environment has a name which is supplied by the key of the map. <br>  Each Environment has a long-lived environment on the specified `branch_name`.<br>  Each Environment can be provisioned within the context of an Azure Subscription specified by `subscription_id`.<br>  Each Environment can have its own Terraform State Backend configuration which consists of an Azure Storage Account and containers for both state files and plan files. | <pre>map(object({<br>    subscription_id = string<br>    branch_name     = string<br>    backend = object({<br>      resource_group_name  = string<br>      storage_account_name = string<br>      state_container_name = string<br>      plan_container_name  = string<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | The GitHub organization under which the repository will be created. This should be the exact name of the GitHub organization. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The operating system type for Azure Function Service Plan that will be provisioned." | `string` | n/a | yes |
| <a name="input_primary_location"></a> [primary\_location](#input\_primary\_location) | The primary Azure region where the Azure Functions Core Environment will be provisioned." | `string` | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | A brief description of the GitHub repository. This helps in understanding the purpose and scope of the repository.<br><br>  This should describe the workload represented by the `application_name`. | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the GitHub repository to be created. This name should be unique within the specified GitHub organization.<br><br>  The GitHub repository name should correlate to the `application_name` as it will contain the source code for the infrastructure <br>  that is provisioned to Azure. | `string` | n/a | yes |
| <a name="input_repository_visibility"></a> [repository\_visibility](#input\_repository\_visibility) | The visibility level of the GitHub repository. Accepted values are 'public', 'private', or 'internal'. Determines who can view and access the repository. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The number of days to retain logs before automatic deletion from the Azure Log Analytics Workspace in the Azure Functions Core Environments. | `number` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU for the Azure Function Service Plan. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Specifies the version of Terraform to use. Defaults to '1.9.8'. | `string` | `"1.9.8"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->