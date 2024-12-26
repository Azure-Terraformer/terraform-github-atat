module "app" {

  source = "../../modules/azure-fn-app"

  application_name       = var.application_name
  github_organization    = var.github_organization
  repository_name        = var.github_repository_name
  repository_description = var.github_repository_description
  repository_visibility  = var.github_repository_visibility
  terraform_version      = var.terraform_version
  primary_location       = "eastus2"
  os_type                = "Windows"
  core_name              = "qonq-core"
  root_namespace         = var.root_namespace

  commit_user = {
    name  = var.github_username
    email = var.github_email
  }

  environments = {
    dev = {
      subscription_id = var.azure_nonprod_subscription
      branch_name     = "develop"
      reviewing_teams = []
      reviewing_users = []
      backend         = var.nonprod_backend
    }
    test = {
      subscription_id = var.azure_nonprod_subscription
      branch_name     = "release"
      reviewing_teams = []
      reviewing_users = []
      backend         = var.nonprod_backend
    }
    prod = {
      subscription_id = var.azure_prod_subscription
      branch_name     = "main"
      reviewing_teams = []
      reviewing_users = []
      backend         = var.prod_backend
    }
  }

}
