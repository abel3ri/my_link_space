import 'package:flutter/material.dart';

class ThemeLinkContainer extends StatelessWidget {
  const ThemeLinkContainer({
    super.key,
    required this.color,
    required this.themeLinkMiniContainers,
    required this.themeName,
  });

  final Color color;
  final List<Widget> themeLinkMiniContainers;
  final String themeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            child: Column(
              children: [Spacer(), ...themeLinkMiniContainers, Spacer()],
            ),
          ),
        ),
        Text(
          themeName,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
