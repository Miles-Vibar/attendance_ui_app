import 'package:flutter/material.dart';

class BoldCustomListTile extends StatelessWidget {
  const BoldCustomListTile({
    super.key,
    required this.title,
    required this.trailing,
    this.leading,
    this.subtitle,
    this.padding,
  });

  final String title;
  final Widget trailing;
  final Widget? leading;
  final String? subtitle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ListTile(
          onTap: () => (),
          contentPadding: padding ?? EdgeInsets.zero,
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: trailing,
          leading: leading,
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle!,
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    color: Color.fromRGBO(137, 145, 162, 1),
                  ),
                ),
        ),
      ],
    );
  }
}
