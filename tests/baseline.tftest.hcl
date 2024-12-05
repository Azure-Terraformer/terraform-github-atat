run "setup" {
  module {
    source = "./tests/setup"
  }
}

run "environment" {
  module {
    source = "./examples/baseline"
  }

  variables {
    github_organization           = "Azure-Terraformer"
    github_repository_name        = "github-atat-demo-${run.setup.repository_name_suffix}"
    github_repository_visibility  = "public"
    github_repository_description = "GitHub AT-AT Integration Test"
  }

}
