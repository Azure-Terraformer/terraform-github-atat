# Documentation for `application-environment` Module's TFVARS File and Module Declaration

### Structure of `terraform.tfvars`

1. **`name`**:
   - **Type**: String
   - **Description**: Name of the Terraform environment.
   - **Example**: `name = "terraform-azurerm-aks"`

2. **`commit_user`**:
   - **Type**: Object
   - **Description**: User details for committing to the repository.
   - **Example**:
     ```hcl
     commit_user = {
       name  = "Azure Terraformer"
       email = "foo@bar.com"
     }
     ```

3. **`environments`**:
   - **Type**: Map of Objects
   - **Description**: Configuration for each environment (e.g., 'dev', 'prod').
   - **Example**:
     ```hcl
     environments = {
       "dev" = {
         // Azure credentials and backend configuration
       }
       "prod" = {
         // Azure credentials and backend configuration
       }
     }
     ```

### Module Declaration: `main.tf`

The module declaration in your Terraform configuration (`main.tf`) should reference the variables defined in your `tfvars` file.

```hcl
module "repo" {
  
  source  = "markti/azure-terraformer/github//modules/repository/terraform/application-environment"
  version = "1.0.1"

  application_name = "aztflab"
  name             = var.name
  commit_user      = var.commit_user
  environments     = var.environments

}
```

In this declaration:

- `source` points to the location of your `application-environment` module.
- `application_name` is set to a static value (`"aztflab"` in this case). This should be changed based on your application's requirements.
- `name`, `commit_user`, and `environments` are set to the respective variables from your `tfvars` file (`var.name`, `var.commit_user`, etc.).

### Usage Instructions

1. Fill in the `tfvars` file with appropriate values for your Azure environment.
2. Update the `main.tf` file with the module declaration, ensuring the `source` and `application_name` are correctly set.
3. Execute Terraform commands like `terraform plan` and `terraform apply` to deploy and manage your Azure resources according to the configurations in these files.

By following these instructions, you can effectively use the `application-environment` module to manage your Azure infrastructure across different environments as defined in your `tfvars` file.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.47.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 2.47.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend_dev"></a> [backend\_dev](#module\_backend\_dev) | markti/azure-terraformer/azurerm//modules/terraform/backend/baseline | 1.0.16 |
| <a name="module_backend_prod"></a> [backend\_prod](#module\_backend\_prod) | markti/azure-terraformer/azurerm//modules/terraform/backend/baseline | 1.0.16 |
| <a name="module_repo"></a> [repo](#module\_repo) | ../../../../../modules/repository/terraform/application-environment/service-principal-secret | n/a |
| <a name="module_sp"></a> [sp](#module\_sp) | markti/azure-terraformer/azuread//modules/service-principal | 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | n/a | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_environments"></a> [environments](#input\_environments) | n/a | `map(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->