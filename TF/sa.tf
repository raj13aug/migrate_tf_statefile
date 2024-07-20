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

  names         = ["dev-user", "pro-user"]
  generate_keys = true
  project_roles = [
    "${var.project_id}=>roles/viewer",
    "${var.project_id}=>roles/storage.objectViewer",
  ]
  display_name = "Test Service Accounts"
  description  = "Test Service Accounts description"
}