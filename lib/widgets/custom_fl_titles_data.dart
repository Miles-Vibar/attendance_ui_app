import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/current_week.dart';

class CustomFlTitlesData extends FlTitlesData {
  final TextStyle graphTextStyle;

  CustomFlTitlesData({
    this.graphTextStyle = const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 8,
      color: Color.fromRGBO(137, 145, 162, 1),
    ),
  }) : super(
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(),
    ),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) => SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text(
            week[value.toInt()],
            style: graphTextStyle,
          ),
        ),
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 20,
        getTitlesWidget: (value, meta) => SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text(
            value.toInt().toString(),
            style: graphTextStyle,
          ),
        ),
      ),
    ),
  );
}
