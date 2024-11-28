import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttendanceListTile extends StatelessWidget {
  const AttendanceListTile({
    super.key,
    required this.svg,
    required this.color,
    required this.title,
    required this.value,
    this.lastEntry = false,
  });

  final String svg;
  final Color color;
  final String title;
  final int value;
  final bool lastEntry;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ListTile(
          onTap: () => (),
          contentPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 9.0,
            bottom: 9.0,
          ),
          visualDensity: const VisualDensity(vertical: -4),
          leading: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                'assets/icons/$svg.svg',
                width: 20,
                height: 20,
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
                width: 12,
              ),
              SvgPicture.asset(
                'assets/icons/next.svg',
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: !lastEntry
                  ? const Color.fromRGBO(226, 232, 237, 1)
                  : Colors.transparent,
            ),
            child: const Row(
              children: [
                Expanded(
                  child: SizedBox(height: 1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
