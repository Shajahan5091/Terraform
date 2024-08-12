resource "snowflake_user" "Admin" {
  name         = "ETL Admin"
  login_name   = "ETL_Admin"
  password     = "Admin@healthcare"
  disabled     = false
  display_name = "ETL Admin"
  must_change_password = false
  provider = snowflake.security_admin
}

resource "snowflake_user" "Architect" {
  name         = "Data Architect"
  login_name   = "Data_Architect"
  password     = "Architect@healthcare"
  disabled     = false
  display_name = "Data Architect"
  must_change_password = false
  provider = snowflake.security_admin
}

resource "snowflake_user" "Data_Engineer" {
  name         = "Data Engineer"
  login_name   = "Data_Engineer"
  password     = "Data_Engineer@healthcare"
  disabled     = false
  display_name = "Data Engineer"
  must_change_password = false
  provider = snowflake.security_admin
}

resource "snowflake_user" "Analyst" {
  name         = "Data Analyst"
  login_name   = "Data_Analyst"
  password     = "Analyst@healthcare"
  disabled     = false
  display_name = "Data Analyst"
  must_change_password = false
  provider = snowflake.security_admin
}

resource "snowflake_user" "Reporter" {
  name         = "BI Reporter"
  login_name   = "BI_Rporter"
  password     = "Reporter@healthcare"
  disabled     = false
  display_name = "BI Reporter"
  must_change_password = false
  provider = snowflake.security_admin
}

resource "snowflake_user" "Test_Engineer" {
  name         = "Test Engineer"
  login_name   = "Test_Engineer"
  password     = "Test_Engineer@healthcare"
  disabled     = false
  display_name = "Test Engineer"
  must_change_password = false
  provider = snowflake.security_admin
}

resource "snowflake_user" "Pipeline" {
  name         = "Pipeline Operator"
  login_name   = "Pipeline_Operator"
  password     = "Operator@healthcare"
  disabled     = false
  display_name = "Pipeline Operator"
  must_change_password = false
  provider = snowflake.security_admin
}