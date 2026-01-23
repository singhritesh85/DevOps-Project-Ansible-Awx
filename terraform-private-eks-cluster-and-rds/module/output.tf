output "k8s_management_instance_id" {
  description = "The ID of the K8S Management EC2 instance."
  value       = aws_instance.k8s_management.id
}
output "k8s_management_private_ip" {
  description = "The private IP address of the K8S Management EC2 instance."
  value       = aws_instance.k8s_management.private_ip
}
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
output "rds_dbinstance_address" {
  description = "The address (hostname) of the RDS instance"
  value       = aws_db_instance.dbinstance1.address
}
output "rds_dbinstance_endpoint" {
  description = "The connection endpoint, including port"
  value       = aws_db_instance.dbinstance1.endpoint
}
