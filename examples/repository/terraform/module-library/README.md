### TFVARS File: `terraform.tfvars`

1. **`name`**: This remains unchanged. It's a string representing the name of your module-library repository.
   ```
   name = "terraform-azurerm-sample-module-library"
   ```

2. **`commit_user`**: This object also remains unchanged, containing the `name` and `email` of the committing user.
   ```
   commit_user = {
     name  = "Azure Terraformer"
     email = "foo@bar.com"
   }
   ```

3. **`environment`**: Given the revised structure, this object now only contains Azure credentials without the backend configuration.
   - **`subscription_id`, `tenant_id`, `client_id`, `client_secret`**: These are your Azure credentials.
   For example:
   ```
   environment = {
     subscription_id = "foo"
     tenant_id       = "foo"
     client_id       = "foo"
     client_secret   = "foo"
   }
   ```

4. **`modules`**: This section remains as it was, defining a map of modules.
   ```
   modules = {
     "foo" = "foo"
     "bar" = "bar"
   }
   ```

### Module Declaration: `main.tf`

In your Terraform configuration file (`main.tf`), the module block will reference these variables as follows:

```
module "azure-terraformer" {
  source  = "markti/azure-terraformer/github//modules/repository/terraform/module-library"
  version = "1.0.1"

  name        = var.name
  commit_user = var.commit_user
  environment = var.environment
  modules     = var.modules

}
```

In this declaration:
- `source` points to the location of your module-library.
- `name`, `commit_user`, `environment`, and `modules` are set to the respective variables from your `tfvars` file.

With this setup, the `environment` variable in your module now correctly aligns with the updated structure in the `tfvars` file. Run `terraform init` to initialize the Terraform configuration and `terraform apply` to apply it with these updated variables. Ensure that your `terraform.tfvars` file is correctly formatted and accessible to Terraform.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_repo"></a> [repo](#module\_repo) | ../../../../modules/repository/terraform/module-library | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) |  | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) |  | <pre>object({<br>    subscription_id = string<br>    tenant_id       = string<br>    client_id       = string<br>    client_secret   = string<br>  })</pre> | n/a | yes |
| <a name="input_modules"></a> [modules](#input\_modules) |  | `map(any)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) |  | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->