# Application Environment with Service Principal (OIDC) Authentication
This Terraform module is an exemplary root module designed to provision the GitHub AT-AT module library utilizing the Service Principal (OIDC) path. This setup facilitates the GitHub Actions Terraform Workflow's authentication with Azure via OIDC, leveraging an Entra ID federated identity credential. The module is structured to provision two distinct environments, DEV and PROD.

For each environment, the module creates a Terraform State backend utilizing an Azure Storage account, ensuring a robust and scalable state management solution. Additionally, it provisions an Entra ID Application, Service Principal, and Federated Identity Credential for both DEV and PROD environments. These identities are granted "Contributor" access to their respective Azure Subscriptions, allowing them to perform necessary operations within the scope of the subscription.

Furthermore, the module employs the GitHub AT-AT module library to establish a GitHub repository. This repository is equipped with fully functional Terraform Plan / Apply / Destroy GitHub Actions workflows. These workflows are configured to be manually triggered, enabling users to select and execute operations for the desired environment, be it DEV or PROD. This comprehensive setup streamlines the process of managing infrastructure as code with Terraform, GitHub Actions, and Azure, offering a practical example of efficient and secure environment provisioning.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.53.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 2.53.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend_dev"></a> [backend\_dev](#module\_backend\_dev) | markti/azure-terraformer/azurerm//modules/terraform/backend/baseline | 1.0.16 |
| <a name="module_backend_prod"></a> [backend\_prod](#module\_backend\_prod) | markti/azure-terraformer/azurerm//modules/terraform/backend/baseline | 1.0.16 |
| <a name="module_repo"></a> [repo](#module\_repo) | ../../../../../modules/repository/terraform/application-environment/service-principal-oidc | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_application.identity](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_federated_identity_credential.identity](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_federated_identity_credential) | resource |
| [azuread_service_principal.identity](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of the application. Used in the naming conventions for resources. | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | The identity of the user that will be used to commit changes to the repository. | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_environments"></a> [environments](#input\_environments) | A map of environment names corresponding to Azure Subscription IDs. | `map(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the GitHub repository. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->