import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ApplicationBarActionButton extends StatelessWidget {
  const ApplicationBarActionButton({
    super.key,
    required this.svg,
    this.function,
  });

  final String svg;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: function,
      icon: SvgPicture.asset(
        'assets/icons/$svg.svg',
        width: 20,
        height: 20,
      ),
    );
  }
}
