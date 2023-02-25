import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_beauty_salon/src/models/service/service_model.dart';

part 'schedule_model.g.dart';

@HiveType(typeId: 1)
class ScheduleModel extends HiveObject{
  @HiveField(0)
  String client;
  @HiveField(1)
  DateTime date;
  @HiveField(2)
  TimeOfDay time;
  @HiveField(3)
  double total;
  @HiveField(4)
  List<ServiceModel> serviceList;

  ScheduleModel({
    required this.client,
    required this.serviceList,
    required this.date,
    required this.time,
    required this.total,
  });
}
