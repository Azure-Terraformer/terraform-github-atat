variable "name" {
  type        = string
  description = <<DESCRIPTION

DESCRIPTION
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
  description = <<DESCRIPTION

DESCRIPTION
}
variable "environment" {
  type = object({
    subscription_id = string
    tenant_id       = string
    client_id       = string
    client_secret   = string
  })
  description = <<DESCRIPTION

DESCRIPTION
}
variable "modules" {
  type        = map(any)
  description = <<DESCRIPTION

DESCRIPTION
}