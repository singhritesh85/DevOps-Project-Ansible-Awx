module "aks" {

  source = "../module"
  prefix = var.prefix
  location = var.location[1]
  kubernetes_version = var.kubernetes_version[13]
  ssh_public_key = var.ssh_public_key
  action_group_shortname = var.action_group_shortname
  email_address = var.email_address

  env = var.env[0]

  ############################ Azure VM ################################# 

  vm_size = var.vm_size[0]
  availability_zone = var.availability_zone
  static_dynamic = var.static_dynamic
  disk_size_gb = var.disk_size_gb
  extra_disk_size_gb = var.extra_disk_size_gb
  computer_name  = var.computer_name
  admin_username = var.admin_username
  admin_password = var.admin_password

  ############################ Create PostgreSQL Flexible Servers ###################################

  psql_server_admin_username = var.psql_server_admin_username

}

