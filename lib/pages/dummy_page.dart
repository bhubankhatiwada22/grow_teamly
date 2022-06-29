import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktaktoe/image_constants.dart';
import 'package:tiktaktoe/models/dummy_page_model.dart';

class DummyPage extends StatefulWidget {
  final DummyPageModel data;
  const DummyPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.data.age}"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "leaf",
              style: TextStyle(),
            ),
            Center(
                child: SvgPicture.asset(
              ImageConstants.leaf,
              height: 500,
            )),
          ],
        ),
      ),
    );
  }
}
