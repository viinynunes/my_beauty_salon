import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_beauty_salon/src/pages/schedule/controllers/schedule_states.dart';

class ScheduleRegistrationController extends Cubit<ScheduleState> {
  ScheduleRegistrationController() : super(const ScheduleState.initial());

  void selectScheduleDate(DateTime selectedScheduleDate) {
    emit(
      state.copyWith(
          status: ScheduleStatus.refresh,
          selectedScheduleDate: selectedScheduleDate),
    );
  }

  void selectScheduleTime(TimeOfDay selectedScheduleTime) {
    emit(
      state.copyWith(
          status: ScheduleStatus.refresh,
          selectedScheduleTime: selectedScheduleTime),
    );
  }

  void saveSchedule(){}
}
