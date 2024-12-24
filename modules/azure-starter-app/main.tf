
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
