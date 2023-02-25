import 'package:my_beauty_salon/src/models/schedule/schedule_model.dart';

abstract class ScheduleRepository {
  ScheduleModel save(ScheduleModel schedule);
}
