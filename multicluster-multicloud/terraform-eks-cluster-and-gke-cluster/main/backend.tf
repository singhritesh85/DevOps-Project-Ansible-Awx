#terraform {
# backend "s3" {
#   bucket         = "dolo-dempo"
#   key            = "state/dev/terraform.tfstate"
#   region         = "us-east-2"
#   encrypt        = true
#   use_lockfile   = true   ###dynamodb_table = "terraform-state"
# }
#}

terraform {
  backend "gcs" {
    bucket  = "dolo-dempo"
    prefix  = "state/multicloud-cluster"
  }
}
