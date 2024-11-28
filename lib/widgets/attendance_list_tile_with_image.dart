import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

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
    return Column(
      children: [
        ListTile(
          onTap: () => (),
          shape: const Border(
            bottom: BorderSide(
              color: Color.fromRGBO(226, 232, 237, 1),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 9.0,
            bottom: 9.0,
          ),
          visualDensity: const VisualDensity(vertical: 3),
          leading: SizedBox(
            width: 68,
            height: 68,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
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
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
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
      ],
    );
  }
}