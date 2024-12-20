module "app" {

  source = "../../modules/azure-fn-core"

  application_name       = var.application_name
  github_organization    = var.github_organization
  repository_name        = var.github_repository_name
  repository_description = var.github_repository_description
  repository_visibility  = var.github_repository_visibility
  terraform_version      = var.terraform_version
  primary_location       = "eastus2"
  os_type                = "Windows"
  sku_name               = "Y1"
  retention_in_days      = 30

  commit_user = {
    name  = var.github_username
    email = var.github_email
  }

  environments = {
    dev = {
      subscription_id = var.azure_dev_subscription
      branch_name     = "develop"
      backend         = var.nonprod_backend
    }
    test = {
      subscription_id = var.azure_dev_subscription
      branch_name     = "release"
      backend         = var.nonprod_backend
    }
    prod = {
      subscription_id = var.azure_prod_subscription
      branch_name     = "main"
      backend         = var.prod_backend
    }
  }

}
