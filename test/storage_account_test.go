package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// TestStorageAccount: Execute test module Storage Account
func TestStorageAccount(t *testing.T) {

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "../examples/storage_account",

		NoColor: false,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
}
