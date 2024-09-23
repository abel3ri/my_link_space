import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/link_view_model.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/main_link_container.dart';
import 'package:my_link_space/ui/widgets/r_button.dart';
import 'package:my_link_space/utils/context_extension.dart';
import 'package:provider/provider.dart';

class LinksView extends StatelessWidget {
  const LinksView({super.key});

  @override
  Widget build(BuildContext context) {
    final linkViewModel = Provider.of<LinkViewModel>(context);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text(context.localizations.links),
        showBottom: linkViewModel.isLoading,
      ),
      body: RefreshIndicator(
        onRefresh: () => linkViewModel.getAllLinks(userId: 1),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
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
                if (linkViewModel.links.isEmpty) ...[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  Center(
                    child: Text(
                      "You don't have any links yet.",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Center(
                    child: Text(
                      "Try adding one!",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
                if (linkViewModel.links.isNotEmpty)
                  ReorderableListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final link = linkViewModel.links[index];
                      return MainLinkContainer(
                        key: ValueKey("$index"),
                        index: index,
                        title: link.title,
                        url: link.url,
                        isActive: link.isActive,
                        onSwitchToggle: (value) async {
                          final res = await linkViewModel.updateLinkActiveState(
                            link: link,
                            switchState: value,
                          );
                          res.fold((l) {
                            l.showError(context);
                          }, (r) {
                            r.showSuccess(context);
                          });
                        },
                        subTitleIcons: [
                          FontAwesomeIcons.image,
                          FontAwesomeIcons.headphones,
                          FontAwesomeIcons.lock,
                        ],
                      );
                    },
                    itemCount: linkViewModel.links.length,
                    onReorder: linkViewModel.onReorder,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
