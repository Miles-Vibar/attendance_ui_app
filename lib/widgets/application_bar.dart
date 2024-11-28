import 'package:attendance_ui_app/widgets/filter_bottom_sheet.dart';
import 'package:attendance_ui_app/widgets/settings_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'application_bar_action_button.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({
    super.key,
    required this.date,
    required this.controller,
    required this.tabs,
  });

  final DateTime date;
  final List<Tab> tabs;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownMenu(
          dropdownMenuEntries: List<DropdownMenuEntry>.of(
            List.generate(
              31,
              (i) {
                final curr = DateFormat.yMMMd()
                    .format(date.subtract(Duration(days: i)))
                    .toString();
                return curr == DateFormat.yMMMd().format(date).toString()
                    ? 'Today - $curr'
                    : curr;
              },
            ).map((d) => DropdownMenuEntry(value: d, label: d)).toList(),
          ),
          menuHeight: 300,
          hintText: 'Today - ${DateFormat.yMMMd().format(date)}',
          inputDecorationTheme: InputDecorationTheme(
            constraints: BoxConstraints.tight(const Size.fromHeight(40)),
            contentPadding: const EdgeInsets.all(12),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          initialSelection: DateFormat.yMMMd().format(date),
          expandedInsets: EdgeInsets.zero,
          trailingIcon: SvgPicture.asset('assets/icons/trailing-icon.svg'),
        ),
      ),
      bottom: TabBar(
        controller: controller,
        tabs: tabs,
        isScrollable: true,
        labelStyle: const TextStyle(fontWeight: FontWeight.w500),
        tabAlignment: TabAlignment.start,
        labelColor: Theme.of(context).colorScheme.onSurface,
      ),
      actions: [
        ApplicationBarActionButton(
          svg: 'carbon_filter',
          function: () => showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            context: context,
            builder: (BuildContext context) => const FilterBottomSheet(),
          ),
        ),
        ApplicationBarActionButton(
          svg: 'carbon_settings',
          function: () => showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            context: context,
            builder: (BuildContext context) => const SettingsBottomSheet(),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(139);
}
