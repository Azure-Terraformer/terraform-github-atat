data "azuread_client_config" "current" {}

module "sp" {

  for_each = var.environments

  source  = "markti/azure-terraformer/azuread//modules/service-principal"
  version = "1.0.1"
  name    = "sp-terraform-${random_string.main.result}"

}

data azurerm_subscription "main" {

  for_each = var.environments

  subscription_id = each.value

}

resource "azurerm_role_assignment" "main" {

  for_each = var.environments
  
  scope                = data.azurerm_subscription.main[each.key].id
  role_definition_name = "Contributor"
  principal_id         = module.sp[each.key].service_principal.object_id

}
