variable "application_name" {
  type        = string
  description = "The name of the application."
}
variable "github_organization" {
  type        = string
  description = "The GitHub organization where the repository will be created."
}
variable "repository_name" {
  type        = string
  description = "The name of the GitHub repository."
}
variable "repository_visibility" {
  type        = string
  description = "The visibility level of the GitHub repository (e.g., 'public' or 'private')."
}
variable "repository_description" {
  type        = string
  description = "A brief description of the GitHub repository."
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
    reviewing_users = list(string)
    reviewing_teams = list(string)
    backend = object({
      resource_group_name  = string
      storage_account_name = string
      state_container_name = string
      plan_container_name  = string
    })
  }))
  description = "A map of environments, each containing configuration details such as subscription ID, branch name, reviewing users and teams, and backend settings."
}
variable "terraform_version" {
  type        = string
  default     = "1.9.8"
  description = "The version of Terraform to use for this module."
}
variable "delete_branch_on_merge" {
  type        = bool
  default     = true
  description = "Determines whether to automatically delete feature branches after they are merged."
}
variable "delay_after_environment_creation" {
  type        = number
  default     = 10
  description = "The delay in seconds to wait after creating an environment before proceeding."
}
variable "primary_location" {
  type        = string
  description = "The primary geographical location where resources will be deployed."
}
variable "os_type" {
  type        = string
  description = "The operating system type for the resources (e.g., 'linux', 'windows')."
}
variable "core_name" {
  type        = string
  description = "The core name used for referencing foundational components from this project."
}
variable "root_namespace" {
  type        = string
  description = "The root namespace under which all classes will be organized within the .NET solution."
}
