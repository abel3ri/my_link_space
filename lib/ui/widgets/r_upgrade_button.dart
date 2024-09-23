import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RUpgradeButton extends StatelessWidget {
  const RUpgradeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: !isDarkMode ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Text(
              "Upgrade",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: !isDarkMode ? Colors.white : Colors.black,
                  ),
            ),
            const SizedBox(width: 8),
            FaIcon(
              FontAwesomeIcons.lock,
              size: 12,
              color: !isDarkMode ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
