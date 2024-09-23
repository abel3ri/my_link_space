import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';

class UpgradeAction extends StatelessWidget {
  const UpgradeAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? chipBackgroundDark : chipBackgroundLight,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Text(
            "Upgrade",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          const FaIcon(FontAwesomeIcons.bolt),
        ],
      ),
    );
  }
}
