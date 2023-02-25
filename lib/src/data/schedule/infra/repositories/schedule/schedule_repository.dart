import '../../../../../models/schedule/schedule_model.dart';

abstract class ScheduleRepository {
  Future saveSchedule({required ScheduleModel schedule});
}
