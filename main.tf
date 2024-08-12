terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.87"
    }
  }
}

# Creating the Database
resource "snowflake_database" "ETL" {
  name = "HEALTHCARE"
}

# Creating RAW schema
resource "snowflake_schema" "raw" {
  database = snowflake_database.ETL.name
  name     = "RAW"
}

# Creating STAGE schema
resource "snowflake_schema" "stage" {
  database = snowflake_database.ETL.name
  name     = "STAGE"
}

# Creating PRODUCTION schema
resource "snowflake_schema" "prod" {
  database = snowflake_database.ETL.name
  name     = "PRODUCTION"
}

# Creating a file format for csv
resource "snowflake_file_format" "file_format_csv" {
  name        = "FILE_FORMAT_CSV"
  database    = snowflake_database.ETL.name
  schema      = snowflake_schema.raw.name
  format_type = "CSV"
}

# Creating the storage integration object
resource "snowflake_storage_integration" "gcs_integration" {
  provider = snowflake.account_admin
  name               = "my_gcs_integration"
  storage_provider   = "GCS"
  # storage_gcp_service_account = var.service_account_key_path
  storage_allowed_locations = ["gcs://elait_bucket15/"]
}

# Creating stage object
resource "snowflake_stage" "gcp_stage" {
  provider = snowflake.account_admin
  name     = "GCP_STAGE"
  database = snowflake_database.ETL.name
  schema   = snowflake_schema.raw.name
  url      = "gcs://elait_bucket15/"
  storage_integration = snowflake_storage_integration.gcs_integration.name
}

# Creating a iam_member for granting the role
resource "google_project_iam_member" "my_project_iam_member" {
  project = "sfdatamigration"
  role    = "roles/storage.objectViewer" # Replace with the desired role
  member  = "serviceAccount:${snowflake_storage_integration.gcs_integration.storage_gcp_service_account}"
}

# Creating another stage object
resource "snowflake_stage" "gcp_stage_2" {
  name     = "GCP_STAGE_2"
  database = snowflake_database.ETL.name
  schema   = snowflake_schema.raw.name
  url      = "gcs://elait_bucket15/"
  storage_integration = snowflake_storage_integration.gcs_integration.name
}