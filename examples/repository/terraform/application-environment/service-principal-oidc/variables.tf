variable "name" {
  type = string
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
}
variable "location" {
  type = string
}
variable "application_name" {
  type = string
}
variable "environments" {
  type = map(string)
}