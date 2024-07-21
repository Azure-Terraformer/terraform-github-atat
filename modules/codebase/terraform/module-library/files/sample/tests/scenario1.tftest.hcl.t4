run "setup_tests" {
    module {
        source = "./tests/setup"
    }
}

run "create_pet_name" {
  command = apply

  variables {
  }

  assert {
    condition     = length(module.main.pet_name) > 0
    error_message = "Name is OK"
  }

}