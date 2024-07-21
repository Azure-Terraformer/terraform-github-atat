data "azurerm_client_config" "current" {
}

resource "random_string" "main" {
  length  = 8
  upper   = false
  special = false
}

locals {
  extended_environments = {
    for key, value in var.environments : key => {
      subscription_id = value
      tenant_id       = module.sp[key].tenant_id
      client_id       = module.sp[key].application.client_id
      client_secret   = module.sp[key].service_principal.client_secret
      backend         = local.backends[key]
    }
  }
}

module "repo" {

  source  = "Azure-Terraformer/atat/github//modules/repository/terraform/application-environment/service-principal-secret"
  version = "1.0.1"

  application_name = var.application_name
  name             = var.github_repo
  commit_user      = var.commit_user
  environments     = local.extended_environments

}