import 'package:attendance_ui_app/data/data_interface.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

import '../data/current_week.dart';

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

class CustomFlTitlesData extends FlTitlesData {
  final TextStyle graphTextStyle;

  CustomFlTitlesData(
      {this.graphTextStyle = const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 8,
        color: Color.fromRGBO(137, 145, 162, 1),
      )})
      : super(
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
