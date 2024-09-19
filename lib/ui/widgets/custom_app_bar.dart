import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/ui/widgets/upgrade_action.dart';

PreferredSize CustomAppBar({
  required BuildContext context,
  required Widget title,
  List<Widget>? actions,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(56),
    child: AppBar(
      title: title,
      titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      actions: [
        UpgradeAction(),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.shareNodes),
        )
      ],
    ),
  );
}
