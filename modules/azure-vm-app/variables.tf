variable "application_name" {
  type        = string
  description = <<DESCRIPTION
  The name of the application to be deployed. This name is used for resource identification and naming conventions within the infrastructure.

  It's best to keep this short and simple while also ensuring it is easily identifiable and relatively unique within your organization (or at least within the Subscriptions you are targetting).
DESCRIPTION
}
variable "github_organization" {
  type        = string
  description = <<DESCRIPTION
  The GitHub organization under which the repository will be created. This should be the exact name of the GitHub organization.
DESCRIPTION
}
variable "repository_name" {
  type        = string
  description = <<DESCRIPTION
  The name of the GitHub repository to be created. This name should be unique within the specified GitHub organization.

  The GitHub repository name should correlate to the `application_name` as it will contain the source code for the infrastructure 
  that is provisioned to Azure.
DESCRIPTION
}
variable "repository_visibility" {
  type        = string
  description = "The visibility level of the GitHub repository. Accepted values are 'public', 'private', or 'internal'. Determines who can view and access the repository."

  validation {
    condition     = contains(["public", "private", "internal"], var.repository_visibility)
    error_message = "GitHub Repository visibility must be either 'public', 'private', or 'internal'."
  }
}
variable "repository_description" {
  type        = string
  description = <<DESCRIPTION
  A brief description of the GitHub repository. This helps in understanding the purpose and scope of the repository.

  This should describe the workload represented by the `application_name`.
DESCRIPTION
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
    gallery = object({
      name           = string
      resource_group = string
    })
    managed_image_destination = string
  }))
  description = <<DESCRIPTION
  Configuration for each of the environments for this application.

  Each Environment has a name which is supplied by the key of the map. 
  Each Environment has a long-lived environment on the specified `branch_name`.
  Each Environment can be provisioned within the context of an Azure Subscription specified by `subscription_id`.
  Each Environment can have its own Terraform State Backend configuration which consists of an Azure Storage Account and containers for both state files and plan files.
DESCRIPTION
}
variable "terraform_version" {
  type        = string
  default     = "1.9.8"
  description = "Specifies the version of Terraform to use. Defaults to '1.9.8'."
}
variable "delete_branch_on_merge" {
  type        = bool
  default     = true
  description = "The setting that controls whether the GitHub repository deletes the feature branch automatically after the merge."
}
variable "delay_after_environment_creation" {
  type        = number
  default     = 10
  description = <<DESCRIPTION
  GitHub Environments have a glitch that causes them to not be available immediately after creation is reported. Environment variables 
  will fail unless there is some time granted to allow for the Environment creation to complete. This setting adds a fixed amount of time
  after the creation of the environment before provisioning additional resources.
DESCRIPTION
}
variable "location" {
  type        = string
  description = <<DESCRIPTION
  The primary Azure region where the Azure Functions Core Environment will be provisioned."
DESCRIPTION
}
variable "image_names" {
  type = list(string)
}
variable "vm_size" {
  type = string
}
variable "packer_version" {
  type = string
}
variable "base_address_space" {
  type = string
}
