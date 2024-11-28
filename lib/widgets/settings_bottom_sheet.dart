import 'package:attendance_ui_app/widgets/bold_custom_list_tile.dart';
import 'package:attendance_ui_app/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomBottomSheet(
      headingText: 'Filter Track View',
      headingPadding: const EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 16,
      ),
      contentPadding: const EdgeInsets.only(top: 16),
      hasSpaceBeforeContent: false,
      children: [
        BoldCustomListTile(
          title: 'General',
          trailing: SvgPicture.asset(
            'assets/icons/next.svg',
          ),
          padding: const EdgeInsets.only(
            left: 16,
            top: 8,
            bottom: 8,
            right: 16,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromRGBO(226, 232, 237, 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(height: 1),
                ),
              ],
            ),
          ),
        ),
        BoldCustomListTile(
          title: 'Attendance',
          trailing: SvgPicture.asset(
            'assets/icons/next.svg',
          ),
          padding: const EdgeInsets.only(
            left: 16,
            top: 8,
            bottom: 8,
            right: 16,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromRGBO(226, 232, 237, 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(height: 1),
                ),
              ],
            ),
          ),
        ),
        BoldCustomListTile(
          title: 'Sales',
          trailing: SvgPicture.asset(
            'assets/icons/next.svg',
          ),
          padding: const EdgeInsets.only(
            left: 16,
            top: 8,
            bottom: 8,
            right: 16,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromRGBO(226, 232, 237, 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(height: 1),
                ),
              ],
            ),
          ),
        ),
        BoldCustomListTile(
          title: 'Individual Feed',
          trailing: SvgPicture.asset(
            'assets/icons/next.svg',
          ),
          padding: const EdgeInsets.only(
            left: 16,
            top: 8,
            bottom: 8,
            right: 16,
          ),
        ),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}
