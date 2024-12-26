output "nonprod" {
  value = module.backend_nonprod.backend_config

  description = <<DESCRIPTION
  The backend configuration for the Non-Production environment.

  This configuration includes:
    - **resource_group_name** (string): The name of the Azure Resource Group where the storage account resides.
    - **storage_account_name** (string): The name of the Azure Storage Account used to store Terraform state and plan files.
    - **state_container_name** (string): The name of the Azure Storage Container specifically for Terraform state files (`tfstate`).
    - **plan_container_name** (string): The name of the Azure Storage Container specifically for Terraform plan files (`tfplan`).

  This output is utilized by Terraform to manage the state and plan files securely within Azure for the Non-Production environment.
DESCRIPTION

}

output "prod" {
  value = module.backend_prod.backend_config

  description = <<DESCRIPTION
  The backend configuration for the Production environment.

  This configuration includes:
    - **resource_group_name** (string): The name of the Azure Resource Group where the storage account resides.
    - **storage_account_name** (string): The name of the Azure Storage Account used to store Terraform state and plan files.
    - **state_container_name** (string): The name of the Azure Storage Container specifically for Terraform state files (`tfstate`).
    - **plan_container_name** (string): The name of the Azure Storage Container specifically for Terraform plan files (`tfplan`).

  This output is utilized by Terraform to manage the state and plan files securely within Azure for the Production environment.
DESCRIPTION

}
