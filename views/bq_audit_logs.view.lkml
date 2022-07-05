# The name of this view in Looker is "Cloudaudit Googleapis Com Data Access"
view: bq_audit_logs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `chris-playground-297209.san_francisco.cloudaudit_googleapis_com_data_access`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "HTTP Request Cache Fill Bytes" in Explore.

  dimension: protopayload_auditlog__authentication_info__principal_email {
    type: string
    sql: ${TABLE}.protopayload_auditlog.authenticationInfo.principalEmail ;;
    group_label: "Authentication Info"
    group_item_label: "Principal Email"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__event_name {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.eventName ;;
    group_label: "Job Completed Event"
    group_item_label: "Event Name"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__dry_run {
    type: yesno
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.dryRun ;;
    group_label: "Job Completed Event Job Job Configuration"
    group_item_label: "Dry Run"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__labels {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.labels ;;
    group_label: "Job Completed Event Job Job Configuration"
    group_item_label: "Labels"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__create_disposition {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.createDisposition ;;
    group_label: "Job Completed Event Job Job Configuration Query"
    group_item_label: "Create Disposition"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__default_dataset__dataset_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.defaultDataset.datasetId ;;
    group_label: "Job Completed Event Job Job Configuration Query Default Dataset"
    group_item_label: "Dataset ID"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__default_dataset__project_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.defaultDataset.projectId ;;
    group_label: "Job Completed Event Job Job Configuration Query Default Dataset"
    group_item_label: "Project ID"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table__dataset_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.destinationTable.datasetId ;;
    group_label: "Job Completed Event Job Job Configuration Query Destination Table"
    group_item_label: "Dataset ID"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table__project_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.destinationTable.projectId ;;
    group_label: "Job Completed Event Job Job Configuration Query Destination Table"
    group_item_label: "Project ID"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table__table_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.destinationTable.tableId ;;
    group_label: "Job Completed Event Job Job Configuration Query Destination Table"
    group_item_label: "Table ID"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__destination_table_encryption__kms_key_name {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.destinationTableEncryption.kmsKeyName ;;
    group_label: "Job Completed Event Job Job Configuration Query Destination Table Encryption"
    group_item_label: "Kms Key Name"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__query {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.query ;;
    group_label: "Job Completed Event Job Job Configuration Query"
    group_item_label: "Query"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__query_priority {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.queryPriority ;;
    group_label: "Job Completed Event Job Job Configuration Query"
    group_item_label: "Query Priority"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__statement_type {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.statementType ;;
    group_label: "Job Completed Event Job Job Configuration Query"
    group_item_label: "Statement Type"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__table_definitions {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.tableDefinitions ;;
    group_label: "Job Completed Event Job Job Configuration Query"
    group_item_label: "Table Definitions"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_configuration__query__write_disposition {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.writeDisposition ;;
    group_label: "Job Completed Event Job Job Configuration Query"
    group_item_label: "Write Disposition"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_name__job_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobName.jobId ;;
    group_label: "Job Completed Event Job Job Name"
    group_item_label: "Job ID"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_name__location {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobName.location ;;
    group_label: "Job Completed Event Job Job Name"
    group_item_label: "Location"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_name__project_id {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobName.projectId ;;
    group_label: "Job Completed Event Job Job Name"
    group_item_label: "Project ID"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__billing_tier {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.billingTier ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Billing Tier"
  }

  dimension_group: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__create {
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
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.createTime ;;
  }

  dimension_group: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__end {
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
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.endTime ;;
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__query_output_row_count {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.queryOutputRowCount ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Query Output Row Count"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_tables {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.referencedTables ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Referenced Tables"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__referenced_views {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.referencedViews ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Referenced Views"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__reservation_usage {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.reservationUsage ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Reservation Usage"
  }

  dimension_group: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__start {
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
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.startTime ;;
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__total_billed_bytes {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalBilledBytes ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Total Billed Bytes"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__total_load_output_bytes {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalLoadOutputBytes ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Total Load Output Bytes"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__total_processed_bytes {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalProcessedBytes ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Total Processed Bytes"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__total_slot_ms {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalSlotMs ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Total Slot Ms"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__total_tables_processed {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalTablesProcessed ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Total Tables Processed"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_statistics__total_views_processed {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalViewsProcessed ;;
    group_label: "Job Completed Event Job Job Statistics"
    group_item_label: "Total Views Processed"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__additional_errors {
    hidden: yes
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatus.additionalErrors ;;
    group_label: "Job Completed Event Job Job Status"
    group_item_label: "Additional Errors"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__error__code {
    type: number
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatus.error.code ;;
    group_label: "Job Completed Event Job Job Status Error"
    group_item_label: "Code"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__error__message {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatus.error.message ;;
    group_label: "Job Completed Event Job Job Status Error"
    group_item_label: "Message"
  }

  dimension: protopayload_auditlog__servicedata_v1_bigquery__job_completed_event__job__job_status__state {
    type: string
    sql: ${TABLE}.protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatus.state ;;
    group_label: "Job Completed Event Job Job Status"
    group_item_label: "State"
  }

  dimension: protopayload_auditlog__status__code {
    type: number
    sql: ${TABLE}.protopayload_auditlog.status.code ;;
    group_label: "Status"
    group_item_label: "Code"
  }

  dimension: protopayload_auditlog__status__message {
    type: string
    sql: ${TABLE}.protopayload_auditlog.status.message ;;
    group_label: "Status"
    group_item_label: "Message"
  }

  dimension_group: receive_timestamp {
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
    sql: ${TABLE}.receiveTimestamp ;;
  }

  measure: count {
    type: count
  }

}

# The name of this view in Looker is "Cloudaudit Googleapis Com Data Access Job Completed Event Job Job Configuration Labels"
view: job_configuration__labels {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

# The name of this view in Looker is "Cloudaudit Googleapis Com Data Access Job Completed Event Job Job Status Additional Errors"
view: job_status__additional_errors {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_code {
    type: sum
    sql: ${code} ;;
  }

  measure: average_code {
    type: average
    sql: ${code} ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
}

# The name of this view in Looker is "Cloudaudit Googleapis Com Data Access Job Completed Event Job Job Statistics Reservation Usage"
view: job_statistics__reservation_usage {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Name" in Explore.

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: slot_ms {
    type: number
    sql: ${TABLE}.slotMs ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_slot_ms {
    type: sum
    sql: ${slot_ms} ;;
  }

  measure: average_slot_ms {
    type: average
    sql: ${slot_ms} ;;
  }
}

# The name of this view in Looker is "Cloudaudit Googleapis Com Data Access Job Completed Event Job Job Statistics Referenced Views"
view: job_statistics__referenced_views {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Dataset ID" in Explore.

  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }

  dimension: table_id {
    type: string
    sql: ${TABLE}.tableId ;;
  }
}

# The name of this view in Looker is "Cloudaudit Googleapis Com Data Access Job Completed Event Job Job Statistics Referenced Tables"
view: job_statistics__referenced_tables {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Dataset ID" in Explore.

  dimension: dataset_id {
    type: string
    sql: ${TABLE}.datasetId ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.projectId ;;
  }

  dimension: table_id {
    type: string
    sql: ${TABLE}.tableId ;;
  }
}

# The name of this view in Looker is "Cloudaudit Googleapis Com Data Access Job Completed Event Job Job Configuration Query Table Definitions"
view: job_configuration__query__table_definitions {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Name" in Explore.

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: source_uris {
    hidden: yes
    sql: ${TABLE}.sourceUris ;;
  }
}

# The name of this view in Looker is "Cloudaudit Googleapis Com Data Access Job Completed Event Job Job Configuration Query Table Definitions Source Uris"
view: job_configuration__query__table_definitions__source_uris {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cloudaudit Googleapis Com Data Access Job Completed Event Job Job Configuration Query Table Definitions Source Uris" in Explore.

  dimension: job_configuration__query__table_definitions__source_uris {
    type: string
    sql: job_configuration__query__table_definitions__source_uris ;;
  }
}
