module "codebase" {

  source  = "Azure-Terraformer/codebase-terraform-azure-vm-core/github"
  version = "1.0.3"

  repository  = var.repository_name
  branch      = github_branch.main.branch
  commit_user = var.commit_user
  location    = var.location

}
