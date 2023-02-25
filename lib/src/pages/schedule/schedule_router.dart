import 'package:flutter/material.dart';
import 'package:my_beauty_salon/src/pages/schedule/controllers/schedule_registration_controller.dart';
import 'package:provider/provider.dart';

import 'schedule_registration_page.dart';

class ScheduleRouter {
  ScheduleRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ScheduleRegistrationController(),
          ),
        ],
        child: const ScheduleRegistrationPage(newSchedule: false),
      );
}
