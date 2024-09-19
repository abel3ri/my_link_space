import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:my_link_space/ui/shared/components/button.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';

class Links extends StatefulWidget {
  Links({super.key});

  @override
  State<Links> createState() => _LinksState();
}

class _LinksState extends State<Links> {
  bool onChanged = true;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kfield_back,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Links',
                  style: CustomTextStyles.title1,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 120,
                          height: 36,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.2)),
                            color: Color.fromARGB(255, 202, 201, 201),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Upgrade',
                                style: CustomTextStyles.B2,
                              ),
                              const Icon(
                                Icons.flash_on_sharp,
                                color: Color.fromARGB(255, 182, 174, 174),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.share_outlined,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          MAterialBtn(
            width: 380,
            onTap: () {},
            ttile: "Add New Link",
            height: 55,
            colors: kbutton_finall1,
          ),
          const SizedBox(height: 20),
          Column(
              children: List.generate(2, (index) {
            return Card(
              elevation: 2.0,
              shadowColor: kbackground1,
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: CustomTextStyles.B12,
                    ),
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        hintText: 'Enter title',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'URL',
                      style: CustomTextStyles.B12,
                    ),
                    TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                        hintText: 'Enter URL',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        fillColor: khint,
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: 280,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 214, 192, 159),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Enter the URL of an album or song and we\'ll show your visitors everywhere they can listen to it',
                              style: CustomTextStyles.B1,
                            ),
                          ),
                        ),
                        GFToggle(
                          onChanged: (value) {
                            setState(() {
                              // onChanged = value;
                            });
                          },
                          value: onChanged,
                          type: GFToggleType.custom,
                          // boxShape: ,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
