import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({super.key, required this.child});

 @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HiveInterface>(create: (context) => Hive)
      ],
      child: child,
    );
  }
}
