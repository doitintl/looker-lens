include: "/views/*.view"

explore: history_data {
  description: "This explore allows you to slice and dice your looker history data togther with metrics from GCP. The default range of data you are looking at is in the past 30 days"

  always_filter: {
    filters: [billing_export.export_date: "30 days", history_data.history_created_date: "30 days"]
  }
  label: "LOOKER LENS 🔎"

  join: billing_export {
    view_label: "Billing Export"
    sql_on: ${history_data.history_id} = ${billing_export.history_id}
      AND DATE_DIFF(${history_data.history_created_date}, ${billing_export.export_date}, DAY) < 7;;
    relationship: one_to_one
  }

  join: billing_export__labels {
    view_label: "Billing Export"
    sql: LEFT JOIN UNNEST(${billing_export.labels_array}) as billing_export__labels ;;
    relationship: one_to_many
  }

  join: billing_export__project__labels {
    view_label: "Billing Export"
    sql: LEFT JOIN UNNEST(${billing_export.project__labels}) as billing_export__project__labels ;;
    relationship: one_to_many
  }

  join: bq_audit_logs {
    view_label: "Audit Logs"
    sql_on: ${bq_audit_logs.history_id}) = ${history_data.history_id} ;;
    relationship: one_to_many
  }

  join: job_configuration__labels {
    view_label: "Audit Logs"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.labels_array}) as job_configuration__labels ;;
    relationship: one_to_many
  }

  join: job_status__additional_errors {
    view_label: "Audit Logs"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.job_status__additional_errors_array}) as job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: job_statistics__reservation_usage {
    view_label: "Audit Logs"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.job_statistics__reservation_usage}) as job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: job_statistics__referenced_views {
    view_label: "Audit Logs"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.job_statistics__referenced_views_array}) as job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: job_statistics__referenced_tables {
    view_label: "Audit Logs"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.job_statistics__referenced_tables}) as job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: job_configuration__query__table_definitions {
    view_label: "Audit Logs"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.table_definitions_array}) as job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: job_configuration__query__table_definitions__source_uris {
    view_label: "Audit Logs"
    sql: LEFT JOIN UNNEST(${job_configuration__query__table_definitions.source_uris}) as job_configuration__query__table_definitions__source_uris ;;
    relationship: one_to_many
  }
}
