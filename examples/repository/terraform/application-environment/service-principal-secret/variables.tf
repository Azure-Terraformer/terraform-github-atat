variable "name" {
  type        = string
  description = <<DESCRIPTION
  The name of the GitHub repository.
DESCRIPTION
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
  description = <<DESCRIPTION
  The identity of the user that will be used to commit changes to the repository.
DESCRIPTION
}
variable "environments" {
  type        = map(string)
  description = <<DESCRIPTION
  A map of environment names corresponding to Azure Subscription IDs.
DESCRIPTION
}