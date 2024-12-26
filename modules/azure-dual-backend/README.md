The Azure Dual Backend refers to a Terraform module designed to provision a Terraform state backend across two separate Azure regions. This setup enhances the resilience, availability, and reliability of your Terraform state management by providing redundancy and geographic distribution. Here's an in-depth look at what the Azure Dual Backend entails, its benefits, and guidance on how to implement it.

You probably only need one Terraform State Backend per Subscription as the Subscription is the most common RBAC boundary. You should compartmentalize your workloads into Subscriptions and use the Subscription's RBAC boundary to protect your environment.

You should carefully gaurd access to the following Role Definitions:

- `Storage Blob Data Owner`
- `Storage Blob Data Contributor`
- `Storage Blob Data Reader`

These Built-in Role Definitions will grant read access to your Terraform State Backend thus allowing users possessing these permissions to read the Terraform State files stored within. Terraform State files may contain sensitive and even secret data. As a result, they should be consisdered secrets themselves.

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
| <a name="module_backend_nonprod"></a> [backend\_nonprod](#module\_backend\_nonprod) | Azure-Terraformer/terraform-backend/azurerm | 1.0.4 |
| <a name="module_backend_prod"></a> [backend\_prod](#module\_backend\_prod) | Azure-Terraformer/terraform-backend/azurerm | 1.0.4 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Terraform State Backends will be provisioned. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the environment containing dual Terraform State Backends that you'd like to create. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nonprod"></a> [nonprod](#output\_nonprod) | n/a |
| <a name="output_prod"></a> [prod](#output\_prod) | n/a |
<!-- END_TF_DOCS -->