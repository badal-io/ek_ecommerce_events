# Example 7
one tile/no filters

Dashboard info:
* name: Test_Dashboard
* Filters: no
* Tiles:
    * Tile 1
        * name: Pie chart
        * type: Pie

Note: any fields that are used in LookML dashboards have a format of `view_name.field_name`. Sometime `explore_name` and `view_name` can be the same like in the example below. 
```
- dashboard: test_dashboard
  title: Test_Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: oRNjwHYklLaKEpJAOCpKMs
  elements:
  - title: Pie chart
    name: Pie chart
    model: bi_sandbox
    explore: v_netflix_titles_enriched
    type: looker_pie
    fields: [v_netflix_titles_enriched.count, v_netflix_titles_enriched.director]
    sorts: [v_netflix_titles_enriched.count desc]
    limit: 25
    column_limit: 50
    value_labels: labels
    label_type: labPer
    series_colors:
      v_netflix_titles_enriched.count: "#2B99F7"
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 9
```