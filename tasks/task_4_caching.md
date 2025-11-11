# Task

Generate LookML caching elements for a looker project 'ek_ecommerce_events' that uses 'ek_ecommerce_events' model file.

# Database/Connection

This Looker project is connected to a database in BigQuery

# Model file
The model file is already created with the connection defined.

# Datagroup
1. Create a datagroup in a separate file
2. add it to explore files
3. assigne it to all explores

datagroup:
   * name: datagroup_ecommerce
   * description: generate something
   * logic: datagroups triggers when the number of records in the table changes
   * cache: store it for 24 hours

## Defining a datagroup

Define a datagroup with the datagroup parameter, either in a model file or in its own LookML file. You can define multiple datagroups if you want different caching and persistent derived table (PDT) rebuild policies for different Explores or PDTs in your project. Datagroup can't be defined in manifest file.


The datagroup parameter can have the following subparameters:


* **label** — Specifies an optional label for the datagroup.
* **description** — Specifies an optional description for the datagroup that can be used to explain the datagroup's purpose and mechanism.
* **max_cache_age** — Specifies a string that defines a time period. When the age of a query's cache exceeds the time period, Looker invalidates the cache. The next time the query is issued, Looker sends the query to the database for fresh results.
The max_cache_age parameter specifies a string containing an integer followed by "seconds", "minutes", or "hours". This time period is the maximum time period for the cached results to be used by Explore queries that use the datagroup
* **sql_trigger** — Specifies a SQL query that returns one row with one column. If the value that is returned by the query is different from the query's prior results, then the datagroup goes into a triggered state.
* **interval_trigger** — Specifies a time schedule for triggering the datagroup, such as "24 hours".


At a minimum, a datagroup must have at least the max_cache_age parameter, the sql_trigger parameter, or the interval_trigger parameter.


A datagroup cannot have both sql_trigger and interval_trigger parameters. If you define a datagroup with both parameters, the datagroup will use the interval_trigger value and ignore the sql_trigger value, since the sql_trigger parameter requires Looker to use database resources when querying the database.

### Examples

#### Creating a caching policy to retrieve new results whenever there's new data available or at least every 24 hours

To create a caching policy that retrieves new results whenever there's new data available or at least every 24 hours, do the following:

Use the orders_datagroup datagroup (in the model file) to name the caching policy.
Use the sql_trigger parameter to specify the query that indicates that there is fresh data: select max(id) from my_tablename. Whenever the data has been updated, this query returns a new number.
Use the max_cache_age setting to invalidate the data if it has been cached for 24 hours.
Use the optional label and description parameters to add a customized label and a description of the datagroup.

```
datagroup: orders_datagroup {
  sql_trigger: SELECT max(id) FROM my_tablename ;;
  max_cache_age: "24 hours"
  label: "ETL ID added"
  description: "Triggered when new ID is added to ETL log"
}
```

To use the orders_datagroup caching policy as the default for Explores in a model, use the persist_with parameter at the model level, and specify the orders_datagroup:
`persist_with: orders_datagroup`

To use the orders_datagroup caching policy for a specific Explore, add the persist_with parameter under the explore parameter, and specify the orders_datagroup. If there is a default datagroup specified at the model level, you can use the persist_with parameter under an explore to override the default setting.

```
explore: customer_facts {
  persist_with: orders_datagroup
  ...
}
```

#### Creating a datagroup to schedule deliveries on the last day of every month

You may want to create a schedule that sends a content delivery at the end of every month. However, not all months have the same number of days. You can create a datagroup to trigger content deliveries at the end of every month — regardless of the number of days in a specific month.

Create a datagroup using a SQL statement to trigger at the end of each month:
```
datagroup: month_end_datagroup {
sql_trigger: SELECT (EXTRACT(MONTH FROM DATEADD( day, 1, GETDATE()))) ;;
description: "Triggered on the last day of each month"
}
```
(This example is in Redshift SQL and may require slight adaptations for different databases.)

#### Sharing datagroups across model files

This example shows how to share datagroups with multiple model files. This approach is advantageous in that, should you need to edit a datagroup, you need to edit the datagroup in only one place to have those changes take affect across all your models.

To share datagroups with multiple model files, first create a separate file that contains only the datagroups, and then use the include parameter to include the datagroups file in your model files.


Creating a datagroups file
Create a separate .lkml file to contain your datagroups. You can create a .lkml datagroup file in the same way you can create a separate .lkml Explore file.

In this example, the datagroups file is named datagroups.lkml:
```
datagroup: daily {
 max_cache_age: "24 hours"
 sql_trigger: SELECT CURRENT_DATE();;
}
```

Including the datagroups file in your model files
Now that you've created the datagroups file, you can include it in both of your models and use persist_with, either to apply the datagroup to individual Explores in your models or to apply the datagroup to all Explores in a model.

For example, the following two model files both include the datagroups.lkml file.

This file is named ecommerce.model.lkml. The daily datagroup is used at the explore level so that it applies just to the orders Explore:

```
include: "datagroups.lkml"

connection: "database1"

explore: orders {
  persist_with: daily
}
```

This next file is named inventory.model.lkml. The daily datagroup is used at the model level so that it applies to all of the Explores in the model file:

```
include: "datagroups.lkml"
connection: "database2"
persist_with: daily

explore: items {
}

explore: products {
}
```

# Rules/Best Practices

Please check Best Practices in the "best_practices.md" file that is located in the same folder