resource "google_artifact_registry_repository" "pipeline_repo" {
  location      = var.region
  repository_id = "finance-analysis-repo"
  description   = "Artifact Registry repository for storing Docker images used in the finance analysis pipeline."
  format        = "DOCKER"

  depends_on = [google_project_service.artifactregistry_api]
}

resource "google_storage_bucket" "cloudbuild_bucket" {
  name          = "${var.project_id}-cloudbuild-bucket"
  location      = var.region
  force_destroy = true # Allow bucket deletion even if it contains objects
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

# Grant Cloud Logging permissions so it can write build logs
resource "google_project_iam_member" "cloudbuild_logging_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.sa-cloudbuild-runner.email}"
}

# Grant Artifact Registry Writer permissions so it can push the Docker image
resource "google_project_iam_member" "cloudbuild_artifact_registry_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.sa-cloudbuild-runner.email}"
}

# Grant Cloud Build Worker permissions so it can physically execute the job steps
resource "google_project_iam_member" "cloudbuild_worker" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.builder"
  member  = "serviceAccount:${google_service_account.sa-cloudbuild-runner.email}"
}