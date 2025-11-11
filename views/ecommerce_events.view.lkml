view: ecommerce_events {
  sql_table_name: `@{ecommerce_events_table}` ;;

  # Primary Key (hidden)
  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Standard Dimensions
  dimension: user_id {
    label: "User ID"
    description: "Unique identifier for the user"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: sequence_number {
    label: "Sequence Number"
    description: "Sequential order of events within a session"
    type: number
    sql: ${TABLE}.sequence_number ;;
  }

  dimension: session_id {
    label: "Session ID"
    description: "Unique identifier for the user session"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: ip_address {
    label: "IP Address"
    description: "IP address of the user"
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: browser {
    label: "Browser"
    description: "Browser type used for the event"
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: traffic_source {
    label: "Traffic Source"
    description: "Source of traffic (e.g., Facebook, Adwords, Email)"
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: uri {
    label: "URI"
    description: "URI of the page where the event occurred"
    type: string
    sql: ${TABLE}.uri ;;
  }

  dimension: event_type {
    label: "Event Type"
    description: "Type of event (e.g., purchase, cart, product)"
    type: string
    sql: ${TABLE}.event_type ;;
  }

  # Geographic Dimensions
  dimension: city {
    label: "City"
    description: "City of the user"
    group_label: "Location"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    label: "State"
    description: "State or region of the user"
    group_label: "Location"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: postal_code {
    label: "Postal Code"
    description: "Postal code of the user"
    group_label: "Location"
    type: zipcode
    sql: ${TABLE}.postal_code ;;
  }

  # Time Dimensions
  dimension_group: created {
    type: time
    label: "Created"
    description: "Timestamp when the event was created"
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_month_year {
    group_label: "Created Date"
    label: "Month + Year"
    type: string
    sql: DATE_TRUNC(${created_date}, MONTH) ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  dimension_group: dbt_load_timestamp {
    type: time
    label: "DBT Load Timestamp"
    description: "Timestamp when the record was loaded by dbt"
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.dbt_load_timestamp ;;
  }

  # Hidden Dimensions for Measures
  dimension: count_records {
    hidden: yes
    type: number
    sql: 1 ;;
  }

  dimension: is_unique_city {
    hidden: yes
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: is_unique_user {
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: is_unique_event_type {
    hidden: yes
    type: string
    sql: ${TABLE}.event_type ;;
  }

  # Measures
  measure: record_count {
    label: "Number of Records"
    description: "Total count of all events"
    type: count_distinct
    sql: ${id} ;;
    value_format: "#,##0.00"
  }

  measure: count_cities {
    label: "Number of Cities"
    description: "Count of distinct cities"
    type: count_distinct
    sql: ${is_unique_city} ;;
    value_format: "#,##0.00"
  }

  measure: count_users {
    label: "Number of Users"
    description: "Count of distinct users"
    type: count_distinct
    sql: ${is_unique_user} ;;
    value_format: "#,##0.00"
  }

  measure: count_event_types {
    label: "Number of Event Types"
    description: "Count of distinct event types"
    type: count_distinct
    sql: ${is_unique_event_type} ;;
    value_format: "#,##0.00"
  }
}
