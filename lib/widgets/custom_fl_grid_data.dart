import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomFlGridData extends FlGridData {
  CustomFlGridData()
      : super(
    show: true,
    drawVerticalLine: false,
    horizontalInterval: 20,
    getDrawingHorizontalLine: (value) => const FlLine(
      color: Color.fromRGBO(218, 226, 233, 1),
      strokeWidth: 1,
    ),
  );
}