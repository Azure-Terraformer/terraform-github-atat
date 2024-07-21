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

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_environment_variable.client_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |
| [github_actions_environment_variable.subscription_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |
| [github_actions_environment_variable.tenant_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_client_id_label"></a> [client\_id\_label](#input\_client\_id\_label) | n/a | `string` | `"ARM_CLIENT_ID"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id_label"></a> [subscription\_id\_label](#input\_subscription\_id\_label) | n/a | `string` | `"ARM_SUBSCRIPTION_ID"` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_tenant_id_label"></a> [tenant\_id\_label](#input\_tenant\_id\_label) | n/a | `string` | `"ARM_TENANT_ID"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->