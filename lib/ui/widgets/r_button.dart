import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RButton extends StatelessWidget {
  RButton({
    super.key,
    required this.label,
    this.height = 52,
    required this.onPressed,
    this.filled = true,
  });

  final String label;
  double height;
  final Function()? onPressed;
  bool filled;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor:
            !filled ? const WidgetStatePropertyAll(Colors.transparent) : null,
        side: !filled
            ? WidgetStatePropertyAll(
                BorderSide(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              )
            : null,
        minimumSize: WidgetStatePropertyAll(
          Size(
            MediaQuery.of(context).size.width * 0.9,
            height,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: filled ? Colors.white : null,
            ),
      ),
    );
  }
}
