# Introduction to GitHub - Automate the Automation with Terraform (GH-ATAT)

Welcome to the GitHub Automate the Automation with Terraform (AT-AT) Module, or the GitHub AT-AT for short. This is a multi-module repository meaning that it contains multiple reusable modules that you can use together or independently with your own code.

## Key Features:

1. **Application-Environment Repository**: This module provisions a GitHub Repository that is completely setup to provision an environment for an application. The repository will contain a template Azure Terraform root module in the `/src/terraform` folder that provisions a Resource Group. All you have to do is start adding things to it! 

2. **Multi-Environment Support**: This module allows you to setup one or more environments for your application (e.g., dev, test, or prod). 

3. **Terraform GitHub Actions Workflows**: This module features Terraform plan, apply and destroy GitHub Actions workflows that you can manually execute--or customize to your desired GitFlow process.

4. **Backend Isolation**: This module allows you to (optionally) provision an isolated backend for each environment with its own Azure Storage account.

5. **Multi-Subscription Support**: This module allows you to segment your environments across different Azure Subscriptions so that you can organize your environments to the appropriate Azure Subscription structure of your organization.

## Prerequisites:

- **GitHub Personal Access Token**: Essential for GitHub account interactions.
- **Azure Access**: You need to be able to provision Resource Groups and Storage Accounts.
- **Entra Access**: You need to be able to create Applications, Service Principals and Federated Identity Credentials.


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->