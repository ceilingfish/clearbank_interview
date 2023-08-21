locals {
  location = "eastus"
}

# Using a module here for two reasons:
# 1. It avoids duplication for the namespace and queue resource definitions
# 2. It gives us a high information density for the namespaces and queues we're defining. Adding new namespaces and queues becomes easier and gives a better, clearer PR.

module "finance" {
  source       = "../../modules/servicebus_namespace"
  name         = "finance"
  environment  = var.environment
  location     = local.location
  cost_center  = "Finance Team"
  product_name = "reporting queues"
  queues = [
    "a",
    "b"
  ]
}

module "security" {
  source       = "../../modules/servicebus_namespace"
  name         = "security"
  environment  = var.environment
  location     = local.location
  cost_center  = "Security Team"
  product_name = "audit queues"
  queues = [
    "c",
    "d"
  ]
}
