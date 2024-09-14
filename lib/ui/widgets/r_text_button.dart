import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RTextButton extends StatelessWidget {
  const RTextButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(label),
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      icon: FaIcon(icon, size: 16),
    );
  }
}
