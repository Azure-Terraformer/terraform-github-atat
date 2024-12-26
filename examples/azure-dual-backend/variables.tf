variable "name" {
  type        = string
  description = <<DESCRIPTION
  The name of the environment containing dual Terraform State Backends that you'd like to create.
DESCRIPTION
}
variable "location" {
  type        = string
  description = "The Azure region where the Terraform State Backends will be provisioned."
}
variable "azure_nonprod_subscription" {
  type        = string
  description = "The Azure Subscription ID where the Non-PROD Terraform State Backend will be provisioned."
}
variable "azure_prod_subscription" {
  type        = string
  description = "The Azure Subscription ID where the PROD Terraform State Backend will be provisioned."
}
