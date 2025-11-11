# Example 1
one tile/no filters

Dashboard info:
* name: Test_Dashboard
* Filters: no
* Tiles:
    * Tile 1
        * name: Total Count
        * type: Single Value

Note: any fields that are used in LookML dashboards have a format of `view_name.field_name`. Sometime `explore_name` and `view_name` can be the same like in the example below. 
```
- dashboard: test_dashboard
  title: Test_Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: oRNjwHYklLaKEpJAOCpKMs
  elements:
  - title: Total count
    name: Total count
    model: bi_sandbox
    explore: v_netflix_titles_enriched
    type: single_value
    fields: [v_netflix_titles_enriched.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    value_labels: legend
    label_type: labPer
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 0
    width: 5
    height: 4
```