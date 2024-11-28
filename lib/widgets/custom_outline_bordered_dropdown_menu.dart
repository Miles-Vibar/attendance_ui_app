import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOutlineBorderedDropdownMenu extends StatelessWidget {
  const CustomOutlineBorderedDropdownMenu({
    super.key,
    this.label,
    required this.entries,
    this.hint,
    this.initial,
  });

  final String? label;
  final List<String> entries;
  final String? hint;
  final String? initial;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'OpenSans',
            ),
            textAlign: TextAlign.left,
          ),
        const SizedBox(
          height: 8,
        ),
        DropdownMenu(
          dropdownMenuEntries: entries
              .map((s) => DropdownMenuEntry(value: s, label: s))
              .toList(),
          menuHeight: 300,
          hintText: hint,
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 24,
              bottom: 24,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(226, 232, 237, 1),
              ),
            ),
            focusedBorder: OutlineInputBorder(),
          ),
          initialSelection: initial,
          expandedInsets: EdgeInsets.zero,
          trailingIcon: SvgPicture.asset(
            'assets/icons/trailing-icon.svg',
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
