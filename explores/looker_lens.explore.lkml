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
    view_label: "Billing Export: Labels"
    sql: LEFT JOIN UNNEST(${billing_export.labels}) as billing_export__labels ;;
    relationship: one_to_many
  }

  join: billing_export__report {
    view_label: "Billing Export: Report"
    sql: LEFT JOIN UNNEST(${billing_export.report}) as billing_export__report ;;
    relationship: one_to_many
  }

  join: billing_export__credits {
    view_label: "Billing Export: Credits"
    sql: LEFT JOIN UNNEST(${billing_export.credits}) as billing_export__credits ;;
    relationship: one_to_many
  }

  join: billing_export__gcp_metrics {
    view_label: "Billing Export: Gcp Metrics"
    sql: LEFT JOIN UNNEST(${billing_export.gcp_metrics}) as billing_export__gcp_metrics ;;
    relationship: one_to_many
  }

  #join: billing_export__system_labels {
  #  view_label: "Billing Export: System Labels"
  #  sql: LEFT JOIN UNNEST(${billing_export.system_labels}) as billing_export__system_labels ;;
  #  relationship: one_to_many
  #}

  join: billing_export__project__labels {
    view_label: "Billing Export: Project Labels"
    sql: LEFT JOIN UNNEST(${billing_export.project__labels}) as billing_export__project__labels ;;
    relationship: one_to_many
  }

  join: bq_audit_logs {
    view_label: "Audit Logs"
    sql_on: ${bq_audit_logs.history_id}) = ${history_data.history_id} ;;
    relationship: one_to_many
  }

  join: job_configuration__labels {
    view_label: "Labels"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.labels_array}) as job_configuration__labels ;;
    relationship: one_to_many
  }

  join: job_status__additional_errors {
    view_label: "Errors"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.job_status__additional_errors_array}) as job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: job_statistics__reservation_usage {
    view_label: "Reservation Usage"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.job_statistics__reservation_usage}) as job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: job_statistics__referenced_views {
    view_label: "Referenced Views"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.job_statistics__referenced_views_array}) as job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: job_statistics__referenced_tables {
    view_label: "Referenced Tables"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.job_statistics__referenced_tables}) as job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: job_configuration__query__table_definitions {
    view_label: "Table Definitions"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.table_definitions_array}) as job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: job_configuration__query__table_definitions__source_uris {
    view_label: "Table Definitions"
    sql: LEFT JOIN UNNEST(${job_configuration__query__table_definitions.source_uris}) as job_configuration__query__table_definitions__source_uris ;;
    relationship: one_to_many
  }



  join: info_schema {
    view_label: "Big Query: Information Schema"
    sql_on: ${history_data.history_id} = ${info_schema.history_id};;
    relationship: one_to_one
  }

  #join: info_schema__labels {
  #  view_label: "Info Schema: Labels"
  #  sql: LEFT JOIN UNNEST(${info_schema.labels}) as info_schema__labels ;;
  #  relationship: one_to_many
  #}

  #join: info_schema__timeline {
  #  view_label: "Info Schema: Timeline"
  #  sql: LEFT JOIN UNNEST(${info_schema.timeline}) as info_schema__timeline ;;
  #  relationship: one_to_many
  #}

  #join: info_schema__job_stages {
  #  view_label: "Info Schema: Job Stages"
  #  sql: LEFT JOIN UNNEST(${info_schema.job_stages}) as info_schema__job_stages ;;
  #  relationship: one_to_many
  #}

  #join: info_schema__referenced_tables {
  #  view_label: "Info Schema: Referenced Tables"
  #  sql: LEFT JOIN UNNEST(${info_schema.referenced_tables}) as info_schema__referenced_tables ;;
  #  relationship: one_to_many
  #}

  #join: info_schema__job_stages__steps {
  #  view_label: "Info Schema: Job Stages Steps"
  #  sql: LEFT JOIN UNNEST(${info_schema__job_stages.steps}) as info_schema__job_stages__steps ;;
  #  relationship: one_to_many
  #}

  #join: info_schema__job_stages__input_stages {
  #  view_label: "Info Schema: Job Stages Input Stages"
  #  sql: LEFT JOIN UNNEST(${info_schema__job_stages.input_stages}) as info_schema__job_stages__input_stages ;;
  #  relationship: one_to_many
  #}

  #join: info_schema__job_stages__steps__substeps {
  #  view_label: "Info Schema: Job Stages Steps Substeps"
  #  sql: LEFT JOIN UNNEST(${info_schema__job_stages__steps.substeps}) as info_schema__job_stages__steps__substeps ;;
  #  relationship: one_to_many
  #}

  #join: info_schema__bi_engine_statistics__bi_engine_reasons {
  #  view_label: "Info Schema: Bi Engine Statistics Bi Engine Reasons"
  #  sql: LEFT JOIN UNNEST(${info_schema.bi_engine_statistics__bi_engine_reasons}) as info_schema__bi_engine_statistics__bi_engine_reasons ;;
  #  relationship: one_to_many
  #}
}
