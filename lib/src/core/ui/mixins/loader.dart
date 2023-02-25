import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<P extends StatefulWidget> on State<P> {
  bool opened = false;

  void showLoader() {
    if (!opened) {
      opened = true;
      showDialog(
        context: context,
        builder: (_) => Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
              color: Theme.of(context).colorScheme.primary, size: 60),
        ),
      );
    }
  }

  void closeLoader() {
    if (opened) {
      opened = false;
      Navigator.pop(context);
    }
  }
}
