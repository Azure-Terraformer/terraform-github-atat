variable "application_name" {
  type = string
}
variable "github_organization" {
  type = string
}
variable "repository_name" {
  type = string
}
variable "repository_visibility" {
  type = string
}
variable "repository_description" {
  type = string
}
variable "commit_user" {

}
variable "environments" {
  type = map(object({
    subscription_id = string
    branch_name     = string
    reviewing_users = list(string)
    reviewing_teams = list(string)
    backend = object({
      resource_group_name  = string
      storage_account_name = string
      state_container_name = string
      plan_container_name  = string
    })
  }))
}
variable "terraform_version" {
  type    = string
  default = "1.9.8"
}
variable "delete_branch_on_merge" {
  type    = bool
  default = true
}
variable "delay_after_environment_creation" {
  type    = number
  default = 10
}
variable "primary_location" {
  type = string
}
variable "os_type" {
  type = string
}
variable "core_name" {
  type = string
}
variable "root_namespace" {
  type = string
}
