import 'package:flutter/material.dart';

class ThemeLinkMiniContainer extends StatelessWidget {
  const ThemeLinkMiniContainer({
    super.key,
    required this.color,
    this.height,
  });

  final Color color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
    );
  }
}
