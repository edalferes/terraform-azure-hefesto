package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestResourceGroup: Execute test module resource group
func TestResourceGroup(t *testing.T) {
	//t.Parallel()

	expectedName := "trf-recource-group"
	expectedLocation := "eastus2"
	expectedTags := map[string]string{"trf_resource_group_1": expectedName, "trf_location": expectedLocation}

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "../examples/resource_group",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name":     expectedName,
			"location": expectedLocation,
			"tags":     expectedTags,
		},

		NoColor: false,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualName := terraform.Output(t, terraformOptions, "name")
	actualLocation := terraform.Output(t, terraformOptions, "location")
	actualTags := terraform.OutputMap(t, terraformOptions, "tags")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedName, actualName)
	assert.Equal(t, expectedLocation, actualLocation)
	assert.Equal(t, expectedTags, actualTags)
}
