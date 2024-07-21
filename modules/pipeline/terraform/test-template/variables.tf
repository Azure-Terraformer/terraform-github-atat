variable "repository" {
  type = string
}
variable "branch" {
  type = string
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
}