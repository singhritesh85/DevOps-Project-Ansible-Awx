output "eks_and_karpenter_iam_role_and_standard_gke_cluster_details" {
  description = "Details of Created EKS, RDS, Karpenter IAM Role_ARN, Standard GKE Cluster and GCP VM Instance"
  value       = "${module.eks_cluster_and_standard_gke_cluster}"
}
