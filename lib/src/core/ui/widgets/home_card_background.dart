import 'package:flutter/material.dart';

class HomeCardBackground extends StatelessWidget {
  final Widget child;
  final double? height;
  final double width;
  const HomeCardBackground({
    super.key,
    this.height,
    this.width = double.infinity,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12),
        child: child);
  }
}
