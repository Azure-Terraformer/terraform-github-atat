module "codebase" {

  source  = "Azure-Terraformer/codebase-terraform-azure-vm-app/github"
  version = "1.0.16"

  repository         = var.repository_name
  branch             = github_branch.main.branch
  commit_user        = var.commit_user
  primary_location   = var.location
  image_names        = var.image_names
  vm_size            = var.vm_size
  packer_version     = var.packer_version
  base_address_space = var.base_address_space

}
