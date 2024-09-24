import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkContainer extends StatelessWidget {
  const LinkContainer({
    super.key,
    required this.fillColor,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Color fillColor;
  final IconData icon;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: fillColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: FaIcon(icon, size: 18, color: Colors.white),
              ),
              const Spacer(),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      // color: Theme.of(context).colorScheme.primary,
                    ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
