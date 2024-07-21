module "terraform_manual" {

  source = "../../../../pipeline/terraform/manual-targeting/service-principal-oidc"

  repository  = github_repository.main.name
  branch      = github_branch.main.branch
  commit_user = var.commit_user

}

module "azure_login" {

  source = "../../../../pipeline/terraform/azure-login"

  repository  = github_repository.main.name
  branch      = github_branch.main.branch
  commit_user = var.commit_user

}