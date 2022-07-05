include: "/views/*.view"

view: +bq_audit_logs {
  # SUM
  measure: total_job_statistics__total_load_output_bytes {
    sql: ${job_statistics__total_load_output_bytes} ;;
    type: sum
    group_label: "Totals"
    group_item_label: "Load Output Bytes"
  }

  measure: total_job_statistics__totalProcessedBytes {
    type: sum
    sql: ${job_statistics__total_processed_bytes} ;;
    group_label: "Totals"
    group_item_label: "Processed Bytes"
  }

  measure: total_job_statistics__totalProcessedBytes {
    type: sum
    sql: ${job_statistics__total_billed_bytes} ;;
    group_label: "Totals"
    group_item_label: "Billed Bytes"
  }

  measure: total_job_statistics__total_slot_ms {
    type: sum
    sql: ${job_statistics__total_slot_ms}lotMs} ;;
    group_label: "Totals"
    group_item_label: "Slot Ms"
  }

  measure: total_job_statistics__total_tables_processed {
    type: number
    sql: ${job_statistics__total_tables_processed}ablesProcessed} ;;
    group_label: "Totals"
    group_item_label: "Tables Processed"
  }

  measure: total_job_statistics__total_views_processed {
    type: number
    sql: ${job_statistics__total_views_processed} ;;
    group_label: "Totals"
    group_item_label: "Views Processed"
  }


  # AVG
  measure: avg_job_statistics__total_load_output_bytes {
    sql: ${job_statistics__total_load_output_bytes} ;;
    type: average
    group_label: "Average"
    group_item_label: "Load Output Bytes"
  }

  measure: avg_job_statistics__totalProcessedBytes {
    type: average
    sql: ${job_statistics__total_processed_bytes} ;;
    group_label: "Average"
    group_item_label: "Processed Bytes"
  }

  measure: avg_job_statistics__total_slot_ms {
    type: average
    sql: ${job_statistics__total_slot_ms}} ;;
    group_label: "Average"
    group_item_label: "Slot Ms"
  }

  measure: avg_job_statistics__total_tables_processed {
    type: average
    sql: ${job_statistics__total_tables_processed}ablesProcessed} ;;
    group_label: "Average"
    group_item_label: "Tables Processed"
  }

  measure: avg_job_statistics__total_views_processed {
    type: average
    sql: ${total_job_statistics__total_views_processed} ;;
    group_label: "Average"
    group_item_label: "Views Processed"
  }

  measure: avg_job_statistics__totalProcessedBytes {
    type: average
    sql: ${job_statistics__total_billed_bytes} ;;
    group_label: "Average"
    group_item_label: "Billed Bytes"
  }
}

view: +billing_export {

  # SUM
  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    group_label: "Totals"
    group_item_label: "Cost"
  }

  measure: total_discount__value {
    type: sum
    sql: ${discount__value} ;;
    group_label: "Totals"
    group_item_label: "Discount"
  }

  measure: total_usage__amount {
    type:  sum
    sql: ${usage__amount} ;;
    group_label: "Totals"
    group_item_label: "Usage"
  }

    # AVG
  measure: avg_cost {
    type: average
    sql: ${cost} ;;
    group_label: "Average"
    group_item_label: "Average Cost"
  }

  measure: avg_discount__value {
    type: average
    sql: ${discount__value} ;;
    group_label: "Average"
    group_item_label: "Average Discount"
  }

  measure: avg_usage__amount {
    type:  average
    sql: ${usage__amount} ;;
    group_label: "Average"
    group_item_label: "Average Usage"
  }
  }
