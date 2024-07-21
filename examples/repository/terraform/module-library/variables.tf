variable "name" {
  type = string
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
}
variable "environment" {
  type = object({
    subscription_id = string
    tenant_id       = string
    client_id       = string
    client_secret   = string
  })
}
variable "modules" {
  type = map
}