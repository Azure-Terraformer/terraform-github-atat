run "setup" {
  module {
    source = "./tests/setup"
  }
}

run "environment" {
  module {
    source = "./examples/azure-starter-app-stand-alone"
  }

  command = plan

  variables {
    application_name       = "app${run.setup.repository_name_suffix}"
    github_organization    = "Azure-Terraformer"
    repository_name        = "github-atat-demo-${run.setup.repository_name_suffix}"
    repository_visibility  = "public"
    repository_description = "GitHub AT-AT Integration Test"
    terraform_version      = "1.9.8"
    location               = "westus3"
  }

}
