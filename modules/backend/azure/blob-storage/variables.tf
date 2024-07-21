variable "repository" {
  type = string
}
variable "environment" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "storage_account_name" {
  type = string
}
variable "container_name" {
  type = string
}
variable "resource_group_name_label" {
  type    = string
  default = "BACKEND_RESOURCE_GROUP_NAME"
}
variable "storage_account_name_label" {
  type    = string
  default = "BACKEND_STORAGE_ACCOUNT_NAME"
}
variable "container_name_label" {
  type    = string
  default = "BACKEND_STORAGE_CONTAINER_NAME"
}