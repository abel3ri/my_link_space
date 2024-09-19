import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:my_link_space/ui/shared/components/button.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';

class CardTile extends StatefulWidget {
  const CardTile({super.key});

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  bool onChanged = true; // toggle state
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 2.0,
        shadowColor: kbackground1,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Text(
                      'Enter the URL of an album or song and we\'ll show your visitors everywhere they can listen to it',
                      style: CustomTextStyles.B12,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
