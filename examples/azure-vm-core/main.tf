module "app" {

  source = "../../modules/azure-vm-core"

  application_name       = var.application_name
  github_organization    = var.github_organization
  repository_name        = var.repository_name
  repository_description = var.repository_description
  repository_visibility  = var.repository_visibility
  terraform_version      = var.terraform_version
  location               = "eastus2"

  commit_user = {
    name  = var.github_username
    email = var.github_email
  }

  environments = {
    dev = {
      subscription_id = var.azure_nonprod_subscription
      branch_name     = "develop"
      backend         = var.nonprod_backend
    }
    prod = {
      subscription_id = var.azure_prod_subscription
      branch_name     = "main"
      backend         = var.prod_backend
    }
  }

}
