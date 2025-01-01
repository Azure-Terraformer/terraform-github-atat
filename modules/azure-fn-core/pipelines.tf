# Local to convert to map(string)
locals {
  branch_name_map = tomap({
    for key, value in var.environments : key => value.branch_name
  })
}

module "gitflow" {

  source  = "Azure-Terraformer/action-azure-application/github"
  version = "1.0.32"

  repository   = var.repository_name
  branch       = github_branch.main.branch
  commit_user  = var.commit_user
  environments = local.branch_name_map

  # we don't want the actions firing when we start pushing commits
  depends_on = [module.codebase]

}

module "action_azure_login" {
  source  = "Azure-Terraformer/action-azure-login-test/github"
  version = "1.0.1"

  repository  = var.repository_name
  branch      = github_branch.main.branch
  commit_user = var.commit_user

}
