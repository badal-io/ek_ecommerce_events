# ECommerce Events Looker Project

**Documentation Generated**: November 11, 2025

## Overview

This Looker project provides comprehensive analytics and reporting capabilities for ecommerce events data. It is built on a semantic layer that transforms raw event data from BigQuery into meaningful business insights.

## Source Data

### Database Connection
- **Connection**: `badal_internal_projects`
- **Database**: BigQuery (GCP)
- **Dataset**: `prj-s-dlp-dq-sandbox-0b3c.badal_dq`

### Source Table
**Table**: `ecommerce_events`
- **Full Path**: `prj-s-dlp-dq-sandbox-0b3c.badal_dq.ecommerce_events`
- **Description**: Contains detailed event-level data for ecommerce user interactions

### Table Schema
The ecommerce_events table includes the following columns:

| Field | Type | Description |
|-------|------|-------------|
| id | INT64 | Unique event identifier (Primary Key) |
| user_id | INT64 | Unique user identifier |
| sequence_number | INT64 | Sequential order of events within a session |
| session_id | STRING | Unique session identifier |
| created_at | TIMESTAMP | Timestamp when the event was created |
| ip_address | STRING | IP address of the user |
| city | STRING | City of the user |
| state | STRING | State or region of the user |
| postal_code | STRING | Postal code of the user |
| browser | STRING | Browser type used for the event |
| traffic_source | STRING | Source of traffic (e.g., Facebook, Adwords, Email) |
| uri | STRING | URI of the page where the event occurred |
| event_type | STRING | Type of event (e.g., purchase, cart, product, home, department) |
| dbt_load_timestamp | TIMESTAMP | Timestamp when the record was loaded by dbt |

## Semantic Layer Structure

### Views
The project includes one main view that represents the ecommerce events data:

#### ecommerce_events
- **File**: `views/ecommerce_events.view.lkml`
- **Based on**: `prj-s-dlp-dq-sandbox-0b3c.badal_dq.ecommerce_events` table
- **Description**: Comprehensive view of ecommerce events with dimensions and measures for analysis

**Dimensions** (16 total):
- **Standard Dimensions**: id (primary key), user_id, sequence_number, session_id, ip_address, browser, traffic_source, uri, event_type
- **Geographic Dimensions**: city, state, postal_code (with zipcode type for map visualizations)
- **Time Dimensions**:
  - created (dimension group with timeframes: time, date, week, month, raw)
  - created_month_year (formatted date dimension)
  - dbt_load_timestamp (dimension group with timeframes: time, date, week, month, raw)

**Measures** (4 total):
- **record_count**: Total count of all events
- **count_cities**: Count of distinct cities
- **count_users**: Count of distinct users
- **count_event_types**: Count of distinct event types

### Explores
The project exposes ecommerce data through one primary explore:

#### ecommerce_events_explore
- **File**: `explores/ecommerce_events_explore.explore.lkml`
- **Base View**: ecommerce_events
- **Label**: "Ecommerce Events"
- **Description**: Explore ecommerce events data including user behavior, traffic sources, and purchase patterns
- **Caching**: Uses datagroup_ecommerce with 24-hour cache invalidation

## Reporting & Dashboards

### Dashboards
The project includes one comprehensive dashboard for ecommerce event analysis:

#### ECommerce Events Summary Dashboard
- **File**: `LookML_Dashboards/ecommerce_events_summary_dashboard.dashboard.lookml`
- **Name**: ecommerce_events_summary_dashboard
- **Description**: Comprehensive summary of ecommerce events including user activity, geographic distribution, and event type analysis

**Dashboard Tiles**:

1. **Key Performance Indicators (KPIs)**
   - Record Count: Total number of events
   - Number of Users: Distinct user count
   - Number of Cities: Distinct city count

2. **State by Event Type** (Column Chart)
   - Visualization: Column chart
   - Dimensions: Event Type
   - Measures: Record Count
   - Shows the distribution of events by event type

3. **Sequence Number over Time** (Line Chart)
   - Visualization: Line chart
   - Dimensions: Created Date
   - Measures: Sequence Number
   - Tracks user activity sequences over time

4. **Cities Distribution Map** (Geographic Visualization)
   - Visualization: Map (Points)
   - Dimension: Postal Code
   - Measure: Record Count
   - Shows geographic distribution of events by location

5. **Recent Records by Record Count** (Data Table)
   - Visualization: Grid/Table
   - Columns: Created Date, City, Event Type, Sequence Number
   - Displays: Last 25 records sorted by creation date
   - Allows detailed exploration of recent events

## Data Caching Strategy

### Datagroup Configuration
- **Name**: datagroup_ecommerce
- **File**: `datagroups.lkml`
- **Trigger**: SQL trigger that detects when record count changes in the ecommerce_events table
- **Cache Duration**: 24 hours (`max_cache_age: "24 hours"`)
- **Applied to**: All explores in the project

**Benefits**:
- Improves query performance by caching results
- Automatically invalidates cache when new data arrives
- Ensures fresh data within 24-hour window

## Data Quality Assurance

### Data Tests
The project includes automated data quality tests to ensure data integrity:

#### Test 1: user_id_not_null
- **File**: `data_tests/data_tests.lkml`
- **Purpose**: Verifies that user_id is never null in the dataset
- **Validation**: All records must have a valid user_id
- **Impact**: Ensures user attribution accuracy

#### Test 2: sequence_number_check
- **File**: `data_tests/data_tests.lkml`
- **Purpose**: Ensures sequence_number is always less than 25
- **Validation**: All sequence_number values must be < 25
- **Impact**: Validates event sequence integrity

## Project Configuration

### Model File
- **File**: `ek_ecommerce_events.model.lkml`
- **Connection**: `badal_internal_projects` (BigQuery)
- **Includes**:
  - Datagroups definition
  - Views from `/views/` folder
  - Explores from `/explores/` folder
  - Dashboards from `/LookML_Dashboards/` folder
  - Data tests from `/data_tests/` folder

### Manifest Configuration
- **File**: `manifest.lkml`
- **Purpose**: Defines project constants for reusable table references
- **Constants**:
  - `ecommerce_events_table`: Full path to the ecommerce_events table in BigQuery

## Project Folder Structure

```
ek_ecommerce_events/
├── ek_ecommerce_events.model.lkml       # Main model file
├── manifest.lkml                         # Project constants
├── datagroups.lkml                       # Caching configuration
├── README.md                             # This file
├── views/
│   └── ecommerce_events.view.lkml       # Main view definition
├── explores/
│   └── ecommerce_events_explore.explore.lkml  # Main explore definition
├── LookML_Dashboards/
│   └── ecommerce_events_summary_dashboard.dashboard.lookml  # Dashboard
├── data_tests/
│   └── data_tests.lkml                  # Data quality tests
└── tasks/
    ├── task_execution_tracker.md        # Task completion status
    ├── task_1_views.md                  # View requirements
    ├── task_2_explores.md               # Explore requirements
    ├── task_3_reporting.md              # Dashboard requirements
    ├── task_4_caching.md                # Caching requirements
    ├── task_5_datatests.md              # Data test requirements
    ├── task_6_documentation.md          # Documentation requirements
    └── best_practices.md                # LookML best practices guide
```

## Usage

### Accessing the Project
1. Connect to Looker using the `badal_internal_projects` connection
2. Navigate to the "Ecommerce Events" explore
3. Use available dimensions and measures to create custom analyses
4. Access the pre-built "ECommerce Events Summary Dashboard" for quick insights

### Building Custom Queries
All available fields are organized as:
- **Dimensions**: Break down data by specific attributes
- **Measures**: Aggregate data to calculate key metrics
- **Time Groupings**: Analyze trends over different time periods

### Geographic Analysis
The postal_code dimension is configured as a `zipcode` type, enabling automatic integration with Looker's map visualizations for geographic analysis.

## Best Practices

This project adheres to LookML best practices:
- **Naming Conventions**: Clear, descriptive names following Looker standards
- **Field Documentation**: All dimensions and measures include labels and descriptions
- **Type-Safe SQL**: Uses manifest constants for table references
- **Primary Keys**: Declared and hidden in views
- **Dimension Groups**: Proper use of time dimension groups with multiple timeframes
- **Measure Formatting**: Consistent value formatting for numerical measures
- **Caching Strategy**: Implements intelligent cache invalidation based on data changes
- **Data Quality**: Automated tests ensure data integrity
- **Project Organization**: Logical folder structure for maintainability

## Support & Maintenance

For questions or updates to this project, please refer to:
- **LookML Documentation**: See `tasks/best_practices.md` for best practices
- **Task Requirements**: See individual task files in the `tasks/` folder
- **View Definitions**: See `views/ecommerce_events.view.lkml` for field-level details

---

*Last Updated: November 11, 2025*
