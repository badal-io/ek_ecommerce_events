# Best practices

## Naming convention for LookML elements

* Spaces and special characters: Filenames cannot include spaces or any of the following characters: / ? * : | " < > %
* File extensions: When creating LookML files with the Looker IDE, Looker will automatically add the .lkml extension to the end of the filename if you don't include the extension manually. For example, if you enter the filename flights_data_tests, Looker will name the file flights_data_tests.lkml

## File types:

* Model files with the file extension .model.lkml
* View files with the file extension .view.lkml
* Project manifest files that are always named manifest.lkml
* Dashboard files with the file extension .dashboard.lookml
* Document files with the file extension .md
* Locale strings files with the file extension .strings.json
* Generic LookML files, which are used for the following types of files:
   * Explore files with the file extension .explore.lkml
   * Data test files with the file extension .lkml
   * Refinements files with the file extension .lkml
   * Any other files you're using to house LookML elements

## Don't do this with LookML
* Don't: Use the from parameter for renaming views within an Explore.
Use the view_label parameter instead. For more on the difference between from and view_label, check out the from (for Explores) parameter documentation page. The from parameter should primarily be used in the following situations:
   * Polymorphic joins (joining the same table multiple times)
   * Self-joins (joining a table to itself)
   * Re-scoping an extended view back to its original view name

* Don't: Use the word "date" or "time" in a dimension group name.
Looker appends each timeframe to the end of the dimension group name, which means that a dimension group that is named created_date results in fields called, for example, created_date_date and created_date_month. Simply use created as the dimension group name, because this results in fields that are named, for example, created_date and created_month.

* Don't: Use formatted timestamps within joins.
Instead, use the raw timeframe option for joining on any date or time fields. This will avoid the inclusion of casting and timezone conversion in join predicates.