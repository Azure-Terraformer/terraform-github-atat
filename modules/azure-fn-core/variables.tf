variable "application_name" {
  type        = string
  description = "The name of the application to be deployed."
}
variable "github_organization" {
  type        = string
  description = "The name of the GitHub organization where the repository will be created."
}
variable "repository_name" {
  type        = string
  description = "The name of the GitHub repository."
}
variable "repository_visibility" {
  type        = string
  description = "The visibility level of the GitHub repository. Allowed values are 'public', 'private', or 'internal'."
}
variable "repository_description" {
  type = string
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
  description = "The user information for committing changes to the repository, including name and email."
}
variable "environments" {
  type = map(object({
    subscription_id = string
    branch_name     = string
    backend = object({
      resource_group_name  = string
      storage_account_name = string
      state_container_name = string
      plan_container_name  = string
    })
  }))
  description = "A map of environment configurations, each containing subscription details, branch names, and backend storage settings."
}
variable "terraform_version" {
  type        = string
  default     = "1.9.8"
  description = "Specifies the version of Terraform to use. Defaults to '1.9.8'."
}
variable "delete_branch_on_merge" {
  type        = bool
  default     = true
  description = "Determines whether to delete the Git branch after a merge is completed. Defaults to true."
}
variable "delay_after_environment_creation" {
  type        = number
  default     = 10
  description = "The delay in seconds after creating an environment before proceeding with further operations. Defaults to 10 seconds."
}
variable "primary_location" {
  type        = string
  description = "The primary geographical location where resources will be deployed."
}
variable "os_type" {
  type        = string
  description = "The operating system type for the deployed resources. Examples include 'linux' or 'windows'."
}
variable "sku_name" {
  type        = string
  description = "The SKU name defining the pricing tier or performance level of the resources."
}
variable "retention_in_days" {
  type        = number
  description = "The number of days to retain logs, backups, or other data before automatic deletion."
}
