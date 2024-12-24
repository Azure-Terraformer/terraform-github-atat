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
| <a name="module_backend"></a> [backend](#module\_backend) | ../../modules/azure-dual-backend | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_nonprod_subscription"></a> [azure\_nonprod\_subscription](#input\_azure\_nonprod\_subscription) | The Azure Subscription ID where the Non-PROD Terraform State Backend will be provisioned. | `string` | n/a | yes |
| <a name="input_azure_prod_subscription"></a> [azure\_prod\_subscription](#input\_azure\_prod\_subscription) | The Azure Subscription ID where the PROD Terraform State Backend will be provisioned. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The geographical location where the resources will be deployed. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the environment to create. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->