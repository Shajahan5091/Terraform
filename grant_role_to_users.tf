resource "snowflake_grant_account_role" "admin_role_to_user" {
  role_name = snowflake_account_role.Admin.name
  user_name = snowflake_user.Admin.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "architect_role_to_user" {
  role_name = snowflake_account_role.Architect.name
  user_name = snowflake_user.Architect.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "Engineer_role_to_user" {
  role_name = snowflake_account_role.Engineer.name
  user_name = snowflake_user.Data_Engineer.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "Analyst_role_to_user" {
  role_name = snowflake_account_role.Analyst.name
  user_name = snowflake_user.Analyst.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "Reporter_role_to_user" {
  role_name = snowflake_account_role.Reporter.name
  user_name = snowflake_user.Reporter.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "Test_Engineer_role_to_user" {
  role_name = snowflake_account_role.Test.name
  user_name = snowflake_user.Test_Engineer.name
  provider = snowflake.security_admin
}

resource "snowflake_grant_account_role" "pipeline_role_to_user" {
  role_name = snowflake_account_role.Pipeline.name
  user_name = snowflake_user.Pipeline.name
  provider = snowflake.security_admin
}