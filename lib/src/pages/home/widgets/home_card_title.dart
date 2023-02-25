import 'package:flutter/material.dart';

class HomeCardTitle extends StatelessWidget {
  final String title;
  final Widget action;

  const HomeCardTitle({Key? key, required this.title, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        action,
      ],
    );
  }
}
