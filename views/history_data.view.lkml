# The name of this view in Looker is "Test3"
view: history_data {
  view_label: "Looker: History Data"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{LOOKER_HISTORY_TABLE}`;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Dashboard Created Time" in Explore.

  dimension: dashboard_created_time {
    type: string
    sql: ${TABLE}.dashboard_created_time ;;
  }

  dimension: dashboard_id__user_defined_only_ {
    type: string
    sql: ${TABLE}.dashboard_id__user_defined_only_ ;;
  }

  dimension: dashboard_link {
    type: string
    sql: ${TABLE}.dashboard_link ;;
  }

  dimension: dashboard_lookml_link_id {
    type: string
    sql: ${TABLE}.dashboard_lookml_link_id ;;
  }

  dimension: dashboard_moved_to_trash_time {
    type: string
    sql: ${TABLE}.dashboard_moved_to_trash_time ;;
  }

  dimension: dashboard_refresh_interval {
    type: string
    sql: ${TABLE}.dashboard_refresh_interval ;;
  }

  dimension: dashboard_title {
    type: string
    sql: ${TABLE}.dashboard_title ;;
  }

  dimension: history_attempted_cache {
    type: yesno
    sql: ${TABLE}.history_attempted_cache ;;
  }

  dimension: history_cache_key {
    type: string
    sql: ${TABLE}.history_cache_key ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: history_completed {
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
    sql: ${TABLE}.history_completed_time ;;
  }

  dimension: history_connection_id {
    type: number
    sql: ${TABLE}.history_connection_id ;;
  }

  dimension: history_connection_name {
    type: string
    sql: ${TABLE}.history_connection_name ;;
  }

  dimension_group: history_created {
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
    sql: ${TABLE}.history_created_time ;;
  }

  dimension: history_dashboard_id__inclusive_ {
    type: string
    sql: ${TABLE}.history_dashboard_id__inclusive_ ;;
  }

  dimension: history_dashboard_session {
    type: string
    sql: ${TABLE}.history_dashboard_session ;;
  }

  dimension: history_dialect {
    type: string
    sql: ${TABLE}.history_dialect ;;
  }

  dimension: history_id {
    type: number
    sql: ${TABLE}.history_id ;;
  }

  dimension: history_is_single_query {
    type: yesno
    sql: ${TABLE}.history_is_single_query ;;
  }

  dimension: history_is_user_dashboard {
    type: yesno
    sql: ${TABLE}.history_is_user_dashboard ;;
  }

  dimension: history_issuer_source {
    type: string
    sql: ${TABLE}.history_issuer_source ;;
  }

  dimension: history_message {
    type: string
    sql: ${TABLE}.history_message ;;
  }

  dimension_group: history_most_recent_query_run_at {
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
    sql: ${TABLE}.history_most_recent_query_run_at_time ;;
  }

  dimension: history_most_recent_run_length_in_seconds {
    type: number
    sql: ${TABLE}.history_most_recent_run_length_in_seconds ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_history_most_recent_run_length_in_seconds {
    type: sum
    sql: ${history_most_recent_run_length_in_seconds} ;;
  }

  measure: average_history_most_recent_run_length_in_seconds {
    type: average
    sql: ${history_most_recent_run_length_in_seconds} ;;
  }

  dimension: history_rebuild_pdts {
    type: yesno
    sql: ${TABLE}.history_rebuild_pdts ;;
  }

  dimension: history_render_key {
    type: string
    sql: ${TABLE}.history_render_key ;;
  }

  dimension: history_result_format {
    type: string
    sql: ${TABLE}.history_result_format ;;
  }

  dimension: history_result_source {
    type: string
    sql: ${TABLE}.history_result_source ;;
  }

  dimension: history_runtime_in_seconds {
    type: number
    sql: ${TABLE}.history_runtime_in_seconds ;;
  }

  dimension: history_slug {
    type: string
    sql: ${TABLE}.history_slug ;;
  }

  dimension: history_source {
    type: string
    sql: ${TABLE}.history_source ;;
  }

  dimension: history_status {
    type: string
    sql: ${TABLE}.history_status ;;
  }

  dimension: history_workspace_id {
    type: string
    sql: ${TABLE}.history_workspace_id ;;
  }

  dimension: look_id {
    type: number
    sql: ${TABLE}.look_id ;;
  }

  dimension: look_title {
    type: string
    sql: ${TABLE}.look_title ;;
  }

  dimension: merge_query_id {
    type: number
    sql: ${TABLE}.merge_query_id ;;
  }

  dimension: query_custom_fields {
    type: string
    sql: ${TABLE}.query_custom_fields ;;
  }

  dimension: query_explore {
    type: string
    sql: ${TABLE}.query_explore ;;
  }

  dimension: query_fields_used {
    type: string
    sql: ${TABLE}.query_fields_used ;;
  }

  dimension: query_fill_fields {
    type: string
    sql: ${TABLE}.query_fill_fields ;;
  }

  dimension: query_filters {
    type: string
    sql: ${TABLE}.query_filters ;;
  }

  dimension: query_id {
    type: number
    sql: ${TABLE}.query_id ;;
  }

  dimension: query_model {
    type: string
    sql: ${TABLE}.query_model ;;
  }

  dimension: query_pivots_used {
    type: string
    sql: ${TABLE}.query_pivots_used ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  measure: count {
    type: count
    drill_fields: [user_name, history_connection_name, dashboard_created_time, history_created_time]
  }

  measure: count_distinct_history_id {
    type: count_distinct
    sql: ${TABLE}.history_id ;;
    }


}
