import 'package:flutter/material.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';

class RContainer extends StatelessWidget {
  const RContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isDarkMode ? cardDarkBackgroundColor : cardLightBackgroundColor,
      ),
      child: child,
    );
  }
}
