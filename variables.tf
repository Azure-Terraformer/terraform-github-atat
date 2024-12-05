variable "github_organization" {
  type = string
}
variable "repository_name" {
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
