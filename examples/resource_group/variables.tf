# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# ARM_CLIENT_ID
# ARM_CLIENT_SECRET
# ARM_SUBSCRIPTION_ID
# ARM_TENANT_ID

variable "name" {
  default     = "test-recource-group"
  description = "Resource group name"
}

variable "location" {
  default     = "East US 2"
  description = "Resource location"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Tags to definition resources"
}