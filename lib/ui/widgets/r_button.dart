import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RButton extends StatelessWidget {
  RButton({
    super.key,
    required this.label,
    this.height = 52,
    required this.onPressed,
    this.filled = true,
    this.fillColor,
    this.borderColor,
  });

  final String label;
  double height;
  final Function()? onPressed;
  Color? fillColor;
  Color? borderColor;
  bool filled;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: !filled
            ? WidgetStatePropertyAll(Colors.transparent)
            : fillColor != null
                ? WidgetStatePropertyAll(fillColor)
                : WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
        side: !filled
            ? WidgetStatePropertyAll(
                BorderSide(
                  color: borderColor != null
                      ? borderColor!
                      : Theme.of(context).scaffoldBackgroundColor,
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
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
