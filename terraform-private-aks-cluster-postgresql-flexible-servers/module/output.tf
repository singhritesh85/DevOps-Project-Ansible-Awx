output "azurevm_k8s_management_node_privateip" {
  description = "Private IP address of K8S Management Node"
  value       = azurerm_linux_virtual_machine.azure_vm_k8s_management_node.private_ip_address
}

output "aks_id" {
  description = "Azure Kubernetes Service (AKS) Cluster ID"
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_name" {
  description = "Azure Kubernetes Service (AKS) Cluster name"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "application_gateway_name" {
  value = azurerm_application_gateway.appgtw.name
}
