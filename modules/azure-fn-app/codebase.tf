module "terraform_codebase" {

  source  = "Azure-Terraformer/codebase-terraform-azure-fn-app/github"
  version = "1.0.11"

  repository       = var.repository_name
  branch           = github_branch.main.branch
  path             = "src/terraform"
  commit_user      = var.commit_user
  primary_location = var.primary_location
  os_type          = var.os_type
  core_name        = var.core_name

}

module "dotnet_codebase" {

  source  = "Azure-Terraformer/codebase-terraform-azure-fn-app-dotnet/github"
  version = "1.0.13"

  repository     = var.repository_name
  branch         = github_branch.main.branch
  path           = "src/dotnet"
  commit_user    = var.commit_user
  root_namespace = var.root_namespace

}
