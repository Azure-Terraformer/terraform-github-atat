variable "application_name" {
  type        = string
  description = "The name of the application to be deployed. This name is used for resource identification and naming conventions within the infrastructure."
}
variable "github_organization" {
  type        = string
  description = "The GitHub organization under which the repository will be created. This should be the exact name of the GitHub organization."
}
variable "github_repository_name" {
  type        = string
  description = "The name of the GitHub repository to be created. This name should be unique within the specified GitHub organization."
}
variable "github_repository_visibility" {
  type        = string
  description = "The visibility level of the GitHub repository. Accepted values are 'public', 'private', or 'internal'. Determines who can view and access the repository."

  validation {
    condition     = contains(["public", "private", "internal"], var.github_repository_visibility)
    error_message = "github_repository_visibility must be either 'public', 'private', or 'internal'."
  }
}
variable "github_repository_description" {
  type        = string
  description = "A brief description of the GitHub repository. This helps in understanding the purpose and scope of the repository."
}
variable "github_username" {
  type        = string
  description = "The GitHub username that will be used for committing changes to the repository. Ensure this account has the necessary permissions within the GitHub organization."
}
variable "github_email" {
  type        = string
  description = "The email address associated with the GitHub account used for committing changes. This is used to attribute commits to the correct user."

  validation {
    condition     = can(regex("^\\S+@\\S+\\.\\S+$", var.github_email))
    error_message = "github_email must be a valid email address."
  }
}
variable "azure_dev_subscription" {
  type        = string
  description = "The Azure Subscription ID for the development environment where non-production resources will be provisioned."
}
variable "azure_prod_subscription" {
  type        = string
  description = "The Azure Subscription ID for the production environment where production resources will be provisioned."
}
variable "terraform_version" {
  type        = string
  description = "Specifies the version of Terraform to use for the deployment. Defaults to '1.9.8'. It is recommended to use this version to ensure compatibility."
}
variable "nonprod_backend" {
  type = object({
    resource_group_name  = string
    storage_account_name = string
    state_container_name = string
    plan_container_name  = string
  })
  description = "Configuration for the backend storage used in the non-production environment. Includes resource group, storage account, and container names for Terraform state and plans."
}
variable "prod_backend" {
  type = object({
    resource_group_name  = string
    storage_account_name = string
    state_container_name = string
    plan_container_name  = string
  })
  description = "Configuration for the backend storage used in the production environment. Includes resource group, storage account, and container names for Terraform state and plans."
}
