import 'package:attendance_ui_app/widgets/heading.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
    required this.headingText,
    required this.children,
    this.contentPadding,
    this.headingPadding,
    this.hasSpaceBeforeContent,
  });

  final String headingText;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? headingPadding;
  final List<Widget> children;
  final bool? hasSpaceBeforeContent;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntrinsicHeight(
      child: Padding(
        padding: widget.contentPadding ?? const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Heading(
                headingText: widget.headingText,
                trailing: CloseButton(
                  onPressed: () => Navigator.pop(context),
                ),
                padding: widget.headingPadding ??
                    const EdgeInsets.only(bottom: 16.0),
              ),
            ),
            Padding(
              padding: widget.headingPadding ?? EdgeInsets.zero,
              child: const DecoratedBox(
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
            if (widget.hasSpaceBeforeContent ?? true)
              const SizedBox(
                height: 24,
              ),
            for (Widget child in widget.children) child,
          ],
        ),
      ),
    );
  }
}
