# Terraform Submodule Configuration for Providers

## Overview

In Terraform configurations, the `required_providers` block is used to specify the providers needed for a module. This block is crucial for managing provider dependencies, ensuring compatibility, and maintaining clarity in your infrastructure code.

### HashiCorp Providers

**HashiCorp Providers** are Terraform providers developed and maintained by HashiCorp, the creators of Terraform. Examples include providers like `aws`, `azurerm` (Azure), `google` (GCP), and `hashicorp/vault`. These providers are hosted in the official Terraform Registry under the HashiCorp namespace.

For HashiCorp providers, defining the `required_providers` block in submodules is not strictly necessary because Terraform automatically fetches these providers from the official registry if they are referenced in the configuration. However, it is considered a **best practice** to explicitly define the `required_providers` block in submodules. This ensures clarity, enforces version constraints, and improves maintainability by making dependencies explicit.

### Non-HashiCorp Providers

**Non-HashiCorp Providers** are Terraform providers developed by third parties or the community, not maintained by HashiCorp. Examples include providers like `datadog`, `newrelic`, or custom providers hosted outside the official HashiCorp namespace. These providers may be sourced from the Terraform Registry, custom registries, or other locations.

For Non-HashiCorp providers, you **must explicitly define** the `required_providers` block in your submodule. This is because Terraform does not automatically resolve these providers, and the block is needed to specify the source and version of the provider to ensure proper initialization and compatibility.

## Best Practice

To maintain consistency and clarity across your Terraform configurations, always include the `required_providers` block in your submodules, regardless of whether the provider is HashiCorp or Non-HashiCorp. This practice helps document dependencies, enforce version constraints, and avoid unexpected behavior during provider initialization.

### Example `required_providers` Block

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}
