module "terraform_test_template" {

  source = "../../../pipeline/terraform/test-template"

  repository  = github_repository.main.name
  branch      = github_branch.main.branch
  commit_user = var.commit_user

}

module "terraform_test_module" {

  for_each = var.modules

  source = "../../../pipeline/terraform/test-module"

  repository  = github_repository.main.name
  branch      = github_branch.main.branch
  commit_user = var.commit_user
  module_name = each.key
  module_path = "samples/${each.value}"

}