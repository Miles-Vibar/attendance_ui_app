import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';

import '../controllers/expansion_tile_controller.dart';

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
    this.controller,
  });

  final String title;
  final String subtitleData;
  final String subtitleText;
  final String? openedSubtitleText;
  final Color color;
  final String svg;
  final bool withTooltip;
  final Widget chart;
  final CustomExpansionTileController? controller;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  late CustomExpansionTileController _controller;
  late final ExpansionTileController _defaultController =
      ExpansionTileController();

  @override
  void initState() {
    // TODO: implement initState
    _controller = widget.controller ?? CustomExpansionTileController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListenableBuilder(
      listenable: _controller,
      builder: (BuildContext context, Widget? child) {
        SchedulerBinding.instance.addPostFrameCallback((_) =>
            _controller.expanded
                ? _defaultController.expand()
                : _defaultController.collapse());
        return ExpansionTile(
          initiallyExpanded: _controller.expanded,
          controller: _defaultController,
          shape: const Border(),
          visualDensity: const VisualDensity(vertical: -4),
          tilePadding: const EdgeInsets.all(16.0),
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
          trailing: Icon(!(_controller.expanded) ? Icons.add : Icons.remove),
          onExpansionChanged: (value) {
            _controller.collapseOrExpand(value);
          },
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
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
            ),
          ],
        );
      },
    );
  }
}
