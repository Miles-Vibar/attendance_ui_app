import 'package:fl_chart/fl_chart.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../data/data_interface.dart';
import 'custom_border_data.dart';
import 'custom_fl_grid_data.dart';
import 'custom_fl_titles_data.dart';

class CustomBarChart extends BarChart {
  CustomBarChart({super.key, required this.listOfData})
      : super(
    BarChartData(
      minY: 0,
      maxY: listOfData.map((value) => value.y).max.toDouble() < 100.0
          ? 100.0
          : listOfData.map((value) => value.y).max.toDouble(),
      titlesData: CustomFlTitlesData(),
      borderData: CustomFlBorderData(),
      gridData: CustomFlGridData(),
      barGroups: listOfData
          .mapIndexed(
            (index, value) => BarChartGroupData(x: index, barRods: [
          BarChartRodData(
            toY: value.y.toDouble(),
            width: 12,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(245, 69, 69, 1),
                Color.fromRGBO(245, 195, 13, 1),
              ],
            ),
          ),
        ]),
      )
          .toList(),
    ),
  );

  final List<DataInterface> listOfData;
}
