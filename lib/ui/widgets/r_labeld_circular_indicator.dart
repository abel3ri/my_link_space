import 'package:flutter/material.dart';

class RLabeledCircularIndicator extends StatelessWidget {
  const RLabeledCircularIndicator({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 7,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
