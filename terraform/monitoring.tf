# Create an Email Notification Channel
resource "google_monitoring_notification_channel" "email_admin" {
  display_name = "Platform Engineering Admin Email"
  type         = "email"
  labels = {
    email_address = var.alert_recipient_email
  }
}

# Alert Policy: Triggered if any Cloud Run Job terminates with a Failure code
resource "google_monitoring_alert_policy" "cloud_run_job_failures" {
  display_name = "Alert: Cloud Run Job Failed Execution"
  combiner     = "OR"

  notification_channels = [google_monitoring_notification_channel.email_admin.name]

  conditions {
    display_name = "Cloud Run Job Failure Condition"

    condition_threshold {
      # Filter explicitly tracks execution outcomes
      filter          = "resource.type = \"cloud_run_job\" AND metric.type = \"run.googleapis.com/job/completed_execution_count\" AND metric.labels.result = \"failed\""
      duration        = "0s" # Fire immediately upon job exit failure
      comparison      = "COMPARISON_GT"
      threshold_value = 0

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
      }
    }
  }

  documentation {
    content   = "The finance analysis job has failed. Check Cloud Logging logs for error traceback stacks."
    mime_type = "text/markdown"
  }
}