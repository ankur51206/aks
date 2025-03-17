output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.my_rg.name
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}
