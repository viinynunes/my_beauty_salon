import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/widgets/home_card_background.dart';

class NextClientTile extends StatelessWidget {
  final String name;
  final String jobDescription;
  final DateTime schedule;

  const NextClientTile(
      {Key? key,
      required this.name,
      required this.jobDescription,
      required this.schedule})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final size = MediaQuery.of(context).size;
    final textTheme = theme.textTheme;
    final hourFormat = DateFormat('HH:mm');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: HomeCardBackground(
        width: size.width * .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                name,
                style:
                    textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(child: Text(jobDescription)),
            Flexible(
              child: Text(
                hourFormat.format(schedule),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
