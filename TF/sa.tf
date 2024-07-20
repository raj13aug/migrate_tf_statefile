# terraform {
#   backend "gcs" {
#     credentials = "terraform_credentails.json"
#     bucket      = "gke-terraform-tfstate-bucket-demo-1" # GCS bucket name to store terraform tfstate
#     prefix      = "gke-terraform-cluster"               # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
#   }
# }

module "dev-user-accounts" {
  source     = "terraform-google-modules/service-accounts/google"
  version    = "4.2.0"
  project_id = "dev-project"

  grant_xpn_roles = false
  names           = ["dev-user"]
  project_roles   = []
}