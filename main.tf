# resource group module
module "rg" {
  source = "./modules/Az-Rg"
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "kubernetes" {
    source = "./modules/Az-Kubernetes"
    resource_group_name = module.rg.resource_group_name
    aks_name = var.aks_name
    dns_prefix = var.dns_prefix
    nodepool_name = var.nodepool_name
  
}


module "acr" {
  source = "./modules/Az-ACR"
  acr_name = var.acr_name
  resource_group_name = module.rg.resource_group_name
  principal_id = module.kubernetes.principal_id

  
}