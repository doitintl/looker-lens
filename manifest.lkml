project_name: "looker_lens"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

################ Constants ################

# Used in google_analytics_block.model connection param
constant: CONNECTION_NAME {
  value: "chris-playground"
  export: override_required
}

constant: BILLING_EXPORT_TABLE {
  value: "chris-playground-297209.looker_lens.billing_export_v1_01A29B_B56F30_AA7597"
  export: override_required
}

constant: LOOKER_HISTORY_TABLE {
  value: "chris-playground-297209.looker_lens.test4"
  export: override_required
}

constant: INFORMATION_SCHEMA_TABLE {
  value: "region-us.INFORMATION_SCHEMA.JOBS_BY_PROJECT"
  export: override_optional
}
