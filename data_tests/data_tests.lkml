# Data test 1: user_id_not_null
# Checks that user_id is not null in the ecommerce_events explore
test: user_id_not_null {
  explore_source: ecommerce_events_explore {
    column: user_id {
      field: ecommerce_events.user_id
    }
    sorts: [ecommerce_events.user_id: desc]
    limit: 1
  }
  assert: user_id_is_not_null {
    expression: NOT is_null(${ecommerce_events.user_id}) ;;
  }
}

# Data test 2: sequence_number_check
# Checks that sequence_number is always less than 25
test: sequence_number_check {
  explore_source: ecommerce_events_explore {
    column: sequence_number {
      field: ecommerce_events.sequence_number
    }
    filters: [ecommerce_events.sequence_number: ">=25"]
    limit: 1
  }
  assert: sequence_number_less_than_25 {
    expression: ${ecommerce_events.sequence_number} < 25 ;;
  }
}
