
locals {
  module_files = [
    "main.tf",
    "outputs.tf",
    "variables.tf",
    "versions.tf"
  ]
}

resource "github_repository_file" "module_files" {

  count = length(local.module_files)

  repository          = var.repository
  branch              = var.branch
  file                = "modules/${var.module_path}/${local.module_files[count.index]}"
  content             = file("${path.module}/files/module/${local.module_files[count.index]}")
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true
}

locals {
  sample_files = [
    "tests/setup/main.tf",
    "tests/scenario1.tftest.hcl",
    "main.tf",
    "versions.tf"
  ]
}

resource "github_repository_file" "sample_files" {

  count = length(local.sample_files)

  repository          = var.repository
  branch              = var.branch
  file                = "samples/${var.module_path}/${local.sample_files[count.index]}"
  content             = templatefile("${path.module}/files/sample/${local.sample_files[count.index]}",
  {
    module_path = "${var.module_path}"
  })
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true
}

resource "github_repository_file" "gitignore" {

  repository          = var.repository
  branch              = var.branch
  file                = ".gitignore"
  content             = file("${path.module}/files/.gitignore")
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true

}