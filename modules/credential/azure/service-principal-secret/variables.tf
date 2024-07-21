variable "repository" {
  type = string
}
variable "environment" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}
variable "subscription_id_label" {
  type    = string
  default = "ARM_SUBSCRIPTION_ID"
}
variable "tenant_id_label" {
  type    = string
  default = "ARM_TENANT_ID"
}
variable "client_id_label" {
  type    = string
  default = "ARM_CLIENT_ID"
}
variable "client_secret_label" {
  type    = string
  default = "ARM_CLIENT_SECRET"
}