resource "snowflake_grant_account_role" "report_to_analyst" {
  role_name        = snowflake_account_role.Reporter.name
  parent_role_name = snowflake_account_role.Analyst.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "analyst_to_engineer" {
  role_name        = snowflake_account_role.Analyst.name
  parent_role_name = snowflake_account_role.Engineer.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "test_to_engineer" {
  role_name        = snowflake_account_role.Test.name
  parent_role_name = snowflake_account_role.Engineer.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "pipeline_to_engineer" {
  role_name        = snowflake_account_role.Pipeline.name
  parent_role_name = snowflake_account_role.Engineer.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "engineer_to_architect" {
  role_name        = snowflake_account_role.Engineer.name
  parent_role_name = snowflake_account_role.Architect.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "architect_to_admin" {
  role_name        = snowflake_account_role.Architect.name
  parent_role_name = snowflake_account_role.Admin.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "admin_to_Sysadmin" {
  role_name = snowflake_account_role.Admin.name
  parent_role_name = "SYSADMIN"
  provider = snowflake.security_admin
}