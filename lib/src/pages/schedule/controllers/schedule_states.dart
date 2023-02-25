// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ScheduleStatus { initial, refresh, loading, success, error }

class ScheduleState extends Equatable {
  final ScheduleStatus status;
  final DateTime? selectedScheduleDate;
  final TimeOfDay? selectedScheduleTime;
  
  const ScheduleState({
    required this.status,
    required this.selectedScheduleDate,
    required this.selectedScheduleTime,
  });

  const ScheduleState.initial()
      : status = ScheduleStatus.initial,
        selectedScheduleDate = null,
        selectedScheduleTime = null;

  @override
  List<Object?> get props =>
      [status, selectedScheduleDate, selectedScheduleTime];

  ScheduleState copyWith({
    ScheduleStatus? status,
    DateTime? selectedScheduleDate,
    TimeOfDay? selectedScheduleTime,
  }) {
    return ScheduleState(
      status: status ?? this.status,
      selectedScheduleDate: selectedScheduleDate ?? this.selectedScheduleDate,
      selectedScheduleTime: selectedScheduleTime ?? this.selectedScheduleTime,
    );
  }
}
