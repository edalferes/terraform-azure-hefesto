package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestMediaService: Execute test module media service
func TestMediaService(t *testing.T) {
	//t.Parallel()

	expectPrefix := "trfmediaservicetest"
	expectedResourceGroupName := "trf-mediaservice-test"
	expectedStorageAccountName := "trfmediaservicetest"
	expectedLocation := "eastus2"

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "../examples/media_service",

		NoColor: false,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualPrefix := terraform.Output(t, terraformOptions, "prefix")
	actualResourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")
	actualStorageAccountName := terraform.Output(t, terraformOptions, "trfmediaservicetest")
	actualLocation := terraform.Output(t, terraformOptions, "location")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectPrefix, actualPrefix)
	assert.Equal(t, expectedResourceGroupName, actualResourceGroupName)
	assert.Equal(t, expectedStorageAccountName, actualStorageAccountName)
	assert.Equal(t, expectedLocation, actualLocation)
}
