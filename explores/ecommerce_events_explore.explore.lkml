include: "/views/*.view.lkml"

explore: ecommerce_events_explore {
  label: "Ecommerce Events"
  description: "Explore ecommerce events data including user behavior, traffic sources, and purchase patterns"
  view_name: ecommerce_events
  persist_with: datagroup_ecommerce
}
