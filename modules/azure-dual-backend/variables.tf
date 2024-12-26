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
