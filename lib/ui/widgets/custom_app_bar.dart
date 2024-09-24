import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/core/models/error_model.dart';
import 'package:my_link_space/ui/widgets/upgrade_action.dart';
import 'package:share_plus/share_plus.dart';

PreferredSize CustomAppBar({
  required BuildContext context,
  required Widget title,
  List<Widget>? actions,
  bool showBottom = false,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(56),
    child: AppBar(
      title: title,
      titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      actions: [
        const UpgradeAction(),
        IconButton(
          onPressed: () async {
            try {
              await Share.shareUri(
                Uri.parse("https://wwww.mylinkspace.com/users/1"),
              );
            } catch (e) {
              ErrorModel(body: e.toString()).showError(context);
            }
          },
          icon: const FaIcon(Icons.share),
        )
      ],
      bottom: showBottom
          ? const PreferredSize(
              preferredSize: Size.fromHeight(4),
              child: LinearProgressIndicator())
          : null,
    ),
  );
}
