output "eks_cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = aws_eks_cluster.eksdemo.endpoint
}
output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.eksdemo.name
}
output "karpenter_node_spun_iam_role_arn" {
  description = "IAM Role ARN for Karpenter to spin-up nodes"
  value       = aws_iam_role.karpenter_node_iam_role.arn
}
output "GCP_Linux_VM_Instance_K8S_Management_Internal_IP" {
  description = "The internal IP address of the GCP Linux VM Instance"
  value       = google_compute_instance.vm_instance.network_interface[0].network_ip
}
output "GCP_Linux_VM_Instance_K8S_Management_External_IP" {
  description = "The external IP address of the GCP Linux VM instance"
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}
output "gke_standard_cluster_name" {
  description = "The name of the GKE standard cluster"
  value       = google_container_cluster.gke_cluster.name
}
output "gke_standard_cluster_endpoint" {
  description = "The IP address of the GKE standard cluster"
  value       = google_container_cluster.gke_cluster.endpoint
}
output "gke_standard_cluster_node_pool_name" {
  description = "The Name of the GKE node pool"
  value       = google_container_node_pool.gke_linux_nodepool_1.name
}
output "gke_standard_cluster_node_pool_instance_group_urls" {
  description = "List of Instance Group URL of the node pool"
  value       = google_container_node_pool.gke_linux_nodepool_1.instance_group_urls
}
output "gke_standard_cluster_node_pool_version" {
  description = "The Kubernetes version of the nodes in the pool"
  value       = google_container_node_pool.gke_linux_nodepool_1.version
}
