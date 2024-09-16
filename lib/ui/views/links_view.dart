import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/link_view_model.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/r_button.dart';
import 'package:my_link_space/utils/context_extension.dart';
import 'package:provider/provider.dart';

class LinksView extends StatelessWidget {
  const LinksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text(context.localizations.links),
      ),
      body: ChangeNotifierProvider(
        create: (context) => LinkViewModel(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: RButton(
                  label: context.localizations.addNewLink,
                  onPressed: () {
                    GoRouter.of(context).pushNamed("addNewLink");
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Consumer<LinkViewModel>(
                builder: (context, linkViewModel, child) =>
                    ReorderableListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LinkContainer(
                      key: ValueKey("$index"),
                      index: index,
                      title: "Kuraz Tech",
                      url: "kuraztech.com",
                      onSwitchToggle: (value) {},
                      subTitleIcons: [
                        FontAwesomeIcons.image,
                        FontAwesomeIcons.headphones,
                        FontAwesomeIcons.lock,
                      ],
                    );
                  },
                  itemCount: 3,
                  onReorder: linkViewModel.onReorder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinkContainer extends StatelessWidget {
  const LinkContainer({
    super.key,
    required this.title,
    required this.index,
    this.onSwitchToggle,
    this.subTitleIcons = const [],
    required this.url,
  });

  final String title;
  final String url;
  final List<IconData> subTitleIcons;
  final int index;
  final Function(bool value)? onSwitchToggle;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDarkMode ? cardDarkBackgroundColor : cardLightBackgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        leading: ReorderableDragStartListener(
          index: index,
          child: FaIcon(FontAwesomeIcons.gripVertical),
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
                physics: NeverScrollableScrollPhysics(),
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
            value: true,
            onChanged: onSwitchToggle,
          ),
        ),
      ),
    );
  }
}
