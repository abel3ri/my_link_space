import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RCircleButton extends StatelessWidget {
  const RCircleButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          CircleBorder(
            side: BorderSide(
              width: .5,
            ),
          ),
        ),
      ),
      onPressed: () {},
      icon: FaIcon(icon, size: 20),
    );
  }
}
