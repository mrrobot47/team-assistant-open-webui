# IAP IAM Configuration

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_iap_web_iam_member" "iap_access" {
  for_each = toset(var.cloud_run_invoker_members)
  project  = var.project_id
  role     = "roles/iap.httpsResourceAccessor"
  member   = each.key
}

resource "google_cloud_run_v2_service_iam_member" "iap_invoker" {
  project  = var.project_id
  name     = var.cloud_run_service_name
  location = var.cloud_run_service_location
  role     = "roles/run.invoker"
  member   = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-iap.iam.gserviceaccount.com"
}
