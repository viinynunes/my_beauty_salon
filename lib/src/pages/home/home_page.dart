import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_beauty_salon/src/pages/home/widgets/daily_report_card.dart';
import 'package:my_beauty_salon/src/pages/home/widgets/home_card_title.dart';
import 'package:my_beauty_salon/src/pages/home/widgets/most_services.dart';

import 'widgets/next_client_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final size = MediaQuery.of(context).size;

    final dateFormat = DateFormat('dd/MM/yyyy');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed('/schedule');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Column(
                children: [
                  const Text('Home Page'),
                  SizedBox(
                    height: size.height * .05,
                    width: size.width,
                    child: AutoSizeText(
                      'Bem vindo de volta, Dono.name',
                      minFontSize: 10,
                      style: textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
              ),
              pinned: false,
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeCardTitle(
                    title: 'Relatório do seu dia',
                    action: Text(
                      dateFormat.format(DateTime.now()),
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DailyReportCard(
                    height: size.height * 0.25,
                    total: 10,
                    finished: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const HomeCardTitle(
                    title: 'Próximos Clientes Agendados',
                    action: Icon(Icons.schedule),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: size.height * .15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        return NextClientTile(
                          name: 'Nunes',
                          jobDescription: 'Corte de Cabelo',
                          schedule: DateTime.now().add(Duration(hours: index)),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: const [
                    HomeCardTitle(
                      title: 'Serviços mais pedidos',
                      action: Icon(Icons.work_outline),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MostServices(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
