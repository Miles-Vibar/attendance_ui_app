import 'package:attendance_ui_app/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_outline_bordered_dropdown_menu.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomBottomSheet(
      headingText: 'Filter Attendance',
      children: [
        const CustomOutlineBorderedDropdownMenu(
          label: 'Team',
          entries: ['All team'],
          initial: 'All team',
        ),
        const SizedBox(
          height: 24,
        ),
        CustomOutlineBorderedDropdownMenu(
          label: 'Date',
          hint: 'Today - ${DateFormat.yMMMd().format(DateTime.now())}',
          initial: DateFormat.yMMMd().format(DateTime.now()),
          entries: List.generate(
            31,
            (i) {
              final curr = DateFormat.yMMMd()
                  .format(DateTime.now().subtract(Duration(days: i)))
                  .toString();
              return curr ==
                      DateFormat.yMMMd().format(DateTime.now()).toString()
                  ? 'Today - $curr'
                  : curr;
            },
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () => (),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 24,
                  left: 20,
                  right: 20,
                ),
              ),
              child: const Text(
                'Clear Filter',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(137, 145, 162, 1),
                ),
              ),
            ),
            FilledButton(
              onPressed: () => (),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 24,
                  left: 20,
                  right: 20,
                ),
                minimumSize: const Size(114, 52),
              ),
              child: const Text(
                'View',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
