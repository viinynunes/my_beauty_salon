import 'package:flutter/material.dart';
import 'package:my_beauty_salon/src/core/ui/widgets/home_card_background.dart';

class DailyReportCard extends StatelessWidget {
  final double height;

  final int total;
  final int finished;

  const DailyReportCard(
      {Key? key,
      this.height = 150,
      required this.total,
      required this.finished})
      : super(key: key);

  double getProgress(int total, int finished) {
    return (total / finished) / 10;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final progress = getProgress(total, finished);

    final left = total - finished;

    return HomeCardBackground(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total de Agendamentos',
                  style: textTheme.titleMedium,
                ),
                Text(
                  total.toString(),
                  style: textTheme.titleMedium
                      ?.copyWith(color: theme.colorScheme.primary),
                )
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Agendamentos Restantes',
                  style: textTheme.titleMedium,
                ),
                Text(left.toString(), style: textTheme.titleMedium)
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Serviços Finalizados',
                  style: textTheme.titleMedium,
                ),
                Text(finished.toString(), style: textTheme.titleMedium)
              ],
            ),
          ),
          Flexible(
            child: LinearProgressIndicator(
              value: progress,
            ),
          ),
          Flexible(
            child: Text(
              '${(progress * 100).toStringAsFixed(0)} %',
              style: textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
