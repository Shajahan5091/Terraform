resource "snowflake_account_role" "Admin" {
  name    = "ETL_Admin"
  provider = snowflake.security_admin
  comment = "This role is Admin for the ETL Process"
}

resource "snowflake_account_role" "Architect" {
  name = "Data_Architect"
  provider = snowflake.security_admin
}

resource "snowflake_account_role" "Engineer" {
  name = "Data_Engineer"
  provider = snowflake.security_admin
}

resource "snowflake_account_role" "Analyst" {
  name = "Data_Analyst"
  provider = snowflake.security_admin
}

resource "snowflake_account_role" "Reporter" {
  name = "BI_Reporter"
  provider = snowflake.security_admin
}

resource "snowflake_account_role" "Test" {
  name = "Test_Engineer"
  provider = snowflake.security_admin
}

resource "snowflake_account_role" "Pipeline" {
  name = "Pipeline_Operator"
  provider = snowflake.security_admin
}

