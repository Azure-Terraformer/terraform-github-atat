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
variable "github_username" {
  type        = string
  description = <<DESCRIPTION
  The GitHub username that will be used for committing changes to the repository. Ensure this account has the necessary permissions within the GitHub organization."
DESCRIPTION
}
variable "github_email" {
  type        = string
  description = <<DESCRIPTION
  The email address associated with the GitHub account used for committing changes. This is used to attribute commits to the correct user."
DESCRIPTION

  validation {
    condition     = can(regex("^\\S+@\\S+\\.\\S+$", var.github_email))
    error_message = "GitHub Email must be a valid email address."
  }
}
variable "terraform_version" {
  type        = string
  description = "Specifies the version of Terraform to use for the deployment."
}
variable "location" {
  type        = string
  description = "The Azure region where the Terraform State Backends will be provisioned."
}
variable "azure_nonprod_subscription" {
  type        = string
  description = "The Azure Subscription ID for the non-production environment where non-production resources will be provisioned."
}
variable "azure_prod_subscription" {
  type        = string
  description = "The Azure Subscription ID for the production environment where production resources will be provisioned."
}
