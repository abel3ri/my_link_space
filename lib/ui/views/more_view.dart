import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/locale_view_model.dart';
import 'package:my_link_space/core/view_models/theme_view_model.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/r_container.dart';
import 'package:my_link_space/ui/widgets/r_list_tile.dart';
import 'package:my_link_space/ui/widgets/r_modal_bottom_sheet.dart';
import 'package:my_link_space/ui/widgets/r_sub_header_text.dart';
import 'package:my_link_space/utils/context_extension.dart';
import 'package:provider/provider.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    final localeViewModel = Provider.of<LocaleViewModel>(context);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text(context.localizations.more),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: MediaQuery.of(context).size.height * 0.04,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RSubHeaderText(text: context.localizations.account),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RContainer(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: context.localizations.profile,
                    leadingIcon: FontAwesomeIcons.user,
                    onPressed: () {},
                  ),
                  // Divider(thickness: .4),
                  RListTile(
                    title: context.localizations.resetPassword,
                    leadingIcon: FontAwesomeIcons.arrowsRotate,
                    onPressed: () {
                      rShowModalBottomSheet(
                        context: context,
                        label: "${context.localizations.resetPassword}?",
                        listTiles: [
                          RListTile(
                            title: context.localizations.resetPassword,
                            onPressed: () {},
                            leadingIcon: FontAwesomeIcons.arrowsRotate,
                            hideTrailing: true,
                          ),
                          RListTile(
                            title: context.localizations.cancel,
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
            RSubHeaderText(text: context.localizations.settings),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RContainer(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: context.localizations.theme,
                    onPressed: () {
                      rShowModalBottomSheet(
                        context: context,
                        label: context.localizations.changeTheme,
                        listTiles: [
                          RListTile(
                            leadingIcon: Icons.settings,
                            title: context.localizations.system,
                            onPressed: () async {
                              await themeViewModel
                                  .changeSelectedTheme("system");
                              GoRouter.of(context).pop();
                            },
                            hideTrailing: true,
                          ),
                          RListTile(
                            leadingIcon: Icons.dark_mode_rounded,
                            title: context.localizations.dark,
                            onPressed: () async {
                              await themeViewModel.changeSelectedTheme("dark");
                              GoRouter.of(context).pop();
                            },
                            hideTrailing: true,
                          ),
                          RListTile(
                            leadingIcon: Icons.sunny,
                            title: context.localizations.light,
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
                    title: context.localizations.language,
                    onPressed: () {
                      rShowModalBottomSheet(
                        context: context,
                        label: context.localizations.changeLanguage,
                        listTiles: [
                          RListTile(
                            title: "English",
                            onPressed: () async {
                              localeViewModel.updateLocale("en");
                              GoRouter.of(context).pop();
                            },
                            hideTrailing: true,
                          ),
                          RListTile(
                            title: "አማርኛ",
                            onPressed: () async {
                              localeViewModel.updateLocale("am");
                              GoRouter.of(context).pop();
                            },
                            hideTrailing: true,
                          ),
                          RListTile(
                            title: "Afaan Oromo",
                            onPressed: () async {
                              localeViewModel.updateLocale("or");
                              GoRouter.of(context).pop();
                            },
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
            RSubHeaderText(text: context.localizations.helpSupport),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RContainer(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: context.localizations.helpTopics,
                    onPressed: () {},
                  ),
                  // Divider(thickness: .4),
                  RListTile(
                    title: context.localizations.askAQuestion,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RSubHeaderText(text: context.localizations.legal),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RContainer(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: context.localizations.termsAndConditions,
                    onPressed: () {},
                  ),
                  // Divider(thickness: .4),
                  RListTile(
                    title: context.localizations.privacyPolicy,
                    onPressed: () {},
                  ),
                  // Divider(thickness: .4),
                  RListTile(
                    title: context.localizations.openSourceContent,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RContainer(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  RListTile(
                    title: context.localizations.logout,
                    leadingIcon: FontAwesomeIcons.arrowRightFromBracket,
                    onPressed: () {
                      rShowModalBottomSheet(
                        context: context,
                        label: context.localizations.logout,
                        listTiles: [
                          RListTile(
                            title: context.localizations.logout,
                            onPressed: () {},
                            leadingIcon: FontAwesomeIcons.arrowRightFromBracket,
                            hideTrailing: true,
                          ),
                          RListTile(
                            title: context.localizations.cancel,
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
                    title: context.localizations.deleteAccount,
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
