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