import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppSnackbar {
  static showSnackbar(BuildContext context, {String message = "Success"}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("logged in"),
      duration: Duration(seconds: 2),
    ));
  }
  static showErrorToast(String message, bool _isSuccess) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: _isSuccess ? Colors.green : Colors.red,
        fontSize: 20);
  }
}
