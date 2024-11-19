import 'package:attendance_ui_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import 'heading.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({
    super.key,
    required this.headingText,
    required this.content,
  });

  final String headingText;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomCard(
      children: [
        Heading(headingText: headingText),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: content,
        )
      ],
    );
  }
}