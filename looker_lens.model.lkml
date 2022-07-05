connection: "@{CONNECTION_NAME}"

include: "/views/*.view.lkml"
include: "/explores/*.explore.lkml"
#include: "/dashboards/*.dashboard.lookml"

explore: bq_audit_logs {
  # hidden: yes

  join: job_configuration__labels {
    view_label: "Labels"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__labels}) as job_configuration__labels ;;
    relationship: one_to_many
  }

  join: job_status__additional_errors {
    view_label: "Errors"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__additional_errors}) as job_status__additional_errors ;;
    relationship: one_to_many
  }

  join: job_statistics__reservation_usage {
    view_label: "Reservation Usage"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__reservation_usage}) as job_statistics__reservation_usage ;;
    relationship: one_to_many
  }

  join: job_statistics__referenced_views {
    view_label: "Referenced Views"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_views}) as job_statistics__referenced_views ;;
    relationship: one_to_many
  }

  join: job_statistics__referenced_tables {
    view_label: "Referenced Tables"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_tables}) as job_statistics__referenced_tables ;;
    relationship: one_to_many
  }

  join: job_configuration__query__table_definitions {
    view_label: "Table Definitions"
    sql: LEFT JOIN UNNEST(${bq_audit_logs.protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__table_definitions}) as job_configuration__query__table_definitions ;;
    relationship: one_to_many
  }

  join: job_configuration__query__table_definitions__source_uris {
    view_label: "Table Definitions"
    sql: LEFT JOIN UNNEST(${job_configuration__query__table_definitions.source_uris}) as job_configuration__query__table_definitions__source_uris ;;
    relationship: one_to_many
  }
}
