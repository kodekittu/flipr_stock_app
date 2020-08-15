
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget graphChart() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: DateTimeAxis(
            intervalType: DateTimeIntervalType.days,
            dateFormat: DateFormat.d(),
            majorGridLines: MajorGridLines(width: 1),
        ),
        primaryYAxis: NumericAxis(
            minimum: 200,
            maximum: 600,
            interval: 100,
            axisLine: AxisLine(width: 1),
            labelFormat: '{value}',
            majorTickLines: MajorTickLines(size: 0)),
        series: getMultiColoredLineSeries(),
        trackballBehavior: TrackballBehavior(
            enable: true,lineColor: Colors.lightBlueAccent,
            activationMode: ActivationMode.singleTap,
            lineType: TrackballLineType.horizontal,
            tooltipSettings: InteractiveTooltip(format: 'point.x : point.y')),
      ),
    );
  }

  List<LineSeries<_ChartData, DateTime>> getMultiColoredLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(DateTime(1931), 390, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(1932), 450, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(1933), 440, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(1934), 350, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(1935), 400, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(1936), 365, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(1937), 490, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(1938), 400, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(1939), 520, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(1940), 510, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(1941), 395, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(1942), 380, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(1943), 404, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(1944), 400, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(1945), 500, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(2020), 415, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(2020), 408, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2020), 415, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2020), 350, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(2020), 375, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2020), 500, const Color.fromRGBO(248, 184, 131, 1)),
    ];
    return <LineSeries<_ChartData, DateTime>>[
      LineSeries<_ChartData, DateTime>(
          enableTooltip: true,
          animationDuration: 2500,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,

          /// The property used to apply the color each data.
          pointColorMapper: (_ChartData sales, _) => sales.lineColor,
          width: 2)
    ];
  }


class _ChartData {
  _ChartData(this.x, this.y, [this.lineColor]);
  final DateTime x;
  final double y;
  final Color lineColor;
}

