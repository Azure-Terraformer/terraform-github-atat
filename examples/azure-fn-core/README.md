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
| <a name="module_app"></a> [app](#module\_app) | ../../modules/azure-fn-core | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | n/a | `string` | n/a | yes |
| <a name="input_azure_dev_subscription"></a> [azure\_dev\_subscription](#input\_azure\_dev\_subscription) | n/a | `string` | n/a | yes |
| <a name="input_azure_prod_subscription"></a> [azure\_prod\_subscription](#input\_azure\_prod\_subscription) | n/a | `string` | n/a | yes |
| <a name="input_github_email"></a> [github\_email](#input\_github\_email) | n/a | `string` | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | n/a | `string` | n/a | yes |
| <a name="input_github_repository_description"></a> [github\_repository\_description](#input\_github\_repository\_description) | n/a | `string` | n/a | yes |
| <a name="input_github_repository_name"></a> [github\_repository\_name](#input\_github\_repository\_name) | n/a | `string` | n/a | yes |
| <a name="input_github_repository_visibility"></a> [github\_repository\_visibility](#input\_github\_repository\_visibility) | n/a | `string` | n/a | yes |
| <a name="input_github_username"></a> [github\_username](#input\_github\_username) | n/a | `string` | n/a | yes |
| <a name="input_nonprod_backend"></a> [nonprod\_backend](#input\_nonprod\_backend) | n/a | <pre>object({<br>    resource_group_name  = string<br>    storage_account_name = string<br>    state_container_name = string<br>    plan_container_name  = string<br>  })</pre> | n/a | yes |
| <a name="input_prod_backend"></a> [prod\_backend](#input\_prod\_backend) | n/a | <pre>object({<br>    resource_group_name  = string<br>    storage_account_name = string<br>    state_container_name = string<br>    plan_container_name  = string<br>  })</pre> | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->