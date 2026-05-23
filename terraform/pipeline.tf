resource "google_service_account" "finance_analysis_job_sa" {
    account_id   = "finance-analysis-job-sa"
    display_name = "Service Account for Finance Analysis Job"
}


resource "google_cloud_run_v2_job" "finance_analysis_job" {
  name                = "finance-analysis-job"
  location            = var.region
  deletion_protection = false # Allow deletion of the job when the stack is destroyed

  template {
    template {
      service_account = google_service_account.finance_analysis_job_sa.email
      timeout         = "1800s"
      max_retries     = 1

      containers {
        image = "gcr.io/${var.project_id}/finance-analysis:latest"
        args  = ["--input", "gs://${google_storage_bucket.cloudbuild_bucket.name}/input/", "--output", "gs://${google_storage_bucket.cloudbuild_bucket.name}/output/"]
      }

      # TODO: Add secrets spreadsheet_id, temp_folder_id, regular_folder_id
    }
  }
}