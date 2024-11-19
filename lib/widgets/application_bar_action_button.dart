import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ApplicationBarActionButton extends StatelessWidget {
  const ApplicationBarActionButton({
    super.key,
    required this.svg,
  });

  final String svg;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: () => (),
      icon: SvgPicture.asset(
        'assets/icons/$svg.svg',
        width: 20,
        height: 20,
      ),
    );
  }
}
