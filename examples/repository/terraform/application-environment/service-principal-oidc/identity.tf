data "azuread_client_config" "current" {}

resource "azuread_application" "identity" {

  for_each = var.environments

  display_name = "${var.application_name}-${each.key}-identity-${random_string.main.result}"

}

resource "azuread_service_principal" "identity" {

  for_each = var.environments

  client_id                    = azuread_application.identity[each.key].client_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]

}

resource "azurerm_resource_group" "identity" {

  for_each = var.environments

  name     = "rg-${var.application_name}-${each.key}-identity-${random_string.main.result}"
  location = var.location
}

resource "azurerm_user_assigned_identity" "identity" {

  for_each = var.environments

  name                = "mi-terraform-${each.key}-${random_string.main.result}"
  location            = azurerm_resource_group.identity[each.key].location
  resource_group_name = azurerm_resource_group.identity[each.key].name

}

resource "azuread_application_federated_identity_credential" "identity" {

  for_each = var.environments

  application_id = azuread_application.identity[each.key].id
  display_name   = "${var.application_name}-${each.key}-identity-${random_string.main.result}"
  description    = "Deployments for my-repo"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:markti/${var.name}:environment:${each.key}"
}

data "azurerm_subscription" "main" {

  for_each = var.environments

  subscription_id = each.value

}

resource "azurerm_role_assignment" "main" {

  for_each = var.environments

  scope                = data.azurerm_subscription.main[each.key].id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.identity[each.key].object_id

}
