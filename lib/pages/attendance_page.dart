import 'package:attendance_ui_app/widgets/attendance_list.dart';
import 'package:attendance_ui_app/widgets/collapsible_list.dart';
import 'package:flutter/material.dart';

import '../widgets/attendance_list_tile.dart';
import '../widgets/attendance_list_tile_with_image.dart';

class AttendancePage extends StatelessWidget {
  AttendancePage({super.key});

  final listOfLeaves = [
    AttendanceListTileWithImage(
      name: 'Daniel Hamilton',
      image:
          'https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?s=612x612&w=0&k=20&c=8ssXDNTp1XAPan8Bg6mJRwG7EXHshFO5o0v9SIj96nY=',
      fromDate: DateTime.now(),
      toDate: DateTime.now().add(const Duration(days: 1)),
    ),
    AttendanceListTileWithImage(
      name: 'Bridget Reyes',
      image:
          'https://marketplace.canva.com/EAFqNrAJpQs/1/0/1600w/canva-neutral-pink-modern-circle-shape-linkedin-profile-picture-WAhofEY5L1U.jpg',
      fromDate: DateTime.now(),
      toDate: DateTime.now().add(const Duration(days: 1)),
    ),
    AttendanceListTileWithImage(
      name: 'Danielle Dela Cruz',
      image:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
      fromDate: DateTime.now(),
      toDate: DateTime.now().add(const Duration(days: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        const AttendanceList(
          headingText: 'Attendance',
          content: [
            AttendanceListTile(
              svg: 'smile',
              color: Color.fromRGBO(55, 203, 151, 1),
              title: 'Timed-in',
              value: 1245,
            ),
            AttendanceListTile(
              svg: 'clock',
              color: Color.fromRGBO(255, 219, 89, 1),
              title: 'Timed-out',
              value: 0,
            ),
            AttendanceListTile(
              svg: 'close',
              color: Color.fromRGBO(255, 133, 51, 1),
              title: 'Absent',
              value: 1,
            ),
            AttendanceListTile(
              svg: 'umbrella',
              color: Color.fromRGBO(69, 132, 235, 1),
              title: 'On leave',
              value: 2,
            ),
            AttendanceListTile(
              svg: 'snooze',
              color: Color.fromRGBO(167, 97, 255, 1),
              title: 'Rest day',
              value: 1,
              lastEntry: true,
            ),
          ],
        ),
        const AttendanceList(
          headingText: 'Exception Report',
          content: [
            AttendanceListTile(
              svg: 'simple-line-icons_exclamation',
              color: Color.fromRGBO(245, 69, 69, 1),
              title: 'Late employees',
              value: 18,
            ),
            AttendanceListTile(
              svg: 'image-broken',
              color: Color.fromRGBO(245, 69, 69, 1),
              title: 'Low photo accuracy',
              value: 1,
            ),
            AttendanceListTile(
              svg: 'compare',
              color: Color.fromRGBO(245, 69, 69, 1),
              title: 'Location mismatch',
              value: 2,
            ),
            AttendanceListTile(
              svg: 'gps-off',
              color: Color.fromRGBO(245, 69, 69, 1),
              title: 'Missing Location',
              value: 1,
              lastEntry: true,
            ),
          ],
        ),
        AttendanceList(
          headingText: 'Leaves for Approval',
          content: [
            Column(
              children: listOfLeaves,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => (),
                  child: Text(
                    'View all leaves for approval',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        CollapsibleList(),
      ],
    );
  }
}
