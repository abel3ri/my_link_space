import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/utils/context_extension.dart';

class UpgradeAction extends StatelessWidget {
  const UpgradeAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? chipBackgroundDark : chipBackgroundLight,
        borderRadius: BorderRadius.circular(100),
      ),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushNamed("upgrade");
        },
        child: Row(
          children: [
            Text(
              context.localizations.upgrade,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            FaIcon(FontAwesomeIcons.bolt),
          ],
        ),
      ),
    );
  }
}
