include: "../views/*.view"

view: history_data {
  view_label: "Looker: History Data"

  sql_table_name: `@{LOOKER_HISTORY_TABLE}`;;

  dimension_group: dashboard_created_time {
    type: time
    sql: ${TABLE}.dashboard_created_time ;;
    timeframes: [
      time,
      date,
      week,
      month
    ]
    view_label: "Dashboard"
    label: "Created"
  }

  dimension: dashboard_id__user_defined_only_ {
    type: string
    sql: ${TABLE}.dashboard_id__user_defined_only_ ;;
    view_label: "Dashboard"
    label: "ID"
  }

  dimension: dashboard_link {
    type: string
    sql: ${TABLE}.dashboard_link ;;
    view_label: "Dashboard"
    label: "Link"
  }

  dimension: dashboard_lookml_link_id {
    type: string
    sql: ${TABLE}.dashboard_lookml_link_id ;;
    view_label: "Dashboard"
    label: "Link ID"
  }

  dimension: dashboard_moved_to_trash_time {
    type: string
    sql: ${TABLE}.dashboard_moved_to_trash_time ;;
    view_label: "Dashboard"
    label: "Moved to trash time"
  }

  dimension: dashboard_refresh_interval {
    type: string
    sql: ${TABLE}.dashboard_refresh_interval ;;
    view_label: "Dashboard"
    label: "Refresh interval"
  }

  dimension: dashboard_title {
    type: string
    sql: ${TABLE}.dashboard_title ;;
    view_label: "Dashboard"
    label: "Title"
  }

  dimension: history_attempted_cache {
    type: yesno
    sql: ${TABLE}.history_attempted_cache ;;
    view_label: "History"
    label: "Attempted Cache"
  }

  dimension: history_cache_key {
    type: string
    sql: ${TABLE}.history_cache_key ;;
    view_label: "History"
    label: "Cache Key"
  }

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
    view_label: "History"
    label: "Completed"
  }

  dimension: history_connection_id {
    type: number
    sql: ${TABLE}.history_connection_id ;;
    view_label: "History"
    label: "Connection ID"
  }

  dimension: history_connection_name {
    type: string
    sql: ${TABLE}.history_connection_name ;;
    view_label: "History"
    label: "Connection Name"
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
    view_label: "History"
    label: "Created"
  }

  dimension: history_dashboard_id__inclusive_ {
    type: string
    sql: ${TABLE}.history_dashboard_id__inclusive_ ;;
    view_label: "Dashboard"
    label: "ID (inclusive)"
  }

  dimension: history_dashboard_session {
    type: string
    sql: ${TABLE}.history_dashboard_session ;;
    view_label: "History"
    label: "Dashboard Session"
  }

  dimension: history_dialect {
    type: string
    sql: ${TABLE}.history_dialect ;;
    view_label: "History"
    label: "Dialect"
  }

  dimension: history_id {
    type: number
    sql: ${TABLE}.history_id ;;
    view_label: "History"
    label: "ID"
  }

  dimension: history_is_single_query {
    type: yesno
    sql: ${TABLE}.history_is_single_query ;;
    view_label: "History"
    label: "Single Query"
  }

  dimension: history_is_user_dashboard {
    type: yesno
    sql: ${TABLE}.history_is_user_dashboard ;;
    view_label: "History"
    label: "User Dashboard"
  }

  dimension: history_issuer_source {
    type: string
    sql: ${TABLE}.history_issuer_source ;;
    view_label: "History"
    label: "Issuer Source"
  }

  dimension: history_message {
    type: string
    sql: ${TABLE}.history_message ;;
    view_label: "History"
    label: "Message"
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
    view_label: "History"
    label: "Most Recent Query Run"
  }

  dimension: history_most_recent_run_length_in_seconds {
    type: number
    sql: ${TABLE}.history_most_recent_run_length_in_seconds ;;
    view_label: "History"
    label: "Most Recent Run Length in Seconds"
  }

  measure: total_history_most_recent_run_length_in_seconds {
    type: sum
    sql: ${history_most_recent_run_length_in_seconds} ;;
    view_label: "History"
  }

  measure: average_history_most_recent_run_length_in_seconds {
    type: average
    sql: ${history_most_recent_run_length_in_seconds} ;;
    view_label: "History"
  }

  dimension: history_rebuild_pdts {
    type: yesno
    sql: ${TABLE}.history_rebuild_pdts ;;
    view_label: "History"
    label: "Rebuild PDTs"
  }

  dimension: history_render_key {
    type: string
    sql: ${TABLE}.history_render_key ;;
    view_label: "History"
    label: "Render Key"
  }

  dimension: history_result_format {
    type: string
    sql: ${TABLE}.history_result_format ;;
    view_label: "History"
    label: "Result Format"
  }

  dimension: history_result_source {
    type: string
    sql: ${TABLE}.history_result_source ;;
    view_label: "History"
    label: "Result Source"
  }

  dimension: history_runtime_in_seconds {
    type: number
    sql: ${TABLE}.history_runtime_in_seconds ;;
    view_label: "History"
    label: "Runtime in Seconds"
  }

  dimension: history_slug {
    type: string
    sql: ${TABLE}.history_slug ;;
    view_label: "History"
    label: "Slug"
  }

  dimension: history_source {
    type: string
    sql: ${TABLE}.history_source ;;
    view_label: "History"
    label: "Source"
  }

  dimension: history_status {
    type: string
    sql: ${TABLE}.history_status ;;
    view_label: "History"
    label: "Status"
  }

  dimension: history_workspace_id {
    type: string
    sql: ${TABLE}.history_workspace_id ;;
    view_label: "History"
    label: "Workspace ID"
  }

  dimension: look_id {
    type: number
    sql: ${TABLE}.look_id ;;
    view_label: "Look"
    label: "ID"
  }

  dimension: look_title {
    type: string
    sql: ${TABLE}.look_title ;;
    view_label: "Look"
    label: "Title"
  }

  dimension: merge_query_id {
    type: number
    sql: ${TABLE}.merge_query_id ;;
    view_label: "Query"
    label: "Merge Query ID"
  }

  dimension: query_custom_fields {
    hidden: yes
    type: string
    sql: ${TABLE}.query_custom_fields ;;
    view_label: "Query"
    label: "Custom Fields"
  }

  dimension: query_explore {
    type: string
    sql: ${TABLE}.query_explore ;;
    view_label: "Query"
    label: "Explore"
  }

  dimension: query_fields_used {
    hidden: yes
    type: string
    sql: ${TABLE}.query_fields_used ;;
    view_label: "Query"
    label: "Fields Used"
  }

  dimension: query_fill_fields {
    hidden: yes
    type: string
    sql: ${TABLE}.query_fill_fields ;;
    view_label: "Query"
    label: "Fill Fields"
  }

  dimension: query_filters {
    hidden: yes
    type: string
    sql: ${TABLE}.query_filters ;;
    view_label: "Query"
    label: "Query Filters"
  }

  dimension: query_id {
    type: number
    sql: ${TABLE}.query_id ;;
    view_label: "Query"
    label: "ID"
  }

  dimension: query_model {
    type: string
    sql: ${TABLE}.query_model ;;
    view_label: "Query"
    label: "Model"
  }

  dimension: query_pivots_used {
    hidden: yes
    type: string
    sql: ${TABLE}.query_pivots_used ;;
    view_label: "Query"
    label: "Pivots Used"
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
    view_label: "User"
    label: "Email"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    view_label: "User"
    label: "ID"
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
    view_label: "User"
    label: "Name"
  }

  measure: count {
    type: count
    view_label: "History"
  }

  measure: active_users{
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    view_label: "User"
    label: "Active Users"
  }
}
