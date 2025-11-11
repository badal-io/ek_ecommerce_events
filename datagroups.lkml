datagroup: datagroup_ecommerce {
  label: "Ecommerce Events Datagroup"
  description: "Datagroup that triggers when the number of records in the ecommerce_events table changes. Cache is stored for 24 hours."
  sql_trigger: SELECT COUNT(*) FROM `@{ecommerce_events_table}` ;;
  max_cache_age: "24 hours"
}
