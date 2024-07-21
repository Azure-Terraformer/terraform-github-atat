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