import 'package:attendance_ui_app/data/overtime.dart';
import 'package:attendance_ui_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:collection/collection.dart';

import '../data/late.dart';
import '../data/time_in.dart';
import 'custom_graphs.dart';

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
              subtitleData: lates.last.y.toString(),
              subtitleText: 'people are late today',
              color: const Color.fromRGBO(245, 69, 69, 1),
              svg: 'simple-line-icons_exclamation',
              chart: CustomBarChart(listOfData: lates),
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

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subtitleData,
    required this.subtitleText,
    required this.color,
    required this.svg,
    this.openedSubtitleText,
    this.withTooltip = false,
    required this.chart,
  });

  final String title;
  final String subtitleData;
  final String subtitleText;
  final String? openedSubtitleText;
  final Color color;
  final String svg;
  final bool withTooltip;
  final Widget chart;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionTile(
      shape: const Border(),
      visualDensity: const VisualDensity(vertical: -4),
      tilePadding: EdgeInsets.zero,
      title: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(69, 79, 99, 1),
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          if (widget.withTooltip)
            InkWell(
              onTap: () => (),
              customBorder: const CircleBorder(),
              child: SvgPicture.asset(
                'assets/icons/question-mark.svg',
                height: 14,
                width: 14,
              ),
            ),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            '${widget.subtitleData} ',
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(69, 79, 99, 1),
              fontSize: 12,
            ),
          ),
          Text(
            widget.subtitleText,
            style: const TextStyle(
              fontFamily: 'OpenSans',
              color: Color.fromRGBO(69, 79, 99, 1),
              fontSize: 12,
            ),
          ),
        ],
      ),
      trailing: Icon(!_expanded ? Icons.add : Icons.remove),
      onExpansionChanged: (value) => setState(() {
        _expanded = value;
      }),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: SvgPicture.asset(
                      'assets/icons/${widget.svg}.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.subtitleData,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(69, 79, 99, 1),
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            Text(
              widget.openedSubtitleText ?? widget.subtitleText,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'OpenSans',
                color: widget.color,
                fontSize: 10,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 178,
              child: widget.chart,
            ),
          ],
        ),
      ],
    );
  }
}
