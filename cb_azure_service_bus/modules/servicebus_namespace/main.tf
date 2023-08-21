resource "azurerm_resource_group" "group" {
  name     = "rg-${var.name}-${var.environment}-${var.location}"
  location = var.location
}

resource "azurerm_management_lock" "prevent_delete" {
  name       = "lock-${var.name}-${var.environment}-${var.location}"
  scope      = azurerm_resource_group.group.id
  lock_level = "CanNotDelete"
}

resource "azurerm_servicebus_namespace" "namespace" {
  name                = "sbns-${var.name}-${var.environment}-${var.location}"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  local_auth_enabled  = false # Let's switch this off, managed identities are much more secure, and the spec doesn't mention anything about clients outside of azure
  minimum_tls_version = "1.2"
  sku                 = "Standard"
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    CostCenter  = var.cost_center
    ProductName = var.product_name
  }
}

resource "azurerm_servicebus_queue" "queue" {
  for_each     = toset(var.queues)
  name         = each.key
  namespace_id = azurerm_servicebus_namespace.namespace.id
  lifecycle {
    prevent_destroy = true
  }
}

# Next step here would be to provision a private connection and set public_network_access_enabled to false on the namespace
