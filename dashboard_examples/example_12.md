# Example 12
3 tiles/1 filters

Dashboard info:
* name: Test_Dashboard
* Filters: 
    * Filter 1
        * name: Type Filter
        * field: Type
        * Filter type (control): Button Group
* Tiles:
    * Tile 1
        * name: Country Map
        * type: Google Maps
    * Tile 2
        * name: Line
        * type: Count by date
    * Tile 3
        * name: 
        * type: Markdown
        * description: using HTML contains a link to Test_Dashboard

Note: any fields that are used in LookML dashboards have a format of `view_name.field_name`. Sometime `explore_name` and `view_name` can be the same like in the example below. 
```
- dashboard: test_dashboard_2
  title: Test_Dashboard 2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Pth0f2QsnyYfthPyKZjrWX
  elements:
  - title: Country Map
    name: Country Map
    model: bi_sandbox
    explore: v_netflix_titles_enriched
    type: looker_google_map
    fields: [v_netflix_titles_enriched.country, v_netflix_titles_enriched.count]
    sorts: [v_netflix_titles_enriched.count desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    listen:
      Type: v_netflix_titles_enriched.type
    row: 3
    col: 0
    width: 13
    height: 11
  - title: Count by date
    name: Count by date
    model: bi_sandbox
    explore: v_netflix_titles_enriched
    type: looker_line
    fields: [v_netflix_titles_enriched.date_added_date, v_netflix_titles_enriched.count]
    filters:
      v_netflix_titles_enriched.count: NOT NULL
    sorts: [v_netflix_titles_enriched.date_added_date desc]
    limit: 500
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    bin_type: bins
    bin_style: simple_hist
    winsorization: false
    color_col: "#1A73E8"
    color_on_hover: "#338bff"
    x_axis_override: ''
    x_grids: true
    x_axis_title_font_size: 16
    x_axis_label_font_size: 12
    x_axis_label_angle: 0
    x_label_separation: 100
    y_axis_override: ''
    y_grids: true
    y_axis_title_font_size: 16
    y_axis_label_font_size: 12
    y_axis_label_angle: 0
    y_label_separation: 100
    x_axis_value_format: ''
    up_color: false
    down_color: false
    total_color: false
    groupBars: true
    labelSize: 10pt
    showLegend: true
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    range_max:
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#0092E5"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    showComparison: false
    minValue: 0
    maxValue: 100
    circleThickness: 0.05
    circleFillGap: 0.05
    circleColor: "#178BCA"
    waveHeight: 0.05
    waveCount: 1
    waveRiseTime: 1000
    waveAnimateTime: 1800
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#64518A"
    waveOffset: 0
    textVertPosition: 0.5
    textSize: 1
    valueCountUp: true
    displayPercent: true
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    bar_arm_length: 9
    bar_arm_weight: 48
    bar_spinner_length: 121
    bar_spinner_weight: 25
    bar_style: vertical
    bar_range_min: 0
    bar_range_max: 100.701
    bar_value_label_type: both
    bar_value_label_font: 8
    bar_value_label_padding: 45
    bar_target_source: 'off'
    bar_target_label_type: none
    bar_target_label_font: 3
    bar_label_font_size: 3
    bar_fill_color: "#0092E5"
    bar_background_color: "#CECECE"
    bar_spinner_color: "#282828"
    bar_range_color: "#282828"
    listen:
      Type: v_netflix_titles_enriched.type
    row: 0
    col: 13
    width: 11
    height: 14
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-bottom: solid 1px #000;">

      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">

      <a style="padding: 5px 15px; border-bottom: solid 1px #000; float: left; line-height: 40px; color: #000" href="/dashboards/375" > Go to Test_Dashboard
       </a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 13
    height: 3
  filters:
  - name: Type
    title: Type
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
```