resource "github_repository_environment" "main" {

  environment = "test"
  repository  = github_repository.main.name

  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

}

resource "github_actions_environment_variable" "terraform_version" {

  repository    = github_repository.main.name
  environment   = github_repository_environment.main.environment
  variable_name = "TERRAFORM_VERSION"
  value         = var.terraform_version
}

/*
resource "github_actions_environment_variable" "terraform_working_directory" {

  repository    = github_repository.main.name
  environment   = github_repository_environment.main.environment
  variable_name = "TERRAFORM_WORKING_DIRECTORY"
  value         = module.terraform_simple_codebase.path

}
*/

module "azure_credential" {

  source = "../../../credential/azure/service-principal"

  repository      = github_repository.main.name
  environment     = github_repository_environment.main.environment
  subscription_id = var.environment.subscription_id
  tenant_id       = var.environment.tenant_id
  client_id       = var.environment.client_id
  client_secret   = var.environment.client_secret

  client_id_label     = "TERRAFORM_ARM_CLIENT_ID"
  client_secret_label = "TERRAFORM_ARM_CLIENT_SECRET"

}