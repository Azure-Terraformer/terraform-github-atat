
module "repo" {

  source      = "../../../../modules/repository/terraform/module-library"
  name        = var.name
  commit_user = var.commit_user
  environment = var.environment
  modules     = var.modules

}