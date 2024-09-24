import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/core/models/error_model.dart';
import 'package:my_link_space/core/view_models/link_view_model.dart';
import 'package:my_link_space/core/view_models/profile_view_model.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/link_container.dart';
import 'package:my_link_space/ui/widgets/r_circle_button.dart';
import 'package:my_link_space/ui/widgets/r_labeld_circular_indicator.dart';
import 'package:my_link_space/utils/context_extension.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewView extends StatelessWidget {
  const PreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final linkViewModel = Provider.of<LinkViewModel>(context);
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
        title: Text(context.localizations.preview),
      ),
      body: ChangeNotifierProvider(
        create: (context) => PreviewViewModel(),
        child: Consumer<PreviewViewModel>(
          builder: (context, previewViewModel, child) {
            if (previewViewModel.isLoading) {
              return const RLabeledCircularIndicator(
                label: "Loading your links",
              );
            }
            // print(previewViewModel.profile.bio);
            return RefreshIndicator(
              onRefresh: () => previewViewModel.getProfile(),
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const Row(
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
                    const CircleAvatar(
                      radius: 36,
                      backgroundImage: AssetImage("assets/asset_1.png"),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "KurazTech",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.005),
                        const Icon(Icons.verified_rounded, size: 16),
                      ],
                    ),
                    const Text("@kuraz_tech"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    SizedBox(
                      height: 32,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        itemBuilder: (context, index) => FaIcon(icons[index]),
                        itemCount: 5,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      context.localizations.thumbnailPreview,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    LinkContainer(
                      onTap: () {},
                      fillColor: Theme.of(context).colorScheme.primary,
                      icon: FontAwesomeIcons.twitch,
                      label: "Join Me on Twitch!",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      context.localizations.sampleLinks,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final link = linkViewModel.links[index];
                        return LinkContainer(
                          onTap: () async {
                            try {
                              final res = await linkViewModel.updateLinkCount(
                                userId: link.userId,
                                linkId: link.id!,
                              );
                              res.fold((l) {
                                l.showError(context);
                              }, (r) {
                                r.showSuccess(context);
                              });

                              await launchUrl(
                                Uri.parse(
                                  linkViewModel.links[index].url,
                                ),
                              );
                            } catch (e) {
                              ErrorModel(body: e.toString()).showError(context);
                            }
                          },
                          fillColor: !isDarkMode
                              ? Colors.white
                              : const Color(0xFF1A1A1A),
                          icon: FontAwesomeIcons.globe,
                          label: linkViewModel.links[index].title,
                        );
                      },
                      itemCount: linkViewModel.links.length,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "MyLinkSpace ",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const FaIcon(FontAwesomeIcons.meteor),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
