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
        image = "us-docker.pkg.dev/cloudrun/container/hello:latest"

        # Dynamically inject the runtime secret variables configured in Secret Manager
        dynamic "env" {
          for_each = toset(var.finance_analysis_job_secrets)
          content {
            name = env.key
            value_source {
              secret_key_ref {
                secret  = google_secret_manager_secret.secrets[env.key].id
                version = "latest"
              }
            }
          }
        }
      }
    }
  }

  depends_on = [
    google_project_service.run_api,
    google_secret_manager_secret.secrets,
    google_secret_manager_secret_iam_member.job_sa_secret_access
  ]
}