import 'package:hive/hive.dart';

part 'client_model.g.dart';

@HiveType(typeId: 0)
class ClientModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? phone2;

  ClientModel({
    required this.name,
    this.id,
    this.phone,
    this.phone2,
  });
}
