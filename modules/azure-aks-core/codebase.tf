module "codebase" {

  source  = "Azure-Terraformer/codebase-terraform-azure-aks-core/github"
  version = "1.0.14"

  repository        = var.repository_name
  branch            = github_branch.main.branch
  commit_user       = var.commit_user
  primary_location  = var.primary_location
  os_type           = var.os_type
  sku_name          = var.sku_name
  retention_in_days = var.retention_in_days

}
