resource "google_artifact_registry_repository" "pipeline_repo" {
  location      = var.region
  repository_id = "finance-analysis-repo"
  description   = "Artifact Registry repository for storing Docker images used in the finance analysis pipeline."
  format        = "DOCKER"
}

resource "google_service_account" "sa-cloudbuild-runner" {
  account_id   = "cloudbuild-runner-sa"
  display_name = "Service Account utilized by Cloud Build Pipelines"
}

resource "google_project_iam_member" "cloudbuild_run_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.sa-cloudbuild-runner.email}"
}

resource "google_project_iam_member" "cloudbuild_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.sa-cloudbuild-runner.email}"
}