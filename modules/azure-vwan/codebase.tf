module "codebase" {

  source  = "Azure-Terraformer/codebase-terraform-azure-vwan-core/github"
  version = "1.0.1"

  repository         = var.repository_name
  branch             = github_branch.main.branch
  commit_user        = var.commit_user
  primary_location   = var.primary_location
  base_address_space = var.base_address_space
  vpn_address_space  = var.vpn_address_space

}
