resource "random_string" "repository_name" {
  length  = 6
  special = false
  upper   = false
}

output "repository_name_suffix" {
  value = random_string.repository_name.result
}
