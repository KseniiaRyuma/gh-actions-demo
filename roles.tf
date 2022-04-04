locals {
  roles = {
    "LOADER" = {
      comment = "Owns the tables in raw schema"
    }
    "TRANSFORMER" = {
      comment = "Has query permissions on tables in raw schema and owns tables in the analytics schema."
    }
  }
}

resource "snowflake_role" "role" {
  for_each = local.roles
  name     = each.key
  comment  = each.value.comment
}