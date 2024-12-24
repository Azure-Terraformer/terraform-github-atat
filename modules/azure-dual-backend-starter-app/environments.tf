locals {
  extended_environments = {
    for key, value in var.environments : key => {
      subscription_id = value.subscription_id
      branch_name     = value.branch_name
      reviewers       = []
      tenant_id       = data.azuread_client_config.current.tenant_id
      client_id       = module.github_identity[key].application.client_id
      backend         = value.backend
    }
  }
}

module "atat" {

  source  = "Azure-Terraformer/atat-application-environment/github"
  version = "1.0.5"

  application_name  = var.application_name
  repository_name   = github_repository.main.name
  commit_user       = var.commit_user
  environments      = local.extended_environments
  terraform_version = var.terraform_version

}
