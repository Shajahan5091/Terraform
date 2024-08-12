resource "snowflake_warehouse" "raw_wh" {
  name    = "raw_wh"
  comment = "This warehouse is used for the raw schema"
  warehouse_size = "xsmall"
  warehouse_type = "standard"
  auto_resume         = true
  auto_suspend        = "1000"
  initially_suspended = true
  scaling_policy    = "economy"
}

resource "snowflake_warehouse" "stage_wh" {
  name    = "stage_wh"
  comment = "This warehouse is used for the staging schema"
  warehouse_size = "xsmall"
  warehouse_type = "standard"
  auto_resume         = true
  auto_suspend        = "1000"
  initially_suspended = true
  scaling_policy    = "economy"
}

resource "snowflake_warehouse" "prod_wh" {
  name    = "prod_wh"
  comment = "This warehouse is used for the production schema"
  warehouse_size = "xsmall"
  warehouse_type = "standard"
  auto_resume         = true
  auto_suspend        = "1000"
  initially_suspended = true
  scaling_policy    = "economy"
}

resource "snowflake_warehouse" "test_wh" {
  name    = "test_wh"
  comment = "This warehouse is used for the testing purpose"
  warehouse_size = "xsmall"
  warehouse_type = "standard"
  auto_resume         = true
  auto_suspend        = "1000"
  initially_suspended = true
  scaling_policy    = "economy"
}