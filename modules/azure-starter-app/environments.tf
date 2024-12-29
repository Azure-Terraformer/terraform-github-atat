locals {
  extended_environments = {
    for key, value in var.environments : key => {
      subscription_id = value.subscription_id
      tenant_id       = data.azuread_client_config.current.tenant_id
      client_id       = module.github_identity[key].application.client_id
      branch_name     = value.branch_name
      reviewers       = []
      backend         = value.backend
    }
  }
}

module "github_environments" {
  source  = "Azure-Terraformer/environment-terraform-azure/github"
  version = "1.0.3"

  repository_name                  = var.repository_name
  terraform_version                = var.terraform_version
  terraform_working_directory      = module.codebase.path
  delay_after_environment_creation = 10
  environments                     = local.extended_environments

}
