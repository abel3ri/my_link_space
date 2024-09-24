import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/image_picker_view_model.dart';
import 'package:my_link_space/core/view_models/profile_theme_view_model.dart';
import 'package:my_link_space/ui/widgets/custom_app_bar.dart';
import 'package:my_link_space/ui/widgets/r_button.dart';
import 'package:my_link_space/ui/widgets/r_container.dart';
import 'package:my_link_space/ui/widgets/r_list_tile.dart';
import 'package:my_link_space/ui/widgets/r_modal_bottom_sheet.dart';
import 'package:my_link_space/ui/widgets/r_su_container.dart';
import 'package:my_link_space/ui/widgets/r_sub_header_text.dart';
import 'package:my_link_space/ui/widgets/r_text_button.dart';
import 'package:my_link_space/ui/widgets/r_upgrade_button.dart';
import 'package:my_link_space/ui/widgets/theme_link_container.dart';
import 'package:my_link_space/ui/widgets/theme_link_mini_container.dart';
import 'package:my_link_space/utils/context_extension.dart';
import 'package:my_link_space/utils/utils.dart';
import 'package:provider/provider.dart';

class AppearanceView extends StatelessWidget {
  const AppearanceView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileThemeViewModel = Provider.of<ProfileThemeViewModel>(context);

    final List<String> adItems = [
      context.localizations.hideMyLinkSpaceLogo,
      context.localizations.trackPerformance,
      context.localizations.showcasePerformance,
      context.localizations.connectToGoogle,
    ];
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text(context.localizations.appearance),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ImagePickerViewModel(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: MediaQuery.of(context).size.height * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RSubHeaderText(
                text: context.localizations.profile,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Consumer<ImagePickerViewModel>(
                builder: (context, imagePickerViewModel, child) => RContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundImage:
                                imagePickerViewModel.imagePath != null
                                    ? FileImage(
                                        File(
                                          imagePickerViewModel.imagePath!,
                                        ),
                                      )
                                    : null,
                            child: imagePickerViewModel.imagePath == null
                                ? Text(
                                    "O",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                  )
                                : null,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Expanded(
                            child: Column(
                              children: [
                                RButton(
                                  label: context.localizations.pickAnImage,
                                  onPressed: () {
                                    rShowModalBottomSheet(
                                      context: context,
                                      label: context.localizations.addAnImage,
                                      listTiles: [
                                        RListTile(
                                          title: context
                                              .localizations.chooseFromLibrary,
                                          onPressed: () async {
                                            await imagePickerViewModel
                                                .selectImageFromGallery(
                                              context,
                                            );
                                            GoRouter.of(context).pop();
                                          },
                                          hideTrailing: true,
                                          leadingIcon: FontAwesomeIcons.image,
                                        ),
                                        RListTile(
                                          title: context
                                              .localizations.takeAPicture,
                                          hideTrailing: true,
                                          onPressed: () async {
                                            await imagePickerViewModel
                                                .selectImageFromCamera(context);
                                            GoRouter.of(context).pop();
                                          },
                                          leadingIcon: FontAwesomeIcons.camera,
                                        ),
                                        RListTile(
                                          title: context.localizations.cancel,
                                          hideTrailing: true,
                                          onPressed: () {
                                            GoRouter.of(context).pop();
                                          },
                                          leadingIcon: FontAwesomeIcons.xmark,
                                        ),
                                      ],
                                    );
                                  },
                                  height: 38,
                                ),
                                RButton(
                                  label: context.localizations.cancel,
                                  onPressed: () async {
                                    imagePickerViewModel.clearImage();
                                  },
                                  height: 38,
                                  filled: false,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      RSubContainer(
                        label: context.localizations.profileTitle,
                        value: "@ktmobiledev",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      RSubContainer(
                        label: context.localizations.bio,
                        value: "Bio",
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("0 / 80"),
                      ),
                      Divider(thickness: .4),
                      RTextButton(
                        label: context.localizations.addSocialIcons,
                        onPressed: () {},
                        icon: FontAwesomeIcons.plus,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Stack(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.5,
                    ),
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
                              width: constraints.maxWidth * 0.35,
                              fit: BoxFit.fill,
                              height: constraints.maxHeight,
                              "assets/asset_1.png",
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: constraints.maxHeight * 0.03,
                                  ),
                                  Text(
                                    context.localizations.joinThePremium,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                      height: constraints.maxHeight * 0.02),
                                  Text(
                                    context.localizations.unlockTheseFeatures,
                                    maxLines: 3,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
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
                                              maxLines: 3,
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
                                  SizedBox(
                                    height: constraints.maxHeight * 0.02,
                                  ),
                                  Spacer(),
                                  FilledButton(
                                    onPressed: () {
                                      GoRouter.of(context).pushNamed("upgrade");
                                    },
                                    style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      context.localizations.findOutMore,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: constraints.maxHeight * 0.02),
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
              RSubHeaderText(text: context.localizations.themes),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              profileThemeViewModel.themes.isEmpty
                  ? RContainer(
                      child: Center(
                        child: Text(
                          "No themes to choose from. Default Theme will be Applied",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : RContainer(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1.5,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: profileThemeViewModel.themes.length,
                        itemBuilder: (context, index) {
                          final theme = profileThemeViewModel.themes[index];
                          print(theme.buttonColor);
                          return ThemeLinkContainer(
                            color: Color(colorParser(theme.backgroundValue!))
                                .withOpacity(.5),
                            themeLinkMiniContainers: List.generate(3, (index) {
                              return ThemeLinkMiniContainer(
                                height: 12,
                                color: Color(
                                  colorParser(theme.buttonColor!),
                                ),
                              );
                            }),
                            themeName:
                                profileThemeViewModel.themes[index].name ??
                                    "Theme",
                          );
                        },
                        // children: [
                        // // ThemeLinkContainer(
                        // //   themeName: "Dark",
                        // //   color: Colors.black,
                        // //   themeLinkMiniContainers: [
                        // //     ThemeLinkMiniContainer(
                        // //       color: Colors.white,
                        // //       height: 12,
                        // //     ),
                        // //     SizedBox(height: 8),
                        // //     ThemeLinkMiniContainer(
                        // //       color: Colors.white,
                        // //       height: 12,
                        // //     ),
                        // //     SizedBox(height: 8),
                        // //     ThemeLinkMiniContainer(
                        // //       color: Colors.white,
                        // //       height: 12,
                        // //     ),
                        // //   ],
                        // // ),
                        // ThemeLinkContainer(
                        //   themeName: "Pebble Purple",
                        //   color:
                        //       Theme.of(context).colorScheme.primary.withOpacity(.5),
                        //   themeLinkMiniContainers: [
                        //     ThemeLinkMiniContainer(
                        //       color: Colors.white,
                        //       height: 12,
                        //     ),
                        //     SizedBox(height: 8),
                        //     ThemeLinkMiniContainer(
                        //       color: Colors.white,
                        //       height: 12,
                        //     ),
                        //     SizedBox(height: 8),
                        //     ThemeLinkMiniContainer(
                        //       color: Colors.white,
                        //       height: 12,
                        //     ),
                        //   ],
                        // ),
                        // ThemeLinkContainer(
                        //   themeName: "Pebble Blue",
                        //   color: Colors.blue.withOpacity(.5),
                        //   themeLinkMiniContainers: [
                        //     ThemeLinkMiniContainer(
                        //       color: Colors.white,
                        //       height: 12,
                        //     ),
                        //     SizedBox(height: 8),
                        //     ThemeLinkMiniContainer(
                        //       color: Colors.white,
                        //       height: 12,
                        //     ),
                        //     SizedBox(height: 8),
                        //     ThemeLinkMiniContainer(
                        //       color: Colors.white,
                        //       height: 12,
                        //     ),
                        //   ],
                        // ),
                        // ],
                      ),
                    ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              RSubHeaderText(text: context.localizations.fonts),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
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
                        Text(context.localizations.hideMyLinkSpaceLogo),
                        RUpgradeButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
