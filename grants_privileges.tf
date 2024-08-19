# For BI Reporter
resource "snowflake_grant_privileges_to_account_role" "BI_Reporter_usage_on_database" {
  provider          = snowflake.security_admin
  privileges        = ["USAGE"]
  account_role_name =snowflake_account_role.Reporter.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.ETL.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "BI_Reporter_usage_on_schema" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Reporter.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.prod.name}\"" # note this is a fully qualified name!
  }
}

resource "snowflake_grant_privileges_to_account_role" "BI_Reporter_select_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.Reporter.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.prod.name}\"" # note this is a fully qualified name!
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "BI_Reporter_create_views" {
  privileges        = ["CREATE VIEW", "CREATE MATERIALIZED VIEW", "CREATE TEMPORARY TABLE"]
  account_role_name = snowflake_account_role.Reporter.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.prod.name}\"" # note this is a fully qualified name!
  }
}

resource "snowflake_grant_privileges_to_account_role" "BI_Reporter_select_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.Reporter.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.prod.name}\"" # note this is a fully qualified name!
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "bi_reporter_warehouse_grant_usage" {
  provider          = snowflake.security_admin
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Reporter.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.prod_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "bi_reporter_warehouse_grant_operate" {
  provider          = snowflake.security_admin
  privileges        = ["OPERATE"]
  account_role_name = snowflake_account_role.Reporter.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.prod_wh.name
  }
}

# For Data Analyst
resource "snowflake_grant_privileges_to_account_role" "Data_Analyst_create_table" {
  provider          = snowflake.security_admin
  privileges        = ["CREATE TABLE"]
  account_role_name = snowflake_account_role.Analyst.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.prod.name}\"" # note this is a fully qualified name!
  }
  with_grant_option = true
}

# resource "snowflake_grant_privileges_to_account_role" "Data_Analyst_usage_on_schema_raw" {
#   privileges        = ["USAGE"]
#   account_role_name = snowflake_account_role.Analyst.name
#   on_schema {
#     schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\"" # note this is a fully qualified name!
#   }
# }

# For Test Engineer
resource "snowflake_grant_privileges_to_account_role" "Test_Engineer_usage_on_database" {
  provider          = snowflake.security_admin
  privileges        = ["USAGE"]
  account_role_name =snowflake_account_role.Test.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.ETL.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "Test_Engineer_usage_on_schema_raw" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Test.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\"" # note this is a fully qualified name!
  }
}

resource "snowflake_grant_privileges_to_account_role" "Test_Engineer_usage_on_schema_stage" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Test.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.stage.name}\"" # note this is a fully qualified name!
  }
}

resource "snowflake_grant_privileges_to_account_role" "Test_Engineer_usage_on_schema_prod" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Test.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.prod.name}\"" # note this is a fully qualified name!
  }
}

resource "snowflake_grant_privileges_to_account_role" "Test_Engineer_warehouse_grant_usage" {
  provider          = snowflake.security_admin
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Test.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.test_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "Test_Engineer_warehouse_grant_operate" {
  provider          = snowflake.security_admin
  privileges        = ["OPERATE"]
  account_role_name = snowflake_account_role.Test.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.test_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "Test_Engineer_creates" {
  privileges        = ["CREATE TABLE", "CREATE VIEW"]
  account_role_name = snowflake_account_role.Test.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\"" # note this is a fully qualified name!
  }
}

resource "snowflake_grant_privileges_to_account_role" "Test_Engineer_usage_on_stages" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Test.name
  on_schema_object {
    all {
      object_type_plural = "STAGES"
      in_schema          = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\"" # note this is a fully qualified name!
    }
  }
}

# For Pipeline Operator
resource "snowflake_grant_privileges_to_account_role" "Pipeline_Operator_operate_on_pipes" {
  privileges        = ["OPERATE"]
  account_role_name = snowflake_account_role.Pipeline.name
  on_schema_object {
    all {
      object_type_plural = "PIPES"
      in_schema          = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\"" # note this is a fully qualified name!
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "Pipeline_Operator_usage_on_stages" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Pipeline.name
  on_schema_object {
    all {
      object_type_plural = "STAGES"
      in_schema          = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\"" # note this is a fully qualified name!
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "Pipeline_Operator_usage_on_database" {
  provider          = snowflake.security_admin
  privileges        = ["USAGE"]
  account_role_name =snowflake_account_role.Pipeline.name
  on_account_object {
    object_type = "DATABASE"    
    object_name = snowflake_database.ETL.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "Pipeline_Operator_usage_on_schema_raw" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Pipeline.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\"" # note this is a fully qualified name!
  }
}

resource "snowflake_grant_privileges_to_account_role" "Pipeline_Operator_warehouse_grant_operate" {
  provider          = snowflake.security_admin
  privileges        = ["USAGE", "OPERATE"]
  account_role_name = snowflake_account_role.Pipeline.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.raw_wh.name
  }
}

# For Data Engineer
resource "snowflake_grant_privileges_to_account_role" "Data_Engineer_create_pipes" {
  privileges        = ["CREATE PIPE"]
  account_role_name = snowflake_account_role.Engineer.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\"" # note this is a fully qualified name!
  }
}

resource "snowflake_grant_privileges_to_account_role" "Data_Engineer_usage_on_integration" {
  provider          = snowflake.account_admin
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Engineer.name
  on_account_object {
    object_type = "INTEGRATION"
    object_name = snowflake_storage_integration.gcs_integration.name
  }
}

# For Data Architect
resource "snowflake_grant_privileges_to_account_role" "Data_Architect_create_schema" {
  privileges        = ["CREATE SCHEMA"]
  account_role_name = snowflake_account_role.Architect.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.ETL.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "Data_Architect_usage_on_integration" {
  provider          = snowflake.account_admin
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.Architect.name
  on_account_object {
    object_type = "INTEGRATION"
    object_name = snowflake_storage_integration.gcs_integration.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "Data_Architect_creates_stage" {
  privileges        = ["CREATE STAGE"]
  account_role_name = snowflake_account_role.Architect.name
  on_schema {
    schema_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\"" # note this is a fully qualified name!
  }
}

# For Admin
resource "snowflake_grant_privileges_to_account_role" "Admin_grants" {
  account_role_name = snowflake_account_role.Admin.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.ETL.name
  }
  all_privileges    = true
  with_grant_option = true
}

resource "snowflake_grant_ownership" "Admin_stage_grants" {
  account_role_name = snowflake_account_role.Admin.name
  on {
    all {
      object_type_plural = "STAGES"
      in_database        = snowflake_database.ETL.name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "Admin_create_warehouse" {
  privileges        = ["CREATE WAREHOUSE"]
  account_role_name = snowflake_account_role.Admin.name
  on_account        = true
}

resource "snowflake_grant_privileges_to_account_role" "SYSADMIN_usage_on_integration" {
  provider          = snowflake.account_admin
  privileges        = ["USAGE"]
  account_role_name = "SYSADMIN"
  on_account_object {
    object_type = "INTEGRATION"
    object_name = snowflake_storage_integration.gcs_integration.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "Pipeline_Operator_grants_on_stage" {
  account_role_name = snowflake_account_role.Pipeline.name
  on_schema_object {
    object_type = "STAGE"
    object_name = "\"${snowflake_database.ETL.name}\".\"${snowflake_schema.raw.name}\".\"${snowflake_stage.gcp_stage_2.name}\"" # note this is a fully qualified name!
  }
  all_privileges    = true
  with_grant_option = true
}