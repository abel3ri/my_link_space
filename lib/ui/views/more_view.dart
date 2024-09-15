import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/r_container.dart';
import 'package:my_link_space/ui/widgets/r_list_tile.dart';
import 'package:my_link_space/ui/widgets/r_modal_bottom_sheet.dart';
import 'package:my_link_space/ui/widgets/r_sub_header_text.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Divider(thickness: .4),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
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
                  Divider(thickness: .4),
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
                  Divider(thickness: .4),
                  RListTile(
                    title: "Privacy Policy",
                    onPressed: () {},
                  ),
                  Divider(thickness: .4),
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
