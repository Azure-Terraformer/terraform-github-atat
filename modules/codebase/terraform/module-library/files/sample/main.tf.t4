module "main" {
  source = "../../../modules/${module_path}"
}

resource "random_string" "main" {
  length  = 8
  upper   = false
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = "rg-$${random_string.main.result}"
  location = "westus3"
}