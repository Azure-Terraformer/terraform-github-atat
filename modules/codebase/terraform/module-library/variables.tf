variable "repository" {
  type = string
}
variable "branch" {
  type = string
}
variable "path" {
  type    = string
  default = "modules"
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
}
variable "module_path" {
  type = string
}