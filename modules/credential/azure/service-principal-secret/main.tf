resource "github_actions_environment_variable" "subscription_id" {
  repository    = var.repository
  environment   = var.environment
  variable_name = var.subscription_id_label
  value         = var.subscription_id
}
resource "github_actions_environment_variable" "tenant_id" {
  repository    = var.repository
  environment   = var.environment
  variable_name = var.tenant_id_label
  value         = var.tenant_id
}
resource "github_actions_environment_variable" "client_id" {
  repository    = var.repository
  environment   = var.environment
  variable_name = var.client_id_label
  value         = var.client_id
}
resource "github_actions_environment_secret" "client_secret" {
  repository      = var.repository
  environment     = var.environment
  secret_name     = var.client_secret_label
  plaintext_value = var.client_secret
}