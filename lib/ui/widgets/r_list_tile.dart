import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class RListTile extends StatelessWidget {
  RListTile({
    super.key,
    this.leadingIcon,
    required this.title,
    this.hideTrailing = false,
    required this.onPressed,
  });

  final String title;
  final IconData? leadingIcon;
  bool hideTrailing;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: leadingIcon != null ? FaIcon(leadingIcon) : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
      ),
      trailing: !hideTrailing
          ? const FaIcon(FontAwesomeIcons.angleRight, size: 16)
          : null,
    );
  }
}
