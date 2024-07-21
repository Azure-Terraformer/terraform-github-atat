resource "github_actions_environment_variable" "resource_group_name" {
  repository    = var.repository
  environment   = var.environment
  variable_name = var.resource_group_name_label
  value         = var.resource_group_name
}
resource "github_actions_environment_variable" "storage_account_name" {
  repository    = var.repository
  environment   = var.environment
  variable_name = var.storage_account_name_label
  value         = var.storage_account_name
}
resource "github_actions_environment_variable" "container_name" {
  repository    = var.repository
  environment   = var.environment
  variable_name = var.container_name_label
  value         = var.container_name
}