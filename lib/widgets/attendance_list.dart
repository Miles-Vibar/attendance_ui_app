import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 30,
              )
            ]),
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          color: Theme.of(context).colorScheme.surfaceBright,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Heading(headingText: headingText),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: content,
                )
              ],
            ),
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
    );
  }
}

class AttendanceListTileWithImage extends StatelessWidget {
  const AttendanceListTileWithImage({
    super.key,
    required this.name,
    required this.image,
    required this.fromDate,
    required this.toDate,
  });

  final String name;
  final String image;
  final DateTime fromDate;
  final DateTime toDate;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: () => (),
      shape: const Border(
        bottom: BorderSide(
          color: Color.fromRGBO(226, 232, 237, 1),
        ),
      ),
      contentPadding: const EdgeInsets.only(
        left: 0.0,
        right: 0.0,
        top: 19.0,
        bottom: 19.0,
      ),
      visualDensity: const VisualDensity(vertical: 3),
      leading: SizedBox(
        width: 68,
        height: 68,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(image),
        ),
      ),
      title: SizedBox(
        height: 62,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              '${DateFormat.yMMMd().format(fromDate)} - ${DateFormat.yMMMd().format(toDate)}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Color.fromARGB(254, 231, 184, 1),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                child: Text(
                  'Sick leave',
                  style: TextStyle(
                    color: Color.fromARGB(158, 82, 0, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      trailing: SvgPicture.asset(
        'assets/icons/next.svg',
        width: 16,
        height: 16,
      ),
    );
  }
}
