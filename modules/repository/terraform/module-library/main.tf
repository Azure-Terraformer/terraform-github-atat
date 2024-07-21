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