import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';

class PreviewView extends StatelessWidget {
  const PreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final icons = [
      FontAwesomeIcons.envelope,
      FontAwesomeIcons.twitter,
      FontAwesomeIcons.instagram,
      FontAwesomeIcons.youtube,
      FontAwesomeIcons.headphones,
    ];
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text("Preview"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RCircleButton(
                  icon: FontAwesomeIcons.ellipsis,
                ),
                RCircleButton(
                  icon: FontAwesomeIcons.bell,
                ),
              ],
            ),
            CircleAvatar(
              radius: 36,
              backgroundImage: AssetImage("assets/asset_1.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "KurazTech",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.005),
                Icon(Icons.verified_rounded, size: 16),
              ],
            ),
            Text("@kuraz_tech"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(
              height: 32,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                itemBuilder: (context, index) => FaIcon(icons[index]),
                itemCount: 5,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              "Thumbnail Preview",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            LinkContainer(
              fillColor: Colors.redAccent,
              icon: FontAwesomeIcons.twitch,
              label: "Join Me on Twitch!",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              "Sample Links",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return LinkContainer(
                  fillColor:
                      !isDarkMode ? Colors.grey.shade400 : Colors.grey.shade700,
                  icon: FontAwesomeIcons.youtube,
                  label: "kuraztech.com",
                );
              },
              itemCount: 4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MyLinkSpace ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                FaIcon(FontAwesomeIcons.meteor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LinkContainer extends StatelessWidget {
  const LinkContainer({
    super.key,
    required this.fillColor,
    required this.icon,
    required this.label,
  });

  final Color fillColor;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: fillColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: FaIcon(icon),
          ),
          Spacer(),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class RCircleButton extends StatelessWidget {
  const RCircleButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          CircleBorder(
            side: BorderSide(
              width: .5,
            ),
          ),
        ),
      ),
      onPressed: () {},
      icon: FaIcon(icon, size: 20),
    );
  }
}
