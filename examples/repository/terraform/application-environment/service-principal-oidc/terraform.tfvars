/*
name = "terraform-azurerm-aks"
commit_user = {
  name  = "Azure Terraformer"
  email = "foo@bar.com"
}
environments = {
  "dev" = {
    subscription_id = "foo"
    tenant_id       = "foo"
    client_id       = "foo"
    client_secret   = "foo"
    backend = {
      resource_group_name  = "rg-terraform-state"
      storage_account_name = "foo"
      container_name       = "tfstate"
    }
  }
  "prod" = {
    subscription_id = "foo"
    tenant_id       = "foo"
    client_id       = "foo"
    client_secret   = "foo"
    backend = {
      resource_group_name  = "rg-terraform-state"
      storage_account_name = "foo"
      container_name       = "tfstate"
    }
  }
}
*/