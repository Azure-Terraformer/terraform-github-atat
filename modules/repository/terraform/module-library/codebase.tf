module "terraform_simple_codebase" {

  for_each = var.modules

  source = "../../../codebase/terraform/module-library"

  repository  = github_repository.main.name
  branch      = github_branch.main.branch
  commit_user = var.commit_user
  path = "modules"
  module_path = each.value

}