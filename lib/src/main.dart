import 'package:flutter/widgets.dart';
import 'package:my_beauty_salon/src/my_beauty_salon.dart';

import 'core/configuration/hive/hive_configuration.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfiguration().config();

  runApp(const MyBeautySalon());
}
