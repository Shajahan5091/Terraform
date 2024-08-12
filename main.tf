terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.87"
    }
  }
}


resource "snowflake_database" "ETL" {
  name = "HEALTHCARE"
}

resource "snowflake_schema" "raw" {
  database = snowflake_database.ETL.name
  name     = "RAW"
}

resource "snowflake_schema" "stage" {
  database = snowflake_database.ETL.name
  name     = "STAGE"
}

resource "snowflake_schema" "prod" {
  database = snowflake_database.ETL.name
  name     = "PRODUCTION"
}

resource "snowflake_file_format" "file_format_csv" {
  name        = "FILE_FORMAT_CSV"
  database    = snowflake_database.ETL.name
  schema      = snowflake_schema.raw.name
  format_type = "CSV"
}

resource "snowflake_storage_integration" "gcs_integration" {
  provider = snowflake.account_admin
  name               = "my_gcs_integration"
  storage_provider   = "GCS"
  # storage_gcp_service_account = var.service_account_key_path
  storage_allowed_locations = ["gcs://elait_bucket15/"]
}

resource "snowflake_stage" "gcp_stage" {
  provider = snowflake.security_admin
  name     = "GCP_STAGE"
  database = snowflake_database.ETL.name
  schema   = snowflake_schema.raw.name
  url      = "gcs://elait_bucket15/"
  storage_integration = snowflake_storage_integration.gcs_integration.name
}

resource "google_project_iam_member" "my_project_iam_member" {
  project = "sfdatamigration"
  role    = "roles/storage.objectViewer" # Replace with the desired role
  member  = "serviceAccount:${snowflake_storage_integration.gcs_integration.storage_gcp_service_account}"
}

resource "snowflake_stage" "gcp_stage_2" {
  name     = "GCP_STAGE_2"
  database = snowflake_database.ETL.name
  schema   = snowflake_schema.raw.name
  url      = "gcs://elait_bucket15/"
  storage_integration = snowflake_storage_integration.gcs_integration.name
}