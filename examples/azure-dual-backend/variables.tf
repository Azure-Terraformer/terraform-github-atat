variable "name" {
  type        = string
  description = "The name of the environment to create."
}
variable "location" {
  type        = string
  description = "The geographical location where the resources will be deployed."
}
variable "azure_nonprod_subscription" {
  type        = string
  description = "The Azure Subscription ID where the Non-PROD Terraform State Backend will be provisioned."
}
variable "azure_prod_subscription" {
  type        = string
  description = "The Azure Subscription ID where the PROD Terraform State Backend will be provisioned."
}
