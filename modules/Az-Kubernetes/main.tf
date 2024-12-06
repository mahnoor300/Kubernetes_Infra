
resource "azurerm_kubernetes_cluster" "default" {
  name                = var.aks_name
  location            = "East US"
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = "1.29.9"

  default_node_pool {
    name            = var.nodepool_name
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"  # This enables the system-assigned managed identity
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "dev"
  }
}


output "principal_id" {
  value = azurerm_kubernetes_cluster.default.identity[0].principal_id
  
}