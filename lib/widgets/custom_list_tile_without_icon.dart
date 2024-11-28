

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.value,
    this.lastEntry = false,
  });

  final String title;
  final int value;
  final bool lastEntry;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: () => (),
      shape: !lastEntry
          ? const Border(
        bottom: BorderSide(
          color: Color.fromRGBO(226, 232, 237, 1),
        ),
      )
          : null,
      contentPadding: EdgeInsets.only(
        left: 0.0,
        right: 0.0,
        top: 9.0,
        bottom: !lastEntry ? 9.0 : 0.0,
      ),
      visualDensity: const VisualDensity(vertical: -4),
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
            width: 12,
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
