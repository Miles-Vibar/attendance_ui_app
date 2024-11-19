import 'package:attendance_ui_app/data/data_interface.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

import 'custom_border_data.dart';
import 'custom_fl_grid_data.dart';
import 'custom_fl_titles_data.dart';

class CustomLineChart extends LineChart {
  CustomLineChart({super.key, required this.listOfData})
      : super(
          LineChartData(
            minY: 0,
            maxY: listOfData.map((value) => value.y).max.toDouble() < 100.0
                ? 100.0
                : listOfData.map((value) => value.y).max.toDouble(),
            gridData: CustomFlGridData(),
            borderData: CustomFlBorderData(),
            lineBarsData: [
              LineChartBarData(
                spots: listOfData
                    .mapIndexed((index, value) =>
                        FlSpot(index.toDouble(), value.y.toDouble()))
                    .toList(),
                color: const Color.fromRGBO(69, 132, 235, 1),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(69, 132, 235, 0.2),
                      Color.fromRGBO(131, 212, 176, 0.4),
                    ],
                  ),
                ),
              )
            ],
            titlesData: CustomFlTitlesData(),
          ),
        );

  final List<DataInterface> listOfData;
}