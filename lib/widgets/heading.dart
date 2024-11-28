import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.headingText,
    this.trailing,
    this.padding,
  });

  final String headingText;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: (trailing == null) ? 58 : null,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: Row(
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
            trailing ??
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
      ),
    );
  }
}
