view: billing_export {
  sql_table_name: `chris-playground-297209.looker_lens.billing_export_v1_01A29B_B56F30_AA75{% parameter location %}`
    ;;

  parameter: location {
    default_value: "97"
    type: unquoted
  }

  dimension: history_id {
    type: string
    sql:  (SELECT CAST(value AS INT64) FROM UNNEST(${labels}) as label WHERE label.key = "looker-context-history_id" LIMIT 1);;
    hidden: yes
  }

  dimension: adjustment_info__description {
    type: string
    sql: ${TABLE}.adjustment_info.description ;;
    group_label: "Adjustment Info"
    group_item_label: "Description"
  }

  dimension: adjustment_info__id {
    type: string
    sql: ${TABLE}.adjustment_info.id ;;
    group_label: "Adjustment Info"
    group_item_label: "ID"
  }

  dimension: adjustment_info__mode {
    type: string
    sql: ${TABLE}.adjustment_info.mode ;;
    group_label: "Adjustment Info"
    group_item_label: "Mode"
  }

  dimension: adjustment_info__type {
    type: string
    sql: ${TABLE}.adjustment_info.type ;;
    group_label: "Adjustment Info"
    group_item_label: "Type"
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: credits {
    hidden: yes
    sql: ${TABLE}.credits ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_conversion_rate {
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
  }

  dimension: discount__allow_preemptible {
    type: yesno
    sql: ${TABLE}.discount.allow_preemptible ;;
    group_label: "Discount"
    group_item_label: "Allow Preemptible"
  }

  dimension: discount__is_commitment {
    type: string
    sql: ${TABLE}.discount.is_commitment ;;
    group_label: "Discount"
    group_item_label: "Is Commitment"
  }

  dimension: discount__rebase_modifier {
    type: number
    sql: ${TABLE}.discount.rebase_modifier ;;
    group_label: "Discount"
    group_item_label: "Rebase Modifier"
  }

  dimension: discount__value {
    type: number
    sql: ${TABLE}.discount.value ;;
    group_label: "Discount"
    group_item_label: "Value"
  }

  dimension: exclude_discount {
    type: yesno
    sql: ${TABLE}.exclude_discount ;;
  }

  dimension_group: export {
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
    sql: ${TABLE}.export_time ;;
  }

  dimension: gcp_metrics {
    hidden: yes
    sql: ${TABLE}.gcp_metrics ;;
  }

  dimension: invoice__month {
    type: string
    sql: ${TABLE}.invoice.month ;;
    group_label: "Invoice"
    group_item_label: "Month"
  }

  dimension: is_marketplace {
    type: yesno
    sql: ${TABLE}.is_marketplace ;;
  }

  dimension: is_preemptible {
    type: yesno
    sql: ${TABLE}.is_preemptible ;;
  }

  dimension: is_premium_image {
    type: yesno
    sql: ${TABLE}.is_premium_image ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: location__country {
    type: string
    sql: ${TABLE}.location.country ;;
    group_label: "Location"
    group_item_label: "Country"
  }

  dimension: location__location {
    type: string
    sql: ${TABLE}.location.location ;;
    group_label: "Location"
    group_item_label: "Location"
  }

  dimension: location__region {
    type: string
    sql: ${TABLE}.location.region ;;
    group_label: "Location"
    group_item_label: "Region"
  }

  dimension: location__zone {
    type: string
    sql: ${TABLE}.location.zone ;;
    group_label: "Location"
    group_item_label: "Zone"
  }

  dimension: price_book__discount {
    type: number
    sql: ${TABLE}.price_book.discount ;;
    group_label: "Price Book"
    group_item_label: "Discount"
  }

  dimension: price_book__unit_price {
    type: number
    sql: ${TABLE}.price_book.unit_price ;;
    group_label: "Price Book"
    group_item_label: "Unit Price"
  }

  dimension: project__ancestry_names {
    type: string
    sql: ${TABLE}.project.ancestry_names ;;
    group_label: "Project"
    group_item_label: "Ancestry Names"
  }

  dimension: project__ancestry_numbers {
    type: string
    sql: ${TABLE}.project.ancestry_numbers ;;
    group_label: "Project"
    group_item_label: "Ancestry Numbers"
  }

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

  dimension: project__number {
    type: string
    sql: ${TABLE}.project.number ;;
    group_label: "Project"
    group_item_label: "Number"
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: report {
    hidden: yes
    sql: ${TABLE}.report ;;
  }

  dimension: service_description {
    type: string
    sql: ${TABLE}.service_description ;;
  }

  dimension: service_id {
    type: string
    sql: ${TABLE}.service_id ;;
  }

  dimension: sku_description {
    type: string
    sql: ${TABLE}.sku_description ;;
  }

  dimension: sku_id {
    type: string
    sql: ${TABLE}.sku_id ;;
  }

  dimension: system_labels {
    hidden: yes
    sql: ${TABLE}.system_labels ;;
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

  dimension_group: usage_date {
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
    datatype: datetime
    sql: ${TABLE}.usage_date_time ;;
  }

  dimension_group: usage_end {
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
    sql: ${TABLE}.usage_end_time ;;
  }

  dimension_group: usage_start {
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
    sql: ${TABLE}.usage_start_time ;;
  }

  measure: count {
    type: count
    drill_fields: [project__name]
  }

  measure: usage__amount_total {
    type:  sum
    sql: ${usage__amount} ;;
    group_label: "Usage"
    group_item_label: "Total Amount"
  }
}

view: billing_export__labels {
  dimension: billing_export__labels {
    type: string
    hidden: yes
    sql: billing_export__labels ;;
  }

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

view: billing_export__report {
  dimension: billing_export__report {
    type: string
    hidden: yes
    sql: billing_export__report ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  dimension: credit {
    type: string
    sql: credit ;;
  }

  dimension: savings {
    type: number
    sql: savings ;;
  }

  dimension: usage {
    type: number
    sql: usage ;;
  }
}

view: billing_export__credits {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: id ;;
  }

  dimension: amount {
    type: number
    sql: amount ;;
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

  dimension: billing_export__credits {
    type: string
    hidden: yes
    sql: billing_export__credits ;;
  }

  dimension: full_name {
    type: string
    sql: full_name ;;
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: type {
    type: string
    sql: type ;;
  }
}

view: billing_export__gcp_metrics {

  dimension: billing_export__gcp_metrics {
    type: string
    hidden: yes
    sql: billing_export__gcp_metrics ;;
  }

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: type {
    type: string
    sql: type ;;
  }

  dimension: value {
    type: number
    sql: value ;;
  }

  measure: total_value {
    type: sum
    sql: ${value} ;;
  }

  measure: average_value {
    type: average
    sql: ${value} ;;
  }
}

view: billing_export__system_labels {

  dimension: billing_export__system_labels {
    type: string
    hidden: yes
    sql: billing_export__system_labels ;;
  }

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

view: billing_export__project__labels {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
