import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';

class MainLinkContainer extends StatelessWidget {
  const MainLinkContainer({
    super.key,
    required this.title,
    required this.index,
    this.onSwitchToggle,
    this.subTitleIcons = const [],
    required this.url,
    required this.isActive,
  });

  final String title;
  final String url;
  final bool isActive;
  final List<IconData> subTitleIcons;
  final int index;
  final Function(bool value)? onSwitchToggle;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDarkMode
            ? isActive
                ? cardDarkBackgroundColor
                : const Color.fromARGB(255, 94, 94, 94)
            : isActive
                ? cardLightBackgroundColor
                : const Color.fromARGB(255, 198, 198, 198),
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        leading: ReorderableDragStartListener(
          index: index,
          child: const FaIcon(FontAwesomeIcons.gripVertical),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(url),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SizedBox(
              height: 36,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FaIcon(
                    subTitleIcons[index],
                    size: 20,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  );
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
        trailing: Transform.scale(
          scale: .8,
          child: Switch(
            value: isActive,
            onChanged: onSwitchToggle,
          ),
        ),
      ),
    );
  }
}
