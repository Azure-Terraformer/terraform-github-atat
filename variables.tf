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
  }))
}
variable "terraform_version" {
  type    = string
  default = "1.9.8"
}
