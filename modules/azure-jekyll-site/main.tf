
data "github_user" "current" {
  username = ""
}

resource "github_repository" "main" {

  name        = var.repository_name
  description = var.repository_description

  visibility             = var.repository_visibility
  delete_branch_on_merge = var.delete_branch_on_merge
  auto_init              = true

}

resource "github_branch" "main" {
  repository = var.repository_name
  branch     = "main"
}

resource "github_branch_default" "default" {
  repository = var.repository_name
  branch     = github_branch.main.branch
}

resource "github_actions_variable" "application_name" {

  repository    = var.repository_name
  variable_name = "APPLICATION_NAME"
  value         = var.application_name

}
