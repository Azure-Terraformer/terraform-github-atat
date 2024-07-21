resource "github_repository_environment" "main" {

  for_each = var.environments

  environment = each.key
  repository  = github_repository.main.name

  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

}

resource "github_actions_environment_variable" "terraform_version" {

  for_each = var.environments

  repository    = github_repository.main.name
  environment   = each.key
  variable_name = "TERRAFORM_VERSION"
  value         = var.terraform_version
}

resource "github_actions_environment_variable" "environment_name" {

  for_each = var.environments

  repository    = github_repository.main.name
  environment   = each.key
  variable_name = "ENVIRONMENT_NAME"
  value         = each.key

}

resource "github_actions_environment_variable" "terraform_working_directory" {

  for_each = var.environments

  repository    = github_repository.main.name
  environment   = each.key
  variable_name = "TERRAFORM_WORKING_DIRECTORY"
  value         = module.terraform_simple_codebase.path

}

module "azure_credential" {

  source = "../../../../credential/azure/service-principal-oidc"

  for_each = var.environments

  repository      = github_repository.main.name
  environment     = each.key
  subscription_id = each.value.subscription_id
  tenant_id       = each.value.tenant_id
  client_id       = each.value.client_id

  client_id_label = "TERRAFORM_ARM_CLIENT_ID"

}

module "azure_backend" {

  source = "../../../../backend/azure/blob-storage"

  for_each = var.environments

  repository  = github_repository.main.name
  environment = each.key

  resource_group_name  = each.value.backend.resource_group_name
  storage_account_name = each.value.backend.storage_account_name
  container_name       = each.value.backend.container_name

}