# Task

Generate LookML dashboards for a looker project 'ek_ecommerce_events' that uses 'ek_ecommerce_events' model file.

Do a comprehensive research on building LookML dashboards taking into account this document and the information that you can find yourself.

# Database/Connection

This Looker project is connected to a database in BigQuery 

# Model file
The model file is already created with the connection defined.

* Add 'include` lines to include elements from LookML_Dashboards folder.

A common practice is to include all LookML dashboards in a model by using a wildcard:
`include: "*.dashboard.lookml"`

or, if your LookML dashboards appear within a folder in the IDE, use the path to their location
`include: "/path/*.dashboard.lookml"`


# Project structure

* Create folders:
   * LookML_Dashboards (for LookML dashboards)

# Reporting

## Dashboard 1

* Name: ECommerce Evenets. Summary Dashboard

I have it built in a different BI tool (Looker Studio) and have its screenshot saved in /data_viz_examples/, the file is named `report_example.png` please build as close as possible in Looker as in this example.


...

## How to build LookML Dashboards

### Parameter definitions

*dashboard*	Create a dashboard.
*preferred_viewer*	This parameter is ignored.
*title* (for dashboard)	Change the way a dashboard name appears to users.
*description* (for dashboard)	Add a description that can be viewed in the Dashboard Details panel or in a folder set to list view.
*enable_viz_full_screen*	Define whether dashboard viewers can see dashboard tiles in full-screen and expanded views.
*extends*	Base the LookML dashboard on another LookML dashboard.
*extension*	Require that the dashboard is extended by another dashboard.
*layout*	Define the way that the dashboard will place elements.
*rows*	Start a section of LookML to define the elements that should go into each row of a layout: grid dashboard.
*elements* (for rows)	Define the elements that should go into a row of a layout: grid dashboard.
*height* (for rows)	Define the height of a row for a layout: grid dashboard.
*tile_size*	Define the size of a tile for a layout: tile dashboard.
*width* (for dashboard)	Define the width of the dashboard for a layout: static dashboard.
*refresh* (for dashboard)	Set the interval on which dashboard elements will automatically refresh.
*auto_run*	Determine whether dashboards run automatically when initially opened or reloaded.

Filter Parameters
*crossfilter_enabled*	Enable or disable cross-filtering for a dashboard.
*filters_bar_collapsed*	Added 21.16 Set the dashboard filter bar as default collapsed or expanded for a dashboard.
*filters_location_top*	Added 22.8 Set the dashboard filter bar location as top or right for a dashboard.
*filters* (for dashboard)	Start a section of LookML to define dashboard filters.
*name* (for filters)	Create a filter.
*title* (for filters)	Change the way a filter name appears to users.
*type* (for filters)	Determine the type of filter to be used.
*default_value*	Set a default value for a filter.
*allow_multiple_values*	Limit users to a single filter value.
*required*	Require that users enter a filter value to run the dashboard.
*ui_config*	Configure the filter controls that are available when users view a LookML dashboard. Has subparameters type, display, and options.
*model* (for filters)	Specify the model that contains the underlying field of a type: field_filter filter.
*explore* (for filters)	Specify the Explore that contains the underlying field of a type: field_filter filter.
*field*	Specify the underlying field of a type: field_filter filter.
*listens_to_filters*	Narrow suggestions for dashboard filters of field_filter based on what the user enters for another dashboard filters of type: field_filter.

Embedded Dashboard Parameters
*embed_style*	Start a section of LookML to define embedded dashboard customizations.
*background_color*	Set a background color of an embedded dashboard.
*show_title*	Specify whether the dashboard title is visible on an embedded dashboard.
*title_color*	Set the color of the title of an embedded dashboard.
*show_filters_bar*	Specify whether the filters bar is visible on an embedded dashboard.
*tile_background_color*	Set the tile background color of an embedded dashboard.
*tile_text_color*	Set the tile text color of an embedded dashboard.

## LookML Dashboard examples

There are 10 examples for LookML Dashboards provided in the folder `project_name/dashboard_examples/`. Please analyze them before building the reports. 
The examples show LookML code for different set ups:
* different tile types
* different filter types
* different combinations of tiles and filters

# Rules/Best Practices

Please check Best Practices in the "best_practices.md" file that is located in the same folder