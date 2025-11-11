# Task

Generate LookML caching elements for a looker project 'ek_ecommerce_events' that uses 'ek_ecommerce_events' model file.

# Database/Connection

This Looker project is connected to a database in BigQuery

# Model file
The model file is already created with the connection defined.

* inlude data_tests folder

# Data tests


* Create folders:
   * data_tests (for data tests)

## Data tests:

* Data test 1:
  * name: user_id_not_null
  * explore: ecommerce_events_explore
  * description: generate it
  * logic: checks that user_id is not null

* Data test 2:
  * name: sequence_number_check
  * explore: ecommerce_events_explore
  * description: generate it
  * logic: checks that sequence_number is always less than 25

## Data tests
You can create data tests in model files, view files, or in separate, dedicated data test files. When using a dedicated file to house your data tests, remember to include the data test file in any model file or view file where you want to run your data tests.


A data test cannot have the same name and explore_source as another data test in the same project. If you are using the same explore_source for multiple data tests in your project, be sure that the names of the data tests are all unique.


The test parameter has the following subparameters:
* explore_source: Defines the query to use in the data test.
* assert: Defines a Looker expression that is run on every row of the test query to verify the data. For use in data tests, fields in the Looker expression must be fully scoped, meaning they are specified using the view_name.field_name format


Example:
```
# This next data test checks to make sure that the 2017 revenue value is always $626,000. In this dataset, that is a known value that should never change.


test: historic_revenue_is_accurate {
 explore_source:  orders {
   column:  total_revenue {
     field:  orders.total_revenue
   }
   filters: [orders.created_date:  "2017"]
 }
 assert:  revenue_is_expected_value {
   expression: ${orders.total_revenue} = 626000 ;;
 }
}


This next data test checks to make sure that there are no null values in the data. This explore_source uses a sort to be sure that any nulls will be returned at the top of query. Sorting for nulls can vary, based on your dialect. The following test uses desc: yes as an example.
test: status_is_not_null {
 explore_source: orders {
   column: status {}
   sorts: [orders.status: desc]
   limit: 1
 }
 assert: status_is_not_null {
   expression: NOT is_null(${orders.status}) ;;
 }
}
```


# Rules/Best Practices

Please check Best Practices in the "best_practices.md" file that is located in the same folder