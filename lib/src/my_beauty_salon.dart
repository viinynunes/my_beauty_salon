import 'package:flutter/material.dart';
import 'package:my_beauty_salon/src/core/provider/application_binding.dart';
import 'package:my_beauty_salon/src/core/themes/themes.dart';
import 'package:my_beauty_salon/src/pages/client/router/client_router.dart';
import 'package:my_beauty_salon/src/pages/home/home_page.dart';
import 'package:my_beauty_salon/src/pages/schedule/schedule_router.dart';


class MyBeautySalon extends StatelessWidget {
  const MyBeautySalon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: {
          '/': (context) => ClientRouter.clientList,
          '/schedule': (context) => ScheduleRouter.page,
          '/client': (context) => ClientRouter.clientList,
          '/client/registration': (context) => ClientRouter.clientRegistration
        },
      ),
    );
  }
}
