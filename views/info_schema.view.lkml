# The name of this view in Looker is "Info Schema"
view: info_schema {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{INFORMATION_SCHEMA_TABLE}`  ;;
  #drill_fields: []
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Bi Engine Statistics Bi Engine Mode" in Explore.

  dimension: history_id {
    type: string
    sql:  (SELECT CAST(value AS INT64) FROM UNNEST(${labels}) as label WHERE label.key = "looker-context-history_id" LIMIT 1);;
    hidden: yes
  }

  dimension: bi_engine_statistics__bi_engine_mode {
    type: string
    sql: ${TABLE}.bi_engine_statistics.bi_engine_mode ;;
    group_label: "Bi Engine Statistics"
    group_item_label: "Bi Engine Mode"
  }

  dimension: bi_engine_statistics__bi_engine_reasons_2 {
    type: string
    sql:  (SELECT bi_engine_reason FROM  UNNEST(${TABLE}.bi_engine_statistics.bi_engine_reasons) as bi_engine_reason WHERE job_type = "QUERY"  LIMIT 1) ;;
    group_label: "Bi Engine Statistics"
    group_item_label: "Bi Engine Reasons"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: bi_engine_statistics__bi_engine_reasons {
    hidden: yes
    sql: ${TABLE}.bi_engine_statistics.bi_engine_reasons ;;
    group_label: "Bi Engine Statistics"
    group_item_label: "Bi Engine Reasons"
  }

  dimension: cache_hit {
    type: yesno
    sql: ${TABLE}.cache_hit ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: creation {
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
    sql: ${TABLE}.creation_time ;;
  }

  dimension: destination_table__dataset_id {
    type: string
    sql: ${TABLE}.destination_table.dataset_id ;;
    group_label: "Destination Table"
    group_item_label: "Dataset ID"
  }

  dimension: destination_table__project_id {
    type: string
    sql: ${TABLE}.destination_table.project_id ;;
    group_label: "Destination Table"
    group_item_label: "Project ID"
  }

  dimension: destination_table__table_id {
    type: string
    sql: ${TABLE}.destination_table.table_id ;;
    group_label: "Destination Table"
    group_item_label: "Table ID"
  }

  dimension: dml_statistics__deleted_row_count {
    type: number
    sql: ${TABLE}.dml_statistics.deleted_row_count ;;
    group_label: "Dml Statistics"
    group_item_label: "Deleted Row Count"
  }

  dimension: dml_statistics__inserted_row_count {
    type: number
    sql: ${TABLE}.dml_statistics.inserted_row_count ;;
    group_label: "Dml Statistics"
    group_item_label: "Inserted Row Count"
  }

  dimension: dml_statistics__updated_row_count {
    type: number
    sql: ${TABLE}.dml_statistics.updated_row_count ;;
    group_label: "Dml Statistics"
    group_item_label: "Updated Row Count"
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: error_result__debug_info {
    type: string
    sql: ${TABLE}.error_result.debug_info ;;
    group_label: "Error Result"
    group_item_label: "Debug Info"
  }

  dimension: error_result__location {
    type: string
    sql: ${TABLE}.error_result.location ;;
    group_label: "Error Result"
    group_item_label: "Location"
  }

  dimension: error_result__message {
    type: string
    sql: ${TABLE}.error_result.message ;;
    group_label: "Error Result"
    group_item_label: "Message"
  }

  dimension: error_result__reason {
    type: string
    sql: ${TABLE}.error_result.reason ;;
    group_label: "Error Result"
    group_item_label: "Reason"
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: job_stages {
    hidden: yes
    sql: ${TABLE}.job_stages ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: parent_job_id {
    type: string
    sql: ${TABLE}.parent_job_id ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: project_number {
    type: number
    sql: ${TABLE}.project_number ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: referenced_tables {
    hidden: yes
    sql: ${TABLE}.referenced_tables ;;
  }

  dimension: reservation_id {
    type: string
    sql: ${TABLE}.reservation_id ;;
  }

  dimension: session_info__session_id {
    type: string
    sql: ${TABLE}.session_info.session_id ;;
    group_label: "Session Info"
    group_item_label: "Session ID"
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_time ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: statement_type {
    type: string
    sql: ${TABLE}.statement_type ;;
  }

  dimension: timeline {
    hidden: yes
    sql: ${TABLE}.timeline ;;
  }


  dimension: transaction_id {
    hidden: yes
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }

# MEASURES
## TOTALS
  measure: total_bytes_billed {
    group_label: "Totals"
    type: sum
    sql: ${TABLE}.total_bytes_billed ;;
  }

  measure: total_bytes_processed {
    group_label: "Totals"
    type: sum
    sql: ${TABLE}.total_bytes_processed ;;
  }

  measure: total_modified_partitions {
    group_label: "Totals"
    type: sum
    sql: ${TABLE}.total_modified_partitions ;;
  }

  measure: total_gigabytes_billed {
    group_label: "Totals"
    type: sum
    sql: ${TABLE}.total_bytes_billed/pow(10,9);;
    value_format: "0.00"
  }

  measure: total_gigabytes_processed {
    group_label: "Totals"
    type: sum
    sql: ${TABLE}.total_bytes_processed/pow(10,9) ;;
    value_format: "0.00"
  }

  measure: total_slot_ms {
    group_label: "Totals"
    type: sum
    sql: ${TABLE}.total_slot_ms ;;
  }

  measure: total_slot_consuption {
    group_label: "Totals"
    type: sum
    sql: ${TABLE} / (1000 * 60 * 60 ) ;;
  }

  measure: total_query_duration_ms {
    group_label: "Totals"
    type: sum
    sql: ${TABLE}.end_time -${TABLE}.start_time;;
  }

## AVG
  measure: avg_gigabytes_billed {
    group_label: "Average"
    type: average
    sql: ${TABLE}.total_bytes_billed/pow(10,9);;
    value_format: "0.00"
  }

  measure: avg_gigabytes_processed {
    group_label: "Average"
    type: average
    sql: ${TABLE}.total_bytes_processed/pow(10,9) ;;
    value_format: "0.00"
  }

  measure: avg_slot_ms {
    group_label: "Average"
    type: average
    sql: ${TABLE}.total_slot_ms ;;
  }

  measure: avg_query_duration_ms {
    group_label: "Average"
    type: average
    sql: ${TABLE}.end_time -${TABLE}.start_time;;
  }

  measure: avg_slot_consumption {
    group_label: "Average"
    type: average
    sql: ${TABLE}.total_slot_ms / (1000 * 60 * 60 ) ;;
  }

## MAX
  measure: max_gigabytes_billed {
    group_label: "Maximum"
    type: average
    sql: ${TABLE}.total_bytes_billed/pow(10,9);;
    value_format: "0.00"
  }

  measure: max_gigabytes_processed {
    group_label: "Maximum"
    type: average
    sql: ${TABLE}.total_bytes_processed/pow(10,9) ;;
    value_format: "0.00"
  }

  measure: max_slot_ms {
    group_label: "Maximum"
    type: average
    sql: ${TABLE}.total_slot_ms ;;
  }

  measure: max_query_duration_ms {
    group_label: "Maximum"
    type: max
    sql: ${TABLE}.end_time -${TABLE}.start_time;;
  }

  measure: max_slot_consumption {
    group_label: "Maximum"
    type: average
    sql: ${TABLE}.total_slot_ms / (1000 * 60 * 60 ) ;;
  }

  ## END

}

# The name of this view in Looker is "Info Schema Labels"
view: info_schema__labels {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: info_schema__labels {
    type: string
    hidden: yes
    sql: info_schema__labels ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Info Schema Timeline"
view: info_schema__timeline {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Active Units" in Explore.

  dimension: active_units {
    type: number
    sql: active_units ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_units {
    type: sum
    sql: ${active_units} ;;
  }

  measure: average_active_units {
    type: average
    sql: ${active_units} ;;
  }

  measure: completed_units {
    type: sum
    sql: completed_units ;;
  }

  measure: elapsed_ms {
    type: sum
    sql: elapsed_ms ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: info_schema__timeline {
    type: string
    hidden: yes
    sql: info_schema__timeline ;;
  }

  measure: pending_units {
    type: sum
    sql: pending_units ;;
  }

  measure: total_slot_ms {
    type: sum
    sql: ${TABLE}.total_slot_ms ;;
  }
}



# The name of this view in Looker is "Info Schema Job Stages"
view: info_schema__job_stages {
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Completed Parallel Inputs" in Explore.

  dimension: completed_parallel_inputs {
    type: number
    sql: completed_parallel_inputs ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_completed_parallel_inputs {
    type: sum
    sql: ${completed_parallel_inputs} ;;
  }

  measure: average_completed_parallel_inputs {
    type: average
    sql: ${completed_parallel_inputs} ;;
  }

  dimension: compute_ms_avg {
    type: number
    sql: compute_ms_avg ;;
  }

  dimension: compute_ms_max {
    type: number
    sql: compute_ms_max ;;
  }

  dimension: compute_ratio_avg {
    type: number
    sql: compute_ratio_avg ;;
  }

  dimension: compute_ratio_max {
    type: number
    sql: compute_ratio_max ;;
  }

  dimension: end_ms {
    type: number
    sql: end_ms ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: info_schema__job_stages {
    type: string
    hidden: yes
    sql: info_schema__job_stages ;;
  }

  dimension: input_stages {
    hidden: yes
    sql: input_stages ;;
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: parallel_inputs {
    type: number
    sql: parallel_inputs ;;
  }

  dimension: read_ms_avg {
    type: number
    sql: read_ms_avg ;;
  }

  dimension: read_ms_max {
    type: number
    sql: read_ms_max ;;
  }

  dimension: read_ratio_avg {
    type: number
    sql: read_ratio_avg ;;
  }

  dimension: read_ratio_max {
    type: number
    sql: read_ratio_max ;;
  }

  dimension: records_read {
    type: number
    sql: records_read ;;
  }

  dimension: records_written {
    type: number
    sql: records_written ;;
  }

  dimension: shuffle_output_bytes {
    type: number
    sql: shuffle_output_bytes ;;
  }

  dimension: shuffle_output_bytes_spilled {
    type: number
    sql: shuffle_output_bytes_spilled ;;
  }

  dimension: slot_ms {
    type: number
    sql: slot_ms ;;
  }

  dimension: start_ms {
    type: number
    sql: start_ms ;;
  }

  dimension: status {
    type: string
    sql: status ;;
  }

  dimension: steps {
    hidden: yes
    sql: steps ;;
  }

  dimension: wait_ms_avg {
    type: number
    sql: wait_ms_avg ;;
  }

  dimension: wait_ms_max {
    type: number
    sql: wait_ms_max ;;
  }

  dimension: wait_ratio_avg {
    type: number
    sql: wait_ratio_avg ;;
  }

  dimension: wait_ratio_max {
    type: number
    sql: wait_ratio_max ;;
  }

  dimension: write_ms_avg {
    type: number
    sql: write_ms_avg ;;
  }

  dimension: write_ms_max {
    type: number
    sql: write_ms_max ;;
  }

  dimension: write_ratio_avg {
    type: number
    sql: write_ratio_avg ;;
  }

  dimension: write_ratio_max {
    type: number
    sql: write_ratio_max ;;
  }
}

# The name of this view in Looker is "Info Schema Referenced Tables"
view: info_schema__referenced_tables {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Dataset ID" in Explore.

  dimension: dataset_id {
    type: string
    sql: dataset_id ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: info_schema__referenced_tables {
    type: string
    hidden: yes
    sql: info_schema__referenced_tables ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: table_id {
    type: string
    sql: table_id ;;
  }
}

# The name of this view in Looker is "Info Schema Job Stages Steps"
view: info_schema__job_stages__steps {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Kind" in Explore.

  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: substeps {
    hidden: yes
    sql: ${TABLE}.substeps ;;
  }
}

# The name of this view in Looker is "Info Schema Job Stages Input Stages"
view: info_schema__job_stages__input_stages {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Info Schema Job Stages Input Stages" in Explore.

  dimension: info_schema__job_stages__input_stages {
    type: number
    sql: info_schema__job_stages__input_stages ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_info_schema__job_stages__input_stages {
    type: sum
    sql: ${info_schema__job_stages__input_stages} ;;
  }

  measure: average_info_schema__job_stages__input_stages {
    type: average
    sql: ${info_schema__job_stages__input_stages} ;;
  }
}

# The name of this view in Looker is "Info Schema Job Stages Steps Substeps"
view: info_schema__job_stages__steps__substeps {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Info Schema Job Stages Steps Substeps" in Explore.

  dimension: info_schema__job_stages__steps__substeps {
    type: string
    sql: info_schema__job_stages__steps__substeps ;;
  }
}

# The name of this view in Looker is "Info Schema Bi Engine Statistics Bi Engine Reasons"
view: info_schema__bi_engine_statistics__bi_engine_reasons {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

}
