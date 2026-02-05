output "GCP_Linux_VM_Instance_Internal_IP" {
  description = "The internal IP address of the GCP Linux VM Instance"
  value       = google_compute_instance.vm_instance.network_interface[0].network_ip
}

output "GCP_Linux_VM_Instance_External_IP" {
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

output "cloud_sql_db_instance_name" {
  description = "The name of the Cloud SQL DB Instance"
  value       = google_sql_database_instance.db_instance.name
}

output "cloud_sql_connection_name" {
  description = "The connection name of the Cloud SQL DB Instance"
  value       = google_sql_database_instance.db_instance.connection_name
}

output "cloud_sql_private_ip_address" {
  description = "The private IPv4 address assigned to the Cloud SQL DB Instance"
  value       = google_sql_database_instance.db_instance.private_ip_address
}
