import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_beauty_salon/src/core/ui/mixins/loader.dart';
import 'package:provider/provider.dart';

abstract class BaseState<P extends StatefulWidget, C extends BlocBase>
    extends State<P> with Loader {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
