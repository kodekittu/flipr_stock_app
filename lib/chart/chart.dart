/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineMultiColor extends SampleView {
  const LineMultiColor(Key key) : super(key: key);

  @override
  _LineMultiColorState createState() => _LineMultiColorState();
}

class _LineMultiColorState extends SampleViewState {
  _LineMultiColorState();

  @override
  Widget build(BuildContext context) {
    return getMultiColorLineChart();
  }

  SfCartesianChart getMultiColorLineChart() {
    return SfCartesianChart(
      title: ChartTitle(text: 'Annual rainfall of Paris'),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          intervalType: DateTimeIntervalType.years,
          dateFormat: DateFormat.y(),
          majorGridLines: MajorGridLines(width: 0),
          title: AxisTitle(text: 'Year')),
      primaryYAxis: NumericAxis(
          minimum: 200,
          maximum: 600,
          interval: 100,
          axisLine: AxisLine(width: 0),
          labelFormat: '{value}mm',
          majorTickLines: MajorTickLines(size: 0)),
      series: getMultiColoredLineSeries(),
      trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          lineType: TrackballLineType.vertical,
          tooltipSettings: InteractiveTooltip(format: 'point.x : point.y')),
    );
  }

  List<LineSeries<_ChartData, DateTime>> getMultiColoredLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(DateTime(1925), 415, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(1926), 408, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(1927), 415, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(1928), 350, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(1929), 375, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(1930), 500, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(1931), 390, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(1932), 450, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(1933), 440, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(1934), 350, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(1935), 400, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(1936), 365, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(1937), 490, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(1938), 400, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(1939), 520, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(1940), 510, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(1941), 395, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(1942), 380, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(1943), 404, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(1944), 400, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(1945), 500, const Color.fromRGBO(0, 189, 174, 1))
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
}

class _ChartData {
  _ChartData(this.x, this.y, [this.lineColor]);
  final DateTime x;
  final double y;
  final Color lineColor;
}


 */