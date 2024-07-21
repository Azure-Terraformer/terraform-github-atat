# Introduction to GitHub - Automate the Automation with Terraform (GH-ATAT)

Welcome to our comprehensive Terraform solution, crafted to transform your infrastructure management within Azure. This suite comprises two core repositories: the 'Application-Environment' repository and the 'Module-Library' repository, each tailored to cater to distinct aspects of your infrastructure needs.

## Key Features:

1. **Application-Environment Repository**: This repository is pivotal for provisioning long-lived environments (development, testing, production) within Azure. It features robust pipelines for `plan`, `apply`, and `destroy` operations, empowering you to create, manage, and dismantle your environments as required. 

2. **Module-Library Repository**: Designed for the development of new Terraform modules, this repository includes a specialized Terraform test pipeline. It facilitates the testing of your modules, ensuring they meet your standards before integration.

3. **Automated GitHub Repository Creation**: Upon module execution, a new GitHub repository is automatically created for your Azure Terraform codebase, centralizing your infrastructure-as-code (IaC) assets.

4. **Simplified Azure Integration**: The module seamlessly interacts with Azure services. Just provide your Azure credentials, and the module takes care of the rest.

5. **Efficient State Management**: The module mandates a configuration for a Blob Storage backend, securing and simplifying access to your Terraform state.

6. **GitHub Actions Integration**: A CI/CD pipeline is integrated with GitHub Actions, featuring manual triggers for environment selection and execution of `terraform plan`, `apply`, and `destroy` operations.

## Prerequisites:

- **GitHub Personal Access Token**: Essential for GitHub account interactions.
- **Azure Credentials**: Necessary for managing Azure resources.
- **Blob Storage Backend Configuration**: Required for Terraform state storage.

## Getting Started:

1. **Input Credentials**: Enter your GitHub Token, Azure credentials, and Blob Storage Backend configuration into the module.

2. **Execute `terraform apply`**: This sets up your GitHub repository, Azure Terraform codebase, and GitHub Actions pipeline.

3. **Trigger Your Pipeline**: Use the manual trigger in GitHub Actions to manage deployments across different environments.

4. **Streamlined Infrastructure Management**: Enjoy a unified, efficient approach to managing your Azure infrastructure.

Thank you for choosing our Terraform solution. We're thrilled to support your infrastructure automation journey!
<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->