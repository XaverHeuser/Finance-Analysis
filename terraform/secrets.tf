variable "finance_analysis_job_secrets" {
  type = list(string)
  default = [
    "SPREADSHEET_ID",
    "TEMP_FOLDER_ID",
    "REGULAR_FOLDER_ID"
  ]
}

# Creates blank configurations for security properties. Values are inserted outside of TF.
resource "google_secret_manager_secret" "secrets" {
  for_each  = toset(var.finance_analysis_job_secrets)
  secret_id = each.key

  replication {
    auto {}
  }
  depends_on = [google_project_service.secretmanager_api]
}

# Create a placeholder version for each secret to ensure the secret exists before pipeline deployment
resource "google_secret_manager_secret_version" "secret_versions" {
  for_each    = toset(var.finance_analysis_job_secrets)
  secret      = google_secret_manager_secret.secrets[each.key].id
  secret_data = "placeholder_value_change_me" # Safe default text
}

# Grant the Cloud Run Job's service account access to read the secrets from Secret Manager
resource "google_secret_manager_secret_iam_member" "job_sa_secret_access" {
  for_each  = toset(var.finance_analysis_job_secrets)
  secret_id = google_secret_manager_secret.secrets[each.key].id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.finance_analysis_job_sa.email}"
}