
The `azure-fn-app` module builds upon the `azure-fn-core` module to deploy Azure Function Apps seamlessly onto both regional and centralized infrastructure designed for multiple Azure Functions. This module automates the provisioning of Azure Functions using Terraform, integrated with GitHub Actions and Azure CLI to streamline the deployment workflow. 

Additionally, it includes a robust C# codebase that leverages the App Insights observability stack and securely accesses Key Vault resources within each region. By utilizing the centralized infrastructure for observability and security, the Azure-Fn-App Module not only reduces operational costs but also ensures scalable, reliable, and maintainable Function App deployments across non-production and production environments. This comprehensive setup facilitates efficient management and monitoring of Azure Functions, enhancing both development and operational workflows.

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
| <a name="module_action-azure-login-test"></a> [action-azure-login-test](#module\_action-azure-login-test) | Azure-Terraformer/action-azure-login-test/github | 1.0.1 |
| <a name="module_dotnet_codebase"></a> [dotnet\_codebase](#module\_dotnet\_codebase) | Azure-Terraformer/codebase-terraform-azure-fn-app-dotnet/github | 1.0.39 |
| <a name="module_github_environments-terraform-azure"></a> [github\_environments-terraform-azure](#module\_github\_environments-terraform-azure) | Azure-Terraformer/environment-terraform-azure/github | 1.0.3 |
| <a name="module_github_identity"></a> [github\_identity](#module\_github\_identity) | Azure-Terraformer/github-credential/azuread | 1.0.10 |
| <a name="module_terraform_codebase"></a> [terraform\_codebase](#module\_terraform\_codebase) | Azure-Terraformer/codebase-terraform-azure-fn-app/github | 1.0.26 |
| <a name="module_terraform_gitflow"></a> [terraform\_gitflow](#module\_terraform\_gitflow) | Azure-Terraformer/action-azure-application/github | 1.0.32 |

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
| <a name="input_core_name"></a> [core\_name](#input\_core\_name) | The name of the Azure Functions Core Environment. | `string` | n/a | yes |
| <a name="input_delay_after_environment_creation"></a> [delay\_after\_environment\_creation](#input\_delay\_after\_environment\_creation) | GitHub Environments have a glitch that causes them to not be available immediately after creation is reported. Environment variables <br>  will fail unless there is some time granted to allow for the Environment creation to complete. This setting adds a fixed amount of time<br>  after the creation of the environment before provisioning additional resources. | `number` | `10` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | The setting that controls whether the GitHub repository deletes the feature branch automatically after the merge. | `bool` | `true` | no |
| <a name="input_environments"></a> [environments](#input\_environments) | Configuration for each of the environments for this application.<br><br>  Each Environment has a name which is supplied by the key of the map. <br>  Each Environment has a long-lived environment on the specified `branch_name`.<br>  Each Environment can be provisioned within the context of an Azure Subscription specified by `subscription_id`.<br>  Each Environment can have its own Terraform State Backend configuration which consists of an Azure Storage Account and containers for both state files and plan files. | <pre>map(object({<br>    subscription_id = string<br>    branch_name     = string<br>    reviewing_users = list(string)<br>    reviewing_teams = list(string)<br>    backend = object({<br>      resource_group_name  = string<br>      storage_account_name = string<br>      state_container_name = string<br>      plan_container_name  = string<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | The GitHub organization under which the repository will be created. This should be the exact name of the GitHub organization. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The operating system type for Azure Function Service Plan that will be provisioned." | `string` | n/a | yes |
| <a name="input_primary_location"></a> [primary\_location](#input\_primary\_location) | The primary Azure region where the Azure Functions Core Environment will be provisioned." | `string` | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | A brief description of the GitHub repository. This helps in understanding the purpose and scope of the repository.<br><br>  This should describe the workload represented by the `application_name`. | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the GitHub repository to be created. This name should be unique within the specified GitHub organization.<br><br>  The GitHub repository name should correlate to the `application_name` as it will contain the source code for the infrastructure <br>  that is provisioned to Azure. | `string` | n/a | yes |
| <a name="input_repository_visibility"></a> [repository\_visibility](#input\_repository\_visibility) | The visibility level of the GitHub repository. Accepted values are 'public', 'private', or 'internal'. Determines who can view and access the repository. | `string` | n/a | yes |
| <a name="input_root_namespace"></a> [root\_namespace](#input\_root\_namespace) | The .NET Namespace that will be used to the names of the Visual Studio Solution and Project files as well as the default .NET namespace within the <br>  C# codebase. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Specifies the version of Terraform to use. Defaults to '1.9.8'. | `string` | `"1.9.8"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->