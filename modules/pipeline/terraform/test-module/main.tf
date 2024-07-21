
locals {
  files = [
    
  ]
}

resource "github_repository_file" "bulk" {

  repository          = var.repository
  branch              = var.branch
  file                = ".github/workflows/${var.module_name}.yaml"
  content             = templatefile(
    "${path.module}/files/.github/workflows/module-test.yaml", 
    {
      module_name = "${var.module_name}"
      module_path = "${var.module_path}"
    }
  )
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true
}