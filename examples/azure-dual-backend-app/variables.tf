variable "application_name" {
  type = string
}
variable "github_organization" {
  type = string
}
variable "github_repository_name" {
  type = string
}
variable "github_repository_visibility" {
  type = string
}
variable "github_repository_description" {
  type = string
}
variable "github_username" {
  type = string
}
variable "github_email" {
  type = string
}
variable "azure_dev_subscription" {
  type = string
}
variable "azure_prod_subscription" {
  type = string
}
variable "terraform_version" {
  type = string
}
variable "nonprod_backend" {
  type = object({
    resource_group_name  = string
    storage_account_name = string
    state_container_name = string
    plan_container_name  = string
  })
}
variable "prod_backend" {
  type = object({
    resource_group_name  = string
    storage_account_name = string
    state_container_name = string
    plan_container_name  = string
  })
}
