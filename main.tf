
data "github_user" "current" {
  username = ""
}

resource "github_repository" "main" {

  name        = var.repository_name
  description = "My awesome codebase"

  visibility = "private"
  auto_init  = true

}

module "atat" {

  source  = "Azure-Terraformer/atat-application-environment/github"
  version = "1.0.1"

  application_name  = var.repository_name
  repository_name   = github_repository.main.name
  commit_user       = var.commit_user
  environments      = local.extended_environments
  terraform_version = "1.9.8"

}

locals {
  extended_environments = {
    for key, value in var.environments : key => {
      subscription_id = value.subscription_id
      branch_name     = value.branch_name
      reviewers       = []
      tenant_id       = data.azuread_client_config.current.tenant_id
      client_id       = module.github_identity[key].application.client_id
      backend         = local.backends[key]
    }
  }
}
