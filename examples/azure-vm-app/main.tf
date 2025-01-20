module "app" {

  source = "../../modules/azure-vm-app"

  application_name       = var.application_name
  github_organization    = var.github_organization
  repository_name        = var.repository_name
  repository_description = var.repository_description
  repository_visibility  = var.repository_visibility
  terraform_version      = var.terraform_version
  location               = "eastus2"
  image_names            = ["ubuntu-minecraft-bedrock"]
  vm_size                = "Standard_D2_v2_Promo"
  packer_version         = "1.9.4"
  base_address_space     = "10.64.0.0/22"

  commit_user = {
    name  = var.github_username
    email = var.github_email
  }

  environments = {
    dev = {
      subscription_id = var.azure_nonprod_subscription
      branch_name     = "develop"
      backend         = var.nonprod_backend
      gallery = {
        name           = "galqonqgallerydev"
        resource_group = "rg-qonq-gallery-dev"
      }
      managed_image_destination = "rg-qonq-gallery-dev"
    }
    prod = {
      subscription_id = var.azure_prod_subscription
      branch_name     = "main"
      backend         = var.prod_backend
      gallery = {
        name           = "galqonqgalleryprod"
        resource_group = "rg-qonq-gallery-prod"
      }
      managed_image_destination = "rg-qonq-gallery-prod"
    }
  }

}
