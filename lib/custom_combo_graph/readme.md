# Custom Combo Chart - Flutter

## Overview
This Flutter widget, `CustomComboChart`, is a **combo chart** that displays **calories (bar chart)** and **weight (line chart)** on the same graph. It uses the `syncfusion_flutter_charts` package to provide an intuitive and customizable charting experience.

## Features
- 📊 **Bar Chart for Calories**
- 📈 **Line Chart for Weight**
- 🎨 **Customizable Colors for Calories & Weight**
- 📅 **Dynamic Data Binding to Dates**
- 🔍 **Tooltip Enabled for Data Points**
- 📏 **Automatic Scaling for Both Axes**
- 🎭 **Graph Styling with Custom Labels & Borders**

## Dependencies
Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  syncfusion_flutter_charts: ^28.1.41
```

## Usage
To use this chart in your Flutter app, instantiate the `CustomComboChart` widget and provide the necessary parameters:

```dart
@CustomComboChart(
  calorieColor: Colors.orange,
  weightColor: Colors.blue,
  dates: ['Jan 1', 'Jan 2', 'Jan 3', 'Jan 4', 'Jan 5', 'Jan 6', 'Jan 7'],
  calorieValues: [200, 180, 190, 200, 195, 198, 210],
  weightValues: [21, 19, 19.5, 19.7, 19.8, 20, 21.5],
)
```

## Code Structure
### 1. **Chart Data Model** (`_ChartData`)
A class that holds the x-axis values (`String x`), calorie values (`double y`), and weight values (`double y1`).

### 2. **State Management (`_CustomComboChartState`)**
- Generates data from the provided lists.
- Calculates dynamic scaling for both axes.
- Handles tooltip behavior.

### 3. **Graph Customization**
- **Bar Chart (ColumnSeries)** → Represents calorie intake.
- **Line Chart (LineSeries)** → Represents weight.
- **Dual Y-Axis Support** → Calories on left, weight on right.

### 4. **Scaling & Adjustments**
- The function `calculateScaleFactor()` adjusts the min/max values for better data visualization.

## Screenshots
📷 **Example Chart UI:** (Attach UI screenshot here)

## License
This project is open-source and available for modification. 😊

