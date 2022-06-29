import 'package:flutter/material.dart';

Future<bool> getconformationDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("do you want to log out "),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("yes"),
              ),
            ],
          ),
        );
      }).then((value) => value ?? false);
}
