import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_beauty_salon/src/models/client/client_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfiguration {
  Future config() async {
    final dir = await getApplicationDocumentsDirectory();

    await Hive.initFlutter(dir.path);

    Hive.registerAdapter(ClientModelAdapter());
  }
}
