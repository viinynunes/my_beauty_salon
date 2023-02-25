import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_beauty_salon/src/pages/schedule/controllers/schedule_registration_controller.dart';

import 'controllers/schedule_states.dart';
import 'widgets/service_selector_widget.dart';

class ScheduleRegistrationPage extends StatefulWidget {
  final bool? newSchedule;

  const ScheduleRegistrationPage({Key? key, this.newSchedule})
      : super(key: key);

  @override
  State<ScheduleRegistrationPage> createState() =>
      _ScheduleRegistrationPageState();
}

class _ScheduleRegistrationPageState extends State<ScheduleRegistrationPage> {
  int numberOfServices = 1;
  final clientEC = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ScheduleRegistrationController>();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final size = MediaQuery.of(context).size;

    final dateFormat = DateFormat('dd/MM/yyyy');

    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.newSchedule != null ? 'Novo Agendamento' : 'Alterar'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cliente',
                      style: textTheme.titleMedium,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Digite o nome do cliente',
                              hintStyle: textTheme.bodySmall,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Serviço',
                      style: textTheme.titleMedium,
                    ),
                    Column(
                      children: [
                        ServiceSelectorWidget(
                          icon: Icons.add,
                          onIconPressed: () {
                            numberOfServices++;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Selecione a data',
                              style: textTheme.titleMedium,
                            ),
                            TextButton(
                              onPressed: () async {
                                final result = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(3000),
                                );

                                if (result != null) {
                                  controller.selectScheduleDate(result);
                                }
                              },
                              child: BlocSelector<
                                  ScheduleRegistrationController,
                                  ScheduleState,
                                  DateTime?>(
                                selector: (state) => state.selectedScheduleDate,
                                builder: (context, selectedScheduleDate) {
                                  return Text(
                                    selectedScheduleDate != null
                                        ? dateFormat
                                            .format(selectedScheduleDate)
                                        : 'Selecione a data',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Selecione o horário',
                              style: textTheme.titleMedium,
                            ),
                            TextButton(
                              onPressed: () async {
                                final result = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );

                                if (result != null) {
                                  controller.selectScheduleTime(result);
                                }
                              },
                              child: BlocSelector<
                                  ScheduleRegistrationController,
                                  ScheduleState,
                                  TimeOfDay?>(
                                selector: (state) => state.selectedScheduleTime,
                                builder: (context, selectedScheduleTime) {
                                  return Text(
                                    selectedScheduleTime != null
                                        ? selectedScheduleTime.format(context)
                                        : 'Selecione a data',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: size.width * .9,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Salvar'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
