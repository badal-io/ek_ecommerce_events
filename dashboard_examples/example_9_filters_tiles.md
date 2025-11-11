# Example 9
3 tiles/3 filters

Dashboard info:
* name: Test_Dashboard
* Filters: 
    * Filter 1
        * name: Type Filter
        * field: Type
        * Filter type (control): Button Group
    * Filter 2
        * name: Country
        * field: Country
        * Filter type (control): Tag list
    * Filter 3
        * name: Date
        * field: Date Added Date
        * Filter type (control): Timeframes
        * Configure Default Value: Previous Year
* Tiles:
    * Tile 1
        * name: Pie chart
        * type: Pie
    * Tile 2
        * name: Total count
        * type: Single Value
    * Tile 3
        * name: Table report
        * type: Table (Report)

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
    listen:
      Type Filter: v_netflix_titles_enriched.type
      Country: v_netflix_titles_enriched.country
      Date: v_netflix_titles_enriched.date_added_date
    row: 0
    col: 0
    width: 8
    height: 8
  - title: Total count
    name: Total count
    model: bi_sandbox
    explore: v_netflix_titles_enriched
    type: single_value
    fields: [v_netflix_titles_enriched.count]
    limit: 25
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
    listen:
      Type Filter: v_netflix_titles_enriched.type
      Country: v_netflix_titles_enriched.country
      Date: v_netflix_titles_enriched.date_added_date
    row: 0
    col: 8
    width: 6
    height: 5
  - title: Table report
    name: Table report
    model: bi_sandbox
    explore: v_netflix_titles_enriched
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [v_netflix_titles_enriched.count, v_netflix_titles_enriched.type, v_netflix_titles_enriched.country,
      v_netflix_titles_enriched.avg_tv_seasons]
    sorts: [v_netflix_titles_enriched.count desc 0]
    limit: 25
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    customTheme: ''
    layout: fixed
    minWidthForIndexColumns: true
    headerFontSize: 12
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: false
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: pivots
    useViewName: false
    useHeadings: false
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    subtotalDepth: '1'
    label|v_netflix_titles_enriched.count: Count
    heading|v_netflix_titles_enriched.count: ''
    style|v_netflix_titles_enriched.count: normal
    reportIn|v_netflix_titles_enriched.count: '1'
    unit|v_netflix_titles_enriched.count: ''
    comparison|v_netflix_titles_enriched.count: no_variance
    switch|v_netflix_titles_enriched.count: false
    var_num|v_netflix_titles_enriched.count: true
    var_pct|v_netflix_titles_enriched.count: false
    value_labels: labels
    label_type: labPer
    series_colors:
      v_netflix_titles_enriched.count: "#2B99F7"
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
    defaults_version: 0
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
    listen:
      Type Filter: v_netflix_titles_enriched.type
      Country: v_netflix_titles_enriched.country
      Date: v_netflix_titles_enriched.date_added_date
    row: 0
    col: 14
    width: 10
    height: 8
  filters:
  - name: Type Filter
    title: Type Filter
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: bi_sandbox
    explore: v_netflix_titles_enriched
    listens_to_filters: []
    field: v_netflix_titles_enriched.type
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: bi_sandbox
    explore: v_netflix_titles_enriched
    listens_to_filters: []
    field: v_netflix_titles_enriched.country
  - name: Date
    title: Date
    type: field_filter
    default_value: last year
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: bi_sandbox
    explore: v_netflix_titles_enriched
    listens_to_filters: []
    field: v_netflix_titles_enriched.date_added_date
```