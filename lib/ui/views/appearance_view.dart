import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/r_button.dart';

class AppearanceView extends StatelessWidget {
  const AppearanceView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> adItems = [
      "Remove MyLinkSpace Logo",
      "Track Performance of all-time Data Including Revenue Earned",
      "Showcase Latest Content Automatically Via X(formerly Twitter), YouTube, or RSS Feed",
      "Connect to Google Analytics, Zapier, Facebook pixel and more!",
    ];
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text("Appearance"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: MediaQuery.of(context).size.height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeaderText(
              text: "Profile",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        child: Text(
                          "O",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Expanded(
                        child: Column(
                          children: [
                            RButton(
                              label: "Pick an image",
                              onPressed: () {},
                              height: 38,
                            ),
                            RButton(
                              label: "Remove",
                              onPressed: () {},
                              height: 38,
                              filled: false,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  RSubContainer(
                    label: "Profile Title",
                    value: "@ktmobiledev",
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  RSubContainer(
                    label: "Bio",
                    value: "Bio",
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("0 / 80"),
                  ),
                  Divider(thickness: .4),
                  RTextButton(
                    label: "Add social icons",
                    onPressed: () {},
                    icon: FontAwesomeIcons.plus,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Stack(
              children: [
                Container(
                  height: 360,
                  padding: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            width: MediaQuery.of(context).size.width * 0.35,
                            fit: BoxFit.fill,
                            height: constraints.maxHeight,
                            "assets/asset_1.png",
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: constraints.maxHeight * 0.03),
                                Text(
                                  "Join The Premium",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(height: constraints.maxHeight * 0.02),
                                Text(
                                  "Unlock these features and tons of amazing others.",
                                  maxLines: 3,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.check,
                                          size: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        Expanded(
                                          child: Text(
                                            adItems[index],
                                            maxLines: 2,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: constraints.maxHeight * 0.02,
                                    );
                                  },
                                  itemCount: 4,
                                ),
                                SizedBox(height: constraints.maxHeight * 0.02),
                                Spacer(),
                                FilledButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Find out more",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                SizedBox(height: constraints.maxHeight * 0.02),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Positioned(
                  top: -10,
                  right: -5,
                  child: IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.solidCircleXmark, size: 16),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SubHeaderText(text: "Themes"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RContainer(
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 16,
                ),
                children: [
                  ThemeLinkContainer(
                    themeName: "Dark",
                    color: Colors.black,
                    themeLinkMiniContainers: [
                      ThemeLinkMiniContainer(
                        color: Colors.white,
                        height: 12,
                      ),
                      SizedBox(height: 8),
                      ThemeLinkMiniContainer(
                        color: Colors.white,
                        height: 12,
                      ),
                      SizedBox(height: 8),
                      ThemeLinkMiniContainer(
                        color: Colors.white,
                        height: 12,
                      ),
                    ],
                  ),
                  ThemeLinkContainer(
                    themeName: "Pebble Purple",
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.5),
                    themeLinkMiniContainers: [
                      ThemeLinkMiniContainer(
                        color: Colors.white,
                        height: 12,
                      ),
                      SizedBox(height: 8),
                      ThemeLinkMiniContainer(
                        color: Colors.white,
                        height: 12,
                      ),
                      SizedBox(height: 8),
                      ThemeLinkMiniContainer(
                        color: Colors.white,
                        height: 12,
                      ),
                    ],
                  ),
                  ThemeLinkContainer(
                    themeName: "Pebble Blue",
                    color: Colors.blue.withOpacity(.5),
                    themeLinkMiniContainers: [
                      ThemeLinkMiniContainer(
                        color: Colors.white,
                        height: 12,
                      ),
                      SizedBox(height: 8),
                      ThemeLinkMiniContainer(
                        color: Colors.white,
                        height: 12,
                      ),
                      SizedBox(height: 8),
                      ThemeLinkMiniContainer(
                        color: Colors.white,
                        height: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SubHeaderText(text: "Fonts"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Font",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: .2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(),
                          child: Text(
                            "Aa",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Text(
                          "DM sans",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    "Color",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text("#ffffff"),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hide MyLinkSpace Logo"),
                      UpgradeButton(),
                    ],
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

class UpgradeButton extends StatelessWidget {
  const UpgradeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
            SizedBox(width: 8),
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

class ThemeLinkContainer extends StatelessWidget {
  const ThemeLinkContainer({
    super.key,
    required this.color,
    required this.themeLinkMiniContainers,
    required this.themeName,
  });

  final Color color;
  final List<Widget> themeLinkMiniContainers;
  final String themeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            child: Column(
              children: [Spacer(), ...themeLinkMiniContainers, Spacer()],
            ),
          ),
        ),
        Text(
          themeName,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

class ThemeLinkMiniContainer extends StatelessWidget {
  const ThemeLinkMiniContainer({
    super.key,
    required this.color,
    this.height,
  });

  final Color color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
    );
  }
}

class SubHeaderText extends StatelessWidget {
  const SubHeaderText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class RTextButton extends StatelessWidget {
  const RTextButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(label),
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      icon: FaIcon(icon, size: 16),
    );
  }
}

// ignore: must_be_immutable
class RSubContainer extends StatelessWidget {
  RSubContainer({
    super.key,
    required this.label,
    required this.value,
    this.height,
  });

  final String label;
  final String value;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

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
