
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
  terraform_working_directory      = module.codebase.terraform_path
  delay_after_environment_creation = 10
  environments                     = local.extended_environments

  depends_on = [github_branch_default.default]

}

resource "github_actions_environment_variable" "gallery_name" {

  for_each = local.extended_environments

  repository    = var.repository_name
  environment   = each.key
  variable_name = "PACKER_COMPUTE_GALLERY_NAME"
  value         = var.environments[each.key].gallery.name

  depends_on = [module.github_environments]

}

resource "github_actions_environment_variable" "gallery_resource_group" {

  for_each = var.environments

  repository    = var.repository_name
  environment   = each.key
  variable_name = "PACKER_COMPUTE_GALLERY_RESOURCE_GROUP"
  value         = var.environments[each.key].gallery.resource_group

  depends_on = [module.github_environments]

}


resource "github_actions_environment_variable" "managed_image_destination" {

  for_each = var.environments

  repository    = var.repository_name
  environment   = each.key
  variable_name = "PACKER_MANAGED_IMAGE_DESTINATION"
  value         = var.environments[each.key].managed_image_destination

  depends_on = [module.github_environments]

}
