variable "project_name" {
  description = "Provide the project name in GCP Account"
  type = string
}

variable "gcp_region" {
  description = "Provide the GCP Region in which Resources to be created"
  type = list
}

variable "prefix" {
  description = "Provide the prefix used for the project"
  type = string
}

variable "ip_range_subnet" {
  description = "Provide the IP range for Private Subnet"
  type = string 
}

variable "master_ip_range" {
  description = "IP address range for the master network of a GKE cluster"
  type = string
}

variable "min_master_version" {
  description = "Provide Kubernetes Version of Control Plane"
  type = list
}

variable "node_version" {
  description = "Provide Kubernetes Version of Worker Nodes"
  type = list
}

variable "pods_ip_range" {
  description = "Secondary IP address range using which Pod will be created"
  type = string
}

variable "services_ip_range" {
  description = "Secondary IP address range using which Services will be created"
  type = string
}

variable "ip_public_range_subnet" {
  description = "Provide the IP range for Public Subnet"
  type = string
}

variable "machine_type" {
  description = "Provide the Machine Type for VM Instances"
  type = list
}

variable "tier" {
  description = "Provide the Machine Type for VM Instances"
  type = list
}

variable "database_version" {
  description = "Provide the database version DB Instance"
  type = list
}

variable "db_schema_name" {
  description = "Provide the DB Schema name for GCP Cloud SQL PostgreSQL"
  type = string
}

variable "username" {
  description = "Provide the Username for GCP Cloud SQL PostgreSQL"
  type = string
}

variable "env" {
  type = list
  description = "Provide the Environment for EKS Cluster and NodeGroup"
}


