import 'package:flutter/material.dart';

class RSubContainer extends StatelessWidget {
  const RSubContainer({
    super.key,
    required this.label,
    required this.value,
    this.height,
  });

  final String label;
  final String value;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
