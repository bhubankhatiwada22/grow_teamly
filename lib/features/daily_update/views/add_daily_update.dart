import 'dart:developer';

import 'package:flutter/material.dart';

class AddDailyUpdateView extends StatefulWidget {
  const AddDailyUpdateView({Key? key}) : super(key: key);

  @override
  State<AddDailyUpdateView> createState() => _AddDailyUpdateViewState();
}

class _AddDailyUpdateViewState extends State<AddDailyUpdateView> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddDailyUpdateView"),
      ),
      body: Column(children: [
        TextFormField(
          controller: _dateController,
          decoration: InputDecoration(
          
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _titleController,
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _descriptionController,
        ),
        ElevatedButton(
          onPressed: () {
            log(_dateController.text +
                _titleController.text +
                _descriptionController.text);
          },
          child: Text("add"),
        )
      ]),
    );
  }
}
