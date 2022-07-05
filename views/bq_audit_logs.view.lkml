# The name of this view in Looker is "Cloudaudit Googleapis Com Data Access"
view: bq_audit_logs {

  sql_table_name: `@{AUDIT_LOG_TABLE}`;;

  dimension: history_id {
    # hidden: yes
    type: string
    sql:   (SELECT CAST(value AS INT64) FROM UNNEST(${labels_array}) as label WHERE label.key = "looker-context-history_id" LIMIT 1);;
    label: "Looker History ID"
  }

  dimension: principal_email {
    type: string
    sql: ${TABLE}.protopayload_auditlog.authenticationInfo.principalEmail ;;
    label: "Principal Email"
  }

  # dimension: event_name {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.eventName ;;
  #   label: "Event Name"
  # }

  # dimension: dry_run {
  #   type: yesno
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.dryRun ;;
  #   label: "Dry Run"
  # }

  dimension: labels_array {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.labels ;;
    label: "Labels"
  }

  # dimension: job_configuration__query__create_disposition {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.createDisposition ;;
  #   label: "Create Disposition"
  # }

  # dimension: default_dataset__dataset_id {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.defaultDataset.datasetId ;;
  #   group_label: "Default Dataset"
  #   label: "Dataset ID"
  # }

  # dimension: default_dataset__project_id {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.defaultDataset.projectId ;;
  #   group_label: "Default Dataset"
  #   group_item_label: "Project ID"
  # }

  dimension: destination_table__dataset_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.destinationTable.datasetId ;;
    group_label: "Destination Table"
    group_item_label: "Dataset ID"
  }

  dimension: destination_table__project_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.destinationTable.projectId ;;
    group_label: "Destination Table"
    group_item_label: "Project ID"
  }

  dimension: destination_table__table_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.destinationTable.tableId ;;
    group_label: "Destination Table"
    group_item_label: "Table ID"
  }

  # dimension: kms_key_name {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.destinationTableEncryption.kmsKeyName ;;
  #   label: "Kms Key Name"
  # }

  dimension: query {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.query ;;
    label: "Query"
  }

  # dimension: query_priority {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.queryPriority ;;
  #   label: "Query Priority"
  # }

  dimension: statement_type {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.statementType ;;
    label: "Statement Type"
  }

  dimension: table_definitions_array {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.tableDefinitions ;;
    label: "Table Definitions"
  }

  # dimension: write_disposition {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.writeDisposition ;;
  #   label: "Write Disposition"
  # }

  dimension: job_name__job_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobName.jobId ;;
    group_label: "Job Name"
    group_item_label: "Job ID"
  }

  dimension: job_name__location {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobName.location ;;
    group_label: "Job Name"
    group_item_label: "Location"
  }

  dimension: job_name__project_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobName.projectId ;;
    group_label: "Job Name"
    group_item_label: "Project ID"
  }

  dimension: job_statistics__billing_tier {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.billingTier ;;
    group_label: "Job Statistics"
    group_item_label: "Billing Tier"
  }

  # dimension_group: job_statistics__create {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.createTime ;;
  #   label: "Create"
  # }

  # dimension_group: job_statistics__end {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.endTime ;;
  #   label: "Job End"
  # }

  dimension: job_statistics__query_output_row_count {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.queryOutputRowCount ;;
    group_label: "Job Statistics"
    group_item_label: "Query Output Row Count"
  }

  dimension: job_statistics__referenced_tables_array {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.referencedTables ;;
    group_label: "Job Statistics"
    group_item_label: "Referenced Tables"
  }

  dimension: job_statistics__referenced_views_array {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.referencedViews ;;
    group_label: "Job Statistics"
    group_item_label: "Referenced Views"
  }

  dimension: job_statistics__reservation_usage_array {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.reservationUsage ;;
    group_label: "Job Statistics"
    group_item_label: "Reservation Usage"
  }

  # dimension_group: job_statistics__start {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.startTime ;;
  #   label: "Job Start"
  # }

  dimension: job_statistics__total_billed_bytes {
    hidden: yes
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalBilledBytes ;;
    group_label: "Job Statistics"
    group_item_label: "Total Billed Bytes"
  }

   dimension: job_statistics__total_load_output_bytes {
    hidden: yes
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalLoadOutputBytes ;;
    group_label: "Job Statistics"
    group_item_label: "Total Load Output Bytes"
  }

   dimension: job_statistics__total_processed_bytes {
    hidden: yes
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalProcessedBytes ;;
    group_label: "Job Statistics"
    group_item_label: "Total Processed Bytes"
  }

   dimension: job_statistics__total_slot_ms {
    hidden: yes
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalSlotMs ;;
    group_label: "Job Statistics"
    group_item_label: "Total Slot Ms"
  }

   dimension: job_statistics__total_tables_processed {
    hidden: yes
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalTablesProcessed ;;
    group_label: "Job Statistics"
    group_item_label: "Total Tables Processed"
  }

   dimension: job_statistics__total_views_processed {
    hidden: yes
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalViewsProcessed ;;
    group_label: "Job Statistics"
    group_item_label: "Total Views Processed"
  }

  dimension: job_status__additional_errors_array {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatus.additionalErrors ;;
    group_label: "Job Completed Event Job Job Status"
    group_item_label: "Additional Errors"
  }

  # dimension: job_status__error__code {
  #   type: number
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatus.error.code ;;
  #   group_label: "Status"
  #   group_item_label: "Error Code"
  # }

  # dimension: job_status__error__message {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatus.error.message ;;
  #   group_label: "Status"
  #   group_item_label: "Error Message"
  # }

  # dimension: job_status__state {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatus.state ;;
  #   group_label: "Status"
  #   group_item_label: "State"
  # }

  # dimension: protopayload_auditlog__status__code {
  #   type: number
  #   sql: ${TABLE}.protopayload_auditlog.status.code ;;
  #   group_label: "Status"
  #   group_item_label: "Code"
  # }

  # dimension: protopayload_auditlog__status__message {
  #   type: string
  #   sql: ${TABLE}.protopayload_auditlog.status.message ;;
  #   group_label: "Status"
  #   group_item_label: "Message"
  # }

  dimension_group: timestamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
    description: "Used for partitioning"
  }
}

view: job_configuration__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
    group_label: "Labels"
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
    group_label: "Labels"
  }
}

# view: job_status__additional_errors {
#   dimension: code {
#     type: number
#     sql: ${TABLE}.code ;;
#     group_label: "Additional Errors"
#   }

#   dimension: message {
#     type: string
#     sql: ${TABLE}.message ;;
#     group_label: "Additional Errors"
#   }
# }

view: job_statistics__reservation_usage {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    group_label: "Reservation Usage"
  }

  dimension: slot_ms {
    hidden: yes
    type: number
    sql: ${TABLE}.slotMs ;;
    group_label: "Reservation Usage"
  }
}

view: job_statistics__referenced_views {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
    group_label: "Referenced Views"
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
    group_label: "Referenced Views"
  }

  dimension: table_id {
    type: string
    sql: ${TABLE}.tableId ;;
    group_label: "Referenced Views"
  }
}

view: job_statistics__referenced_tables {
  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
    group_label: "Referenced Tables"
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
    group_label: "Referenced Tables"
  }

  dimension: table_id {
    type: string
    sql: ${TABLE}.tableId ;;
    group_label: "Referenced Tables"
  }
}

# view: job_configuration__query__table_definitions {
#   dimension: name {
#     type: string
#     sql: ${TABLE}.name ;;
#     group_label: "Table Definitions"
#   }

#   dimension: source_uris {
#     hidden: yes
#     sql: ${TABLE}.sourceUris ;;
#     group_label: "Table Definitions"
#   }
# }

# view: job_configuration__query__table_definitions__source_uris {
#   dimension: table_definitions__source_uris {
#     type: string
#     sql: job_configuration__query__table_definitions__source_uris ;;
#     group_label: "Table Definitions"
#     group_item_label: "Source URI"
#   }
# }
