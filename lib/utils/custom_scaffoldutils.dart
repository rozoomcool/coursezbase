import 'package:flutter/material.dart';

class CustomScaffoldUtils {
  CustomScaffoldUtils() {
    _key = GlobalKey<ScaffoldMessengerState>();
  }

  late final GlobalKey<ScaffoldMessengerState> _key;

  GlobalKey<ScaffoldMessengerState> get key => _key;

  void showSnack(text) {
    _key.currentState?.removeCurrentSnackBar();
    _key.currentState?.showSnackBar(
        SnackBar(behavior: SnackBarBehavior.floating, content: Text(text), backgroundColor: Colors.white,));
  }

  void showErrorSnack(text) {
    _key.currentState?.removeCurrentSnackBar();
    _key.currentState?.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          style: const TextStyle(color: Colors.redAccent),
        )));
  }
}
