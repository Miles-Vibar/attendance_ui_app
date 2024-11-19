import 'package:attendance_ui_app/data/overtime.dart';
import 'package:attendance_ui_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import '../data/late.dart';
import '../data/time_in.dart';
import 'custom_bar_chart.dart';
import 'custom_line_chart.dart';
import 'custom_expansion_tile.dart';

class CollapsibleList extends StatelessWidget {
  const CollapsibleList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        CustomCard(
          children: [
            CustomExpansionTile(
              title: 'Time-In Trends',
              subtitleData: timeIns.last.y.toString(),
              subtitleText: 'people have timed in today',
              openedSubtitleText: 'of scheduled employees have timed in',
              color: const Color.fromRGBO(55, 203, 151, 1),
              svg: 'clock',
              withTooltip: true,
              chart: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: CustomLineChart(listOfData: timeIns),
              ),
            ),
          ],
        ),
        CustomCard(
          children: [
            CustomExpansionTile(
              title: 'Late Trends',
              subtitleData: lateTrends.last.y.toString(),
              subtitleText: 'people are late today',
              color: const Color.fromRGBO(245, 69, 69, 1),
              svg: 'simple-line-icons_exclamation',
              chart: CustomBarChart(listOfData: lateTrends),
            ),
          ],
        ),
        CustomCard(
          children: [
            CustomExpansionTile(
              title: 'Overtime Trends',
              subtitleData: '30 hrs',
              subtitleText: 'filed as overtime work',
              color: const Color.fromRGBO(245, 69, 69, 1),
              svg: 'clock',
              chart: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: CustomLineChart(listOfData: overtimes),
              ),
            )
          ],
        ),
      ],
    );
  }
}