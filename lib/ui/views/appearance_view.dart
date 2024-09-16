import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/image_picker_view_model.dart';
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
import 'package:provider/provider.dart';

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
                text: "Profile",
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
                                  label: "Pick an image",
                                  onPressed: () {
                                    rShowModalBottomSheet(
                                      context: context,
                                      label: "Add Profile Image",
                                      listTiles: [
                                        RListTile(
                                          title: "Choose from library",
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
                                          title: "Take a Photo",
                                          hideTrailing: true,
                                          onPressed: () async {
                                            await imagePickerViewModel
                                                .selectImageFromCamera(context);
                                            GoRouter.of(context).pop();
                                          },
                                          leadingIcon: FontAwesomeIcons.camera,
                                        ),
                                        RListTile(
                                          title: "Cancel",
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
                                  label: "Remove",
                                  onPressed: () {
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
                        label: "Profile Title",
                        value: "@ktmobiledev",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
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
                                width:
                                    MediaQuery.of(context).size.width * 0.04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: constraints.maxHeight * 0.03),
                                  Text(
                                    "Join The Premium",
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
                                    "Unlock these features and tons of amazing others.",
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
                                  SizedBox(
                                      height: constraints.maxHeight * 0.02),
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
                                      "Find out more",
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
              RSubHeaderText(text: "Themes"),
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
              RSubHeaderText(text: "Fonts"),
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
                        Text("Hide MyLinkSpace Logo"),
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
