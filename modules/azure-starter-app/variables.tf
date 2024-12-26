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
  description = "Specifies the version of Terraform to use for the deployment."
}
variable "delete_branch_on_merge" {
  type        = bool
  default     = true
  description = "The setting that controls whether the GitHub repository deletes the feature branch automatically after the merge."
}
