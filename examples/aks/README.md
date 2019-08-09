
# AKS (Azure Kubernetes Service)

This folder contain examples for create *AKS in azure*

## Running this module manually

1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
1. Run `terraform init`.
1. Run `terraform apply`.
1. When you're done, run `terraform destroy`.

## Running automated tests against this module

1. Build image docker: `docker build -t terraform-test .`
1. Run docker test : `docker run -e ARM_CLIENT_ID=$(spClientId) -e ARM_CLIENT_SECRET=$(spClientSecret) -e ARM_SUBSCRIPTION_ID=$(spSubscriptionId) -e ARM_TENANT_ID=$(spTenantId) terraform-test`
