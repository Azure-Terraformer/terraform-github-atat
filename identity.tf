data "azuread_client_config" "current" {}

resource "random_string" "main" {
  length  = 8
  upper   = false
  special = false
}

module "github_identity" {

  source  = "Azure-Terraformer/github-credential/azuread"
  version = "1.0.8"

  for_each = var.environments

  github_organization = var.github_organization
  repository_name     = var.repository_name
  entity_type         = "environment"
  environment_name    = each.key
  owners              = [data.azuread_client_config.current.object_id]

}

data "azurerm_subscription" "main" {

  for_each = var.environments

  subscription_id = each.value.subscription_id

}

resource "azurerm_role_assignment" "main" {

  for_each = var.environments

  scope                = data.azurerm_subscription.main[each.key].id
  role_definition_name = "Contributor"
  principal_id         = module.github_identity[each.key].service_principal.object_id

}
