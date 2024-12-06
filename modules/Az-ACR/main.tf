resource "azurerm_container_registry" "default" {
  name                     = var.acr_name
  location                 = "East US"
  resource_group_name      = var.resource_group_name
  sku                       = "Basic"
  admin_enabled            = true  # Enable admin user (optional, based on your security policies)

  tags = {
    environment = "dev"
  }
}
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id   = var.principal_id  # AKS Managed Identity
  role_definition_name = "AcrPull"  # Role to allow pulling images from ACR
  scope           = azurerm_container_registry.default.id  # Scope is the ACR ID
}
