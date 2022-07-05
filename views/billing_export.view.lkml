view: billing_export {

  sql_table_name: `@{BILLING_EXPORT_TABLE}`;;

  dimension: history_id {
    type: string
    sql:  (SELECT CAST(value AS INT64) FROM UNNEST(${labels_array}) as label WHERE label.key = "looker-context-history_id" LIMIT 1);;
    hidden: yes
  }

  # dimension: adjustment_info__description {
  #   type: string
  #   sql: ${TABLE}.adjustment_info.description ;;
  #   group_label: "Adjustment Info"
  #   group_item_label: "Description"
  # }

  # dimension: adjustment_info__id {
  #   type: string
  #   sql: ${TABLE}.adjustment_info.id ;;
  #   group_label: "Adjustment Info"
  #   group_item_label: "ID"
  # }

  # dimension: adjustment_info__mode {
  #   type: string
  #   sql: ${TABLE}.adjustment_info.mode ;;
  #   group_label: "Adjustment Info"
  #   group_item_label: "Mode"
  # }

  # dimension: adjustment_info__type {
  #   type: string
  #   sql: ${TABLE}.adjustment_info.type ;;
  #   group_label: "Adjustment Info"
  #   group_item_label: "Type"
  # }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_conversion_rate {
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
  }

  # dimension: discount__is_commitment {
  #   type: string
  #   sql: ${TABLE}.discount.is_commitment ;;
  #   group_label: "Discount"
  #   group_item_label: "Is Commitment"
  # }

  # dimension: discount__rebase_modifier {
  #   type: number
  #   sql: ${TABLE}.discount.rebase_modifier ;;
  #   group_label: "Discount"
  #   group_item_label: "Rebase Modifier"
  # }

  # dimension: discount__value {
  #   type: number
  #   sql: ${TABLE}.discount.value ;;
  #   group_label: "Discount"
  #   group_item_label: "Value"
  # }

  # dimension: exclude_discount {
  #   type: yesno
  #   sql: ${TABLE}.exclude_discount ;;
  #   group_label: "Discount"
  # }

  dimension_group: export {
    type: time
    timeframes: [
      raw,
      time,
      date,
    ]
    sql: ${TABLE}.export_time ;;
  }

  dimension: invoice__month {
    type: string
    sql: ${TABLE}.invoice.month ;;
    label: "Invoice Month"
  }

  dimension: labels_array {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  # dimension: location__country {
  #   type: string
  #   sql: ${TABLE}.location.country ;;
  #   group_label: "Location"
  #   group_item_label: "Country"
  # }

  # dimension: location__location {
  #   type: string
  #   sql: ${TABLE}.location.location ;;
  #   group_label: "Location"
  #   group_item_label: "Location"
  # }

  # dimension: location__region {
  #   type: string
  #   sql: ${TABLE}.location.region ;;
  #   group_label: "Location"
  #   group_item_label: "Region"
  # }

  # dimension: location__zone {
  #   type: string
  #   sql: ${TABLE}.location.zone ;;
  #   group_label: "Location"
  #   group_item_label: "Zone"
  # }

  # dimension: project__ancestry_names {
  #   type: string
  #   sql: ${TABLE}.project.ancestry_names ;;
  #   group_label: "Project"
  #   group_item_label: "Ancestry Names"
  # }

  dimension: project__id {
    type: string
    sql: ${TABLE}.project.id ;;
    group_label: "Project"
    group_item_label: "ID"
  }

  dimension: project__labels {
    hidden: yes
    sql: ${TABLE}.project.labels ;;
    group_label: "Project"
    group_item_label: "Labels"
  }

  dimension: project__name {
    type: string
    sql: ${TABLE}.project.name ;;
    group_label: "Project"
    group_item_label: "Name"
  }

  # dimension: project__number {
  #   type: string
  #   sql: ${TABLE}.project.number ;;
  #   group_label: "Project"
  #   group_item_label: "Number"
  # }

  # dimension: service_description {
  #   type: string
  #   sql: ${TABLE}.service_description ;;
  # }

  # dimension: service_id {
  #   type: string
  #   sql: ${TABLE}.service_id ;;
  # }

  dimension: sku_description {
    type: string
    sql: ${TABLE}.sku_description ;;
  }

  dimension: sku_id {
    type: string
    sql: ${TABLE}.sku_id ;;
  }

  dimension: usage__amount {
    type: number
    sql: ${TABLE}.usage.amount ;;
    group_label: "Usage"
    group_item_label: "Amount"
  }

  dimension: usage__amount_in_pricing_units {
    type: number
    sql: ${TABLE}.usage.amount_in_pricing_units ;;
    group_label: "Usage"
    group_item_label: "Amount In Pricing Units"
  }

  dimension: usage__pricing_unit {
    type: string
    sql: ${TABLE}.usage.pricing_unit ;;
    group_label: "Usage"
    group_item_label: "Pricing Unit"
  }

  dimension: usage__unit {
    type: string
    sql: ${TABLE}.usage.unit ;;
    group_label: "Usage"
    group_item_label: "Unit"
  }

  # dimension_group: usage {
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
  #   datatype: datetime
  #   sql: ${TABLE}.usage_date_time ;;
  # }

  # dimension_group: usage_end {
  #   hidden: yes
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
  #   sql: ${TABLE}.usage_end_time ;;
  # }

  # dimension_group: usage_start {
  #   hidden: yes
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
  #   sql: ${TABLE}.usage_start_time ;;
  # }


}

# view: billing_export__labels {
#   dimension: billing_export__labels {
#     type: string
#     hidden: yes
#     sql: billing_export__labels ;;
#   }

#   dimension: key {
#     type: string
#     sql: key ;;
#     group_label: "Labels"
#   }

#   dimension: value {
#     type: string
#     sql: value ;;
#     group_label: "Labels"
#   }
# }

view: billing_export__project__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
    group_label: "Project"
    group_item_label: "Project Labels Key"
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
    group_label: "Project"
    group_item_label: "Project Labels Value"
  }


}
