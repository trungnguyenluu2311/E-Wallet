import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartColumn {
  final String year;
  int thuchi;
  final charts.Color barColor;

  ChartColumn(
      { this.thuchi,
        this.barColor,
        this.year});
}
