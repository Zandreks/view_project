import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();

class GlobalSnackBar {
  static info(String message) {
    snackBarKey.currentState?.showSnackBar(SnackBar(content: Text(message)));
  }

  static error(String message) {
    snackBarKey.currentState?.showSnackBar(
        SnackBar(backgroundColor: Colors.redAccent, content: Text(message)));
  }

  static warning(String message) {
    snackBarKey.currentState?.showSnackBar(
        SnackBar(backgroundColor: Colors.orange, content: Text(message)));
  }
}
