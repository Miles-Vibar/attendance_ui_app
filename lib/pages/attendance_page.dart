import 'package:attendance_ui_app/widgets/attendance_list.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        AttendanceList(headingText: 'Attendance',),
        AttendanceList(headingText: 'Exception Report'),
      ],
    );
  }
}