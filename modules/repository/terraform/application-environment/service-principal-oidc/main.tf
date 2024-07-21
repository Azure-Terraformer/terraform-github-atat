data "github_user" "current" {
  username = ""
}

resource "github_repository" "main" {
  name        = var.name
  description = "My awesome codebase"

  visibility = "public"
  auto_init  = true
}

resource "github_branch" "main" {
  repository = github_repository.main.name
  branch     = "main"
}

resource "github_branch_default" "default" {
  repository = github_repository.main.name
  branch     = github_branch.main.branch
}

resource "github_actions_variable" "application_name" {

  repository    = github_repository.main.name
  variable_name = "APPLICATION_NAME"
  value         = var.application_name

}