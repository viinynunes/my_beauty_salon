import 'package:flutter/material.dart';

import '../../../core/ui/widgets/home_card_background.dart';

class MostServices extends StatelessWidget {
  const MostServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final size = MediaQuery.of(context).size;
    return HomeCardBackground(
      height: size.height * .25,
      child: ListView.builder(
        padding: const EdgeInsets.all(1),
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Corte de Cabelo', style: textTheme.titleMedium),
                Text('1', style: textTheme.titleMedium),
              ],
            ),
          );
        },
      ),
    );
  }
}
