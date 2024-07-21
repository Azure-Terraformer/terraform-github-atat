<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_backend"></a> [azure\_backend](#module\_azure\_backend) | ../../../../backend/azure/blob-storage | n/a |
| <a name="module_azure_credential"></a> [azure\_credential](#module\_azure\_credential) | ../../../../credential/azure/service-principal-secret | n/a |
| <a name="module_terraform_manual"></a> [terraform\_manual](#module\_terraform\_manual) | ../../../../pipeline/terraform/manual-targeting/service-principal-secret | n/a |
| <a name="module_terraform_simple_codebase"></a> [terraform\_simple\_codebase](#module\_terraform\_simple\_codebase) | ../../../../codebase/terraform/application-environment | n/a |

## Resources

| Name | Type |
|------|------|
| [github_actions_environment_variable.environment_name](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |
| [github_actions_environment_variable.terraform_version](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |
| [github_actions_environment_variable.terraform_working_directory](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |
| [github_actions_variable.application_name](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_branch.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_environment.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment) | resource |
| [github_user.current](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | n/a | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | n/a | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_environments"></a> [environments](#input\_environments) | n/a | <pre>map(object({<br><br>    subscription_id = string<br>    tenant_id       = string<br>    client_id       = string<br>    client_secret   = string<br>    backend = object({<br>      resource_group_name  = string<br>      storage_account_name = string<br>      container_name       = string<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | n/a | `string` | `"1.6.6"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->