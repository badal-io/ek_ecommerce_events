# Example 13
2 tiles/2 filters

Dashboard info:
* name: Movie/TV Show report
* Filters: 
    * Filter 1
        * name: Movie. Title
        * field: Title
        * view: moview extended
        * Filter type (control): Button Group
    * Filter 2
        * name: TV Show. Title
        * field: Title
        * view: tv shows extended
        * Filter type (control): Button Group
* Tiles:
    * Tile 1
        * name: Number of Movies by Title
        * type: Bar
    * Tile 2
        * name: Total
        * type: Multiple Value

Note: any fields that are used in LookML dashboards have a format of `view_name.field_name`. 
In the example below the explore that is used for the dashboard is `netflix_extended_explore` but all the fields and filters are either `movies_extended.field_name` or `tv_shows_extended.field_name` which are two views that make this explore. 
```
- dashboard: movietv_show_report
  title: Movie/TV Show report
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: iWxB2k5ABVVvQ0BKJ4TEZw
  elements:
  - title: Number of Movies by Title
    name: Number of Movies by Title
    model: bi_sandbox
    explore: netflix_extended_explore
    type: looker_bar
    fields: [movies_extended.content_count, tv_shows_extended.title]
    sorts: [movies_extended.content_count desc 0]
    limit: 15
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Movie. Title: movies_extended.title
      TV Show. Title: tv_shows_extended.title
    row: 0
    col: 0
    width: 16
    height: 11
  - title: Total
    name: Total
    model: bi_sandbox
    explore: netflix_extended_explore
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [movies_extended.content_count, tv_shows_extended.content_count]
    sorts: [movies_extended.content_count desc 0]
    limit: 15
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    font_size_main: ''
    orientation: auto
    listen:
      Movie. Title: movies_extended.title
      TV Show. Title: tv_shows_extended.title
    row: 0
    col: 16
    width: 8
    height: 11
  filters:
  - name: Movie. Title
    title: Movie. Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: bi_sandbox
    explore: netflix_extended_explore
    listens_to_filters: []
    field: movies_extended.title
  - name: TV Show. Title
    title: TV Show. Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: bi_sandbox
    explore: netflix_extended_explore
    listens_to_filters: []
    field: tv_shows_extended.title
```