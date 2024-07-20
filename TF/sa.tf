# terraform {
#   backend "gcs" {
#     credentials = "terraform_credentails.json"
#     bucket      = "gke-terraform-tfstate-bucket-demo-1" # GCS bucket name to store terraform tfstate
#     prefix      = "gke-terraform-cluster"               # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
#   }
# }

module "service-accounts" {
  source     = "terraform-google-modules/service-accounts/google"
  version    = "4.2.3"
  project_id = var.project_id

  grant_xpn_roles = false
  names           = ["dev-user"]
  project_roles   = []
}