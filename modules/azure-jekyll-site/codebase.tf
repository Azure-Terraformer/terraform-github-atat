module "codebase" {

  source  = "Azure-Terraformer/codebase-terraform-azure-jekyll-site/github"
  version = "1.0.18"

  repository   = var.repository_name
  branch       = github_branch.main.branch
  path         = "src/terraform"
  commit_user  = var.commit_user
  location     = var.location
  environments = local.branch_name_map

}
