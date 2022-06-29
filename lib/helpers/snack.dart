import 'package:flutter/material.dart';

class AppSnackbar {
  static showSnackbar(BuildContext context, {String message = "Success"}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("logged in"),
      duration: Duration(seconds: 2),
    ));
  }
}
