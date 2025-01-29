
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// add dependancy syncfusion_flutter_charts: ^28.1.41
class CustomComboChart extends StatefulWidget {
  final Color calorieColor;
  final Color weightColor;
  final List<String> dates;
  final List<double> calorieValues;
  final List<double> weightValues;

  const CustomComboChart({
    required this.calorieColor,
    required this.weightColor,
    required this.dates,
    required this.calorieValues,
    required this.weightValues,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomComboChart> createState() => _CustomComboChartState();


}

class _CustomComboChartState extends State<CustomComboChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  late var calorieMinMaxScale;
  late var weightMinMaxScale;
  @override
  void initState() {
    super.initState();
    data = List.generate(
      widget.dates.length,
          (index) => _ChartData(
        widget.dates[index],
        widget.calorieValues[index],
        widget.weightValues[index],
      ),
    );
    _tooltip = TooltipBehavior(enable: true);
    calorieMinMaxScale = calculateScaleFactor(widget.calorieValues);
    weightMinMaxScale = calculateScaleFactor(widget.weightValues);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Left Vertical Line + Calories Text
            Column(
              children: [
                _buildExpandedVerticalLine(),
                RotatedBox(
                  quarterTurns: -1,
                  child: const Text(
                    ' Calories ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                _buildExpandedVerticalLine(),
              ],
            ),

            // Graph (Takes More Space)
            Expanded(
              flex: 3,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0, // Removes top border
                primaryXAxis: CategoryAxis(
                  labelStyle: const TextStyle(color: Colors.black),
                  majorGridLines: const MajorGridLines(width: 0), // No horizontal grid lines
                  axisLine: const AxisLine(width: 0),
                ),
                primaryYAxis: NumericAxis(
                  minimum: (calorieMinMaxScale['minValue']!).toInt().toDouble(),
                  maximum: (calorieMinMaxScale['maxValue']!).toInt().toDouble(),
                  labelStyle: const TextStyle(color: Colors.black),
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0),

                ),
                axes: <NumericAxis>[
                  NumericAxis(
                    name: 'weightAxis',
                    opposedPosition: true,
                    minimum: (weightMinMaxScale['minValue']!).toInt().toDouble(),
                    maximum: (weightMinMaxScale['maxValue']!).toInt().toDouble(),
                    labelStyle: const TextStyle(color: Colors.black),
                    majorGridLines: const MajorGridLines(width: 0),
                    axisLine: const AxisLine(width: 0),
                  ),
                ],
                tooltipBehavior: _tooltip,
                series: <CartesianSeries<_ChartData, String>>[
                  ColumnSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Calories',
                    color: widget.calorieColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                    width: 0.5,
                  ),
                  LineSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y1,
                    name: 'Weight',
                    color: widget.weightColor,
                    width: 2,
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                      borderWidth: 2,
                    ),
                    yAxisName: 'weightAxis',
                  ),
                ],
              ),
            ),

            // Right Vertical Line + Weight Text
            Column(
              children: [
                _buildExpandedVerticalLine(),
                RotatedBox(
                  quarterTurns: 1,
                  child: const Text(
                    ' Weight ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                _buildExpandedVerticalLine(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a vertical line that matches the full height of the graph
  Widget _buildExpandedVerticalLine() {
    return Container(
      width: 1, // Line thickness
      height: MediaQuery.of(context).size.height * 0.1, // Full height of the graph
      color: Colors.black, // Line color
    );
  }

  /// Builds the legend indicator with a colored line and text.
  Widget _buildLegendIndicator(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 4, // Small line under the text
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Map<String, double> calculateScaleFactor(List<double> values) {
    if (values.isEmpty) {
      return {
        'minValue': 0,
        'maxValue': 10,
        'scalingFactor': 10,
      };
    }

    double minValue = values.reduce((a, b) => a < b ? a : b);
    double maxValue = values.reduce((a, b) => a > b ? a : b);



    // Calculate scaling factor as (mean value) / 7
    double scaleFactor =  (maxValue - minValue) / 4; // Ensures 5 values

    log("minValue : $minValue maxValue : $maxValue scalingFactor : $scaleFactor _____________");
    return {
      'minValue': minValue - scaleFactor, // Adjusting for buffer space
      'maxValue': maxValue + scaleFactor,
      'scalingFactor': scaleFactor,
    };


  }


}

class _ChartData {
  _ChartData(this.x, this.y, this.y1);

  final String x;
  final double y;
  final double y1;
}