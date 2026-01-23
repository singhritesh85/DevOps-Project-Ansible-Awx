output "ec2_eks_and_karpenter_iam_role_rds_details" {
  description = "Details of Created EC2, EKS, RDS and Karpenter IAM Role_ARN"
  value       = "${module.eks_cluster}"
}
