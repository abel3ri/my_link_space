import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/ui/widgets/r_button.dart';

class UpgradeView extends StatelessWidget {
  const UpgradeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> adItems = [
      "Get access to powerful analytics and insights",
      "Customize your MyLinkSpace and remove logo",
      "Play videos and capture emails directly on your linktree",
      "Plus much, mush more!",
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.3),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  scale: .5,
                  image: AssetImage(
                    "assets/asset_2.png",
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.06,
              left: 5,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            Text(
              "Join the PROs to unlock this feature and tons of amazing others",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.check,
                      size: 22,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                      child: Text(
                        adItems[index],
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01);
              },
              itemCount: 4,
            ),
            Spacer(),
            RButton(label: "Upgrade now", onPressed: () {}),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RButton(
              label: "No thanks, maybe later",
              onPressed: () {},
              filled: false,
            ),
          ],
        ),
      ),
    );
  }
}
