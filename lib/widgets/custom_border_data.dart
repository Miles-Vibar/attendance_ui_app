import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomFlBorderData extends FlBorderData {
  CustomFlBorderData()
      : super(
    show: true,
    border: const Border(
      top: BorderSide(
        color: Color.fromRGBO(218, 226, 233, 1),
      ),
      bottom: BorderSide(
        color: Color.fromRGBO(218, 226, 233, 1),
      ),
    ),
  );
}