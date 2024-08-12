provider "snowflake" {
  role = "SYSADMIN"
  private_key_path = "C:/Users/shaja/Downloads/snowflake_tf_snow_key.p8"
}

provider "snowflake" {
  alias = "security_admin"
  role  = "SECURITYADMIN"
  private_key_path = "C:/Users/shaja/Downloads/snowflake_tf_snow_key.p8"
}

provider "snowflake" {
  alias = "account_admin"
  role  = "ACCOUNTADMIN"
  private_key_path = "C:/Users/shaja/Downloads/snowflake_tf_snow_key.p8"
}

provider "google" {
  project     = "sfdatamigration"
  region      = "us"
  credentials = file("C:/Users/shaja/Downloads/sfdatamigration-e0a3c2ec18cb.json")
}