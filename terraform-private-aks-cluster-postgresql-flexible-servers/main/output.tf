#output "acr" {
#  description = "URL of the Azure Container Registry Created"
#  value       = "${module.aks}"
#}

output "azurevm_private_ip_and_aks_details_and_application_gateway_name" {
  description = "Private IP Addresses for Azure VM, AKS ID, Name and Azure Application Gateway Name"
  value       = "${module.aks}"
}
