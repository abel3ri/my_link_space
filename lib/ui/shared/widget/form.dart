import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.isobsecuretext = false,
    this.sfx_icon = const Icon(Icons.visibility_outlined),
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isobsecuretext;
  final Widget sfx_icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: validator,
        // maxLength: 20,

        enabled: true,
        obscuringCharacter: '*',
        obscureText: isobsecuretext,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            focusColor: kbackground1,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 5,
                color: kfield_back,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: kbutton_finall1,
                ))),
        style: GoogleFonts.inclusiveSans(color: kbackground1),
      ),
    );
  }
}
