terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.30.0"
    }
  }

  backend "remote" {
    organization = "my_organization"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "ACCOUNTADMIN"
  comment = "Database for Snowflake Terraform demo"
}