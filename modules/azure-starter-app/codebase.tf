module "codebase" {

  source  = "Azure-Terraformer/codebase-terraform-azure-application/github"
  version = "1.0.4"

  repository  = var.repository_name
  branch      = github_branch.main.branch
  commit_user = var.commit_user

}
//.terraform/modules/test.tests/azure-fn-app-stand-alone.environment.core.terraform_gitflow/files/.github/workflows/atat-push-terraform-apply.yaml
