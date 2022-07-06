import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktaktoe/helpers/image_picker_helper/image_picker.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Attendance"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                    builder: (context) {
                      return SizedBox(
                        // height: 220,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: (() async {
                                ImagePickerHelper()
                                    .pickImage(ImageSource.camera);
                              }),
                              leading: const Icon(Icons.camera),
                              title: const Text("Camera"),
                            ),
                            ListTile(
                              onTap: () async {
                                ImagePickerHelper()
                                    .pickImage(ImageSource.gallery);
                              },
                              leading: const Icon(Icons.browse_gallery),
                              title: const Text("Gallary"),
                            )
                          ],
                        ),
                      );
                    });
              },
              child: const Text("Pick an image"),
            ),
          ],
        ));
  }
}
