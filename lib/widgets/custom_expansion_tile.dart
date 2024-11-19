

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subtitleData,
    required this.subtitleText,
    required this.color,
    required this.svg,
    this.openedSubtitleText,
    this.withTooltip = false,
    required this.chart,
  });

  final String title;
  final String subtitleData;
  final String subtitleText;
  final String? openedSubtitleText;
  final Color color;
  final String svg;
  final bool withTooltip;
  final Widget chart;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionTile(
      shape: const Border(),
      visualDensity: const VisualDensity(vertical: -4),
      tilePadding: EdgeInsets.zero,
      title: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(69, 79, 99, 1),
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          if (widget.withTooltip)
            InkWell(
              onTap: () => (),
              customBorder: const CircleBorder(),
              child: SvgPicture.asset(
                'assets/icons/question-mark.svg',
                height: 14,
                width: 14,
              ),
            ),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            '${widget.subtitleData} ',
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(69, 79, 99, 1),
              fontSize: 12,
            ),
          ),
          Text(
            widget.subtitleText,
            style: const TextStyle(
              fontFamily: 'OpenSans',
              color: Color.fromRGBO(69, 79, 99, 1),
              fontSize: 12,
            ),
          ),
        ],
      ),
      trailing: Icon(!_expanded ? Icons.add : Icons.remove),
      onExpansionChanged: (value) => setState(() {
        _expanded = value;
      }),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: SvgPicture.asset(
                      'assets/icons/${widget.svg}.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.subtitleData,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(69, 79, 99, 1),
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            Text(
              widget.openedSubtitleText ?? widget.subtitleText,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'OpenSans',
                color: widget.color,
                fontSize: 10,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 178,
              child: widget.chart,
            ),
          ],
        ),
      ],
    );
  }
}