import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.headingText});

  final String headingText;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child: Text(
            headingText,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        IconButton(
          onPressed: () => (),
          icon: SvgPicture.asset(
            'assets/icons/question-mark.svg',
            height: 12.5,
            width: 12.5,
          ),
        ),
      ],
    );
  }
}
