import 'package:flutter/material.dart';

rShowModalBottomSheet({
  required BuildContext context,
  required String label,
  required List<Widget> listTiles,
}) {
  showModalBottomSheet(
    enableDrag: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ...listTiles
        ],
      ),
    ),
  );
}
