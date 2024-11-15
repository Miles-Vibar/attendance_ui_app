import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'heading.dart';

class AttendanceList extends StatelessWidget {
  AttendanceList({
    super.key,
    required this.headingText,
  });

  final String headingText;

  final Map<MapEntry<String, String>, int> attendanceMap = {
    const MapEntry('smile', 'Timed-in'): 1245,
    const MapEntry('clock', 'Timed-out'): 0,
    const MapEntry('close', 'absent'): 1,
    const MapEntry('umbrella', 'On leave'): 2,
    const MapEntry('snooze', 'Rest day'): 1,
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceBright,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Heading(headingText: headingText),
              const Column(
                children: [
                  AttendanceListTile(
                    svg: 'smile',
                    color: Colors.green,
                    title: 'timed-in',
                    value: 1245,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceListTile extends StatelessWidget {
  const AttendanceListTile({
    super.key,
    required this.svg,
    required this.color,
    required this.title,
    required this.value,
  });

  final String svg;
  final Color color;
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              'assets/icons/$svg.svg',
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SvgPicture.asset(
            'assets/icons/next.svg',
            width: 16,
            height: 16,
          ),
        ],
      ),
    );
  }
}
