
import 'package:flipr_stock_app/model/ChartGraphData.dart';
import 'package:flipr_stock_app/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget graphChart(context, ChartGraphData, isLoadedList) {
  MediaQueryData data = MediaQuery.of(context);
    return isLoadedList ==false ? CircularProgressIndicator(backgroundColor: Colors.lightBlueAccent,) :Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: data.size.width * 1.2,
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: DateTimeAxis(
                intervalType: DateTimeIntervalType.days,
                dateFormat: DateFormat("y-MM-dd"),
                majorGridLines: MajorGridLines(width: 1),
            ),
            primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 6000,
                interval: 100,
                axisLine: AxisLine(width: 1),
                labelFormat: '{value}',
                majorTickLines: MajorTickLines(size: 0)),
            series: getMultiColoredLineSeries(ChartGraphData),
            trackballBehavior: TrackballBehavior(
                enable: true,lineColor: Colors.lightBlueAccent,
                activationMode: ActivationMode.singleTap,
                lineType: TrackballLineType.horizontal,
                tooltipSettings: InteractiveTooltip(format: 'point.x : point.y')),
          ),
        ),
      ),
    );
  }

  List<LineSeries<_ChartData, DateTime>> getMultiColoredLineSeries(List<ChartGraphData> chartGraphData) {
    List<_ChartData> newList = [];
    chartGraphData.forEach((element) {
      newList.add(_ChartData(element.dateTime, element.value, Colors.red));
    });
    return <LineSeries<_ChartData, DateTime>>[
      LineSeries<_ChartData, DateTime>(
          enableTooltip: true,
          animationDuration: 2500,
          dataSource: newList,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          /// The property used to apply the color each data.
          pointColorMapper: (_ChartData sales, _) => sales.lineColor,
          width: 2)
    ];

    /*final List<_ChartData> chartData = <_ChartData>[
      _ChartData(DateTime(2001), 390, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(2002), 450, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(2003), 440, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(2004), 350, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2005), 400, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(2006), 365, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(2007), 490, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(2008), 400, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2009), 520, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(2010), 510, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData(DateTime(2011), 395, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(2012), 380, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(2012), 404, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2013), 400, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(2014), 500, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData(DateTime(2015), 415, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(2015), 408, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2016), 415, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2017), 350, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData(DateTime(2018), 375, const Color.fromRGBO(248, 184, 131, 1)),
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
    ];*/
  }


class _ChartData {
  _ChartData(this.x, this.y, [this.lineColor]);
  final DateTime x;
  final double y;
  final Color lineColor;
}

