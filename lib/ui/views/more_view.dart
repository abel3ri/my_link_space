import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/theme_view_model.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/r_container.dart';
import 'package:my_link_space/ui/widgets/r_list_tile.dart';
import 'package:my_link_space/ui/widgets/r_modal_bottom_sheet.dart';
import 'package:my_link_space/ui/widgets/r_sub_header_text.dart';
import 'package:provider/provider.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text("More"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: MediaQuery.of(context).size.height * 0.04,
        ),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RSubHeaderText(text: "Account"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RContainer(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: "Profile",
                    leadingIcon: FontAwesomeIcons.user,
                    onPressed: () {},
                  ),
                  // Divider(thickness: .4),
                  RListTile(
                    title: "Reset Password",
                    leadingIcon: FontAwesomeIcons.arrowsRotate,
                    onPressed: () {
                      rShowModalBottomSheet(
                        context: context,
                        label: "Reset Password?",
                        listTiles: [
                          RListTile(
                            title: "Reset Password",
                            onPressed: () {},
                            leadingIcon: FontAwesomeIcons.arrowsRotate,
                            hideTrailing: true,
                          ),
                          RListTile(
                            title: "Cancel",
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            leadingIcon: FontAwesomeIcons.xmark,
                            hideTrailing: true,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RSubHeaderText(text: "Settings"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RContainer(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: "Theme",
                    onPressed: () {
                      rShowModalBottomSheet(
                        context: context,
                        label: "Change Theme",
                        listTiles: [
                          RListTile(
                            leadingIcon: Icons.settings,
                            title: "System",
                            onPressed: () async {
                              await themeViewModel
                                  .changeSelectedTheme("system");
                              GoRouter.of(context).pop();
                            },
                            hideTrailing: true,
                          ),
                          RListTile(
                            leadingIcon: Icons.dark_mode_rounded,
                            title: "Dark",
                            onPressed: () async {},
                            hideTrailing: true,
                          ),
                          RListTile(
                            leadingIcon: Icons.sunny,
                            title: "Light",
                            onPressed: () async {
                              await themeViewModel.changeSelectedTheme("light");
                              GoRouter.of(context).pop();
                            },
                            hideTrailing: true,
                          ),
                        ],
                      );
                    },
                    leadingIcon: Icons.color_lens,
                  ),
                  RListTile(
                    title: "Language",
                    onPressed: () {
                      rShowModalBottomSheet(
                        context: context,
                        label: "Change Language",
                        listTiles: [
                          RListTile(
                            leadingIcon: Icons.settings,
                            title: "English",
                            onPressed: () async {},
                            hideTrailing: true,
                          ),
                          RListTile(
                            leadingIcon: Icons.dark_mode_rounded,
                            title: "አማርኛ",
                            onPressed: () async {},
                            hideTrailing: true,
                          ),
                          RListTile(
                            leadingIcon: Icons.sunny,
                            title: "Afaan Oromo",
                            onPressed: () async {},
                            hideTrailing: true,
                          ),
                        ],
                      );
                    },
                    leadingIcon: Icons.translate_rounded,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RSubHeaderText(text: "Help & Support"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RContainer(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: "Help Topics",
                    onPressed: () {},
                  ),
                  // Divider(thickness: .4),
                  RListTile(
                    title: "Ask a Question",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RSubHeaderText(text: "Legal"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RContainer(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: "Terms and Conditions",
                    onPressed: () {},
                  ),
                  // Divider(thickness: .4),
                  RListTile(
                    title: "Privacy Policy",
                    onPressed: () {},
                  ),
                  // Divider(thickness: .4),
                  RListTile(
                    title: "Open Source Content",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RContainer(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: "Logout",
                    leadingIcon: FontAwesomeIcons.arrowRightFromBracket,
                    onPressed: () {
                      rShowModalBottomSheet(
                        context: context,
                        label: "Logout",
                        listTiles: [
                          RListTile(
                            title: "Log out",
                            onPressed: () {},
                            leadingIcon: FontAwesomeIcons.arrowRightFromBracket,
                            hideTrailing: true,
                          ),
                          RListTile(
                            title: "Cancel",
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            leadingIcon: FontAwesomeIcons.xmark,
                            hideTrailing: true,
                          ),
                        ],
                      );
                    },
                    hideTrailing: true,
                  ),
                  RListTile(
                    title: "Delete Account",
                    onPressed: () {
                      GoRouter.of(context).pushNamed("deleteAccount");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
