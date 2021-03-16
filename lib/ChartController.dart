import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as Chart;

class ChartController extends GetxController{

  RxList series = [].obs;

  generateData(){

    var chart = [
      LineChartModel(date: "14 March", valueForX: 0.00, valueForY: 0.00),
      LineChartModel(date: "15 March", valueForX: 0.00, valueForY: 0.00),
      LineChartModel(date: "16 March", valueForX: 0.00, valueForY: 0.00),
      LineChartModel(date: "17 March", valueForX: 0.00, valueForY: 0.00),
      LineChartModel(date: "18 March", valueForX: 0.00, valueForY: 0.00),
      LineChartModel(date: "19 March", valueForX: 0.00, valueForY: 0.00),
      LineChartModel(date: "20 March", valueForX: 0.00, valueForY: 0.00),
    ];

    series.add(
      Chart.Series(data: chart,
      domainFn: (LineChartModel task, _)=> task.valueForX,
      measureFn: (LineChartModel task, _)=> task.valueForY,
      colorFn: (var task, _)=> Chart.ColorUtil.fromDartColor(Colors.black45),
        id: 'Daily Task',
        labelAccessorFn: (LineChartModel row, _)=> '${row.date}'
      )
    );

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    series = List<Chart.Series<LineChartModel, double>>().obs;
    generateData();
  }
}

class LineChartModel{
  String date;
  double valueForY;
  double valueForX;
  Color color;

  LineChartModel({this.date, this.valueForX, this.valueForY, this.color});
}