# Configure modules
module "resource_group" {
  source = "../modules/resource_group"

  name     = "rg-my-resource-group"
  location = "East US 2"
  tags = {
    "RESOURCE-GROUP-EXAMPLE_1" = "TEST_1"
    "RESOURCE-GROUP-EXAMPLE_2" = "TEST_2"
  }
}