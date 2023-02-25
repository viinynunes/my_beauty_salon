// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleModelAdapter extends TypeAdapter<ScheduleModel> {
  @override
  final int typeId = 1;

  @override
  ScheduleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleModel(
      client: fields[0] as String,
      serviceList: (fields[4] as List).cast<ServiceModel>(),
      date: fields[1] as DateTime,
      time: fields[2] as TimeOfDay,
      total: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.client)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.serviceList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
