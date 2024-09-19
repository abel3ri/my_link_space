import 'package:flutter/material.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';

class RTextField extends StatelessWidget {
  const RTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.validator,
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor:
            isDarkMode ? textFieldFillColorDark : textFieldFillColorLight,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            // color: Colors.grey.shade500,
            ),
      ),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
