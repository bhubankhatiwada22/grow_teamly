import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final String count;
  final Color? containerColor;
  const DashboardCard(
      {Key? key,
      required this.icon,
      required this.count,
      required this.title,
      this.containerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(title),
          Text(count),
        ],
      ),

      padding: EdgeInsets.all(10.5),
      decoration: BoxDecoration(
        color: containerColor != null ? containerColor : Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 100,
      width: size.width * 0.45,
      // color: Colors.amber,
    );
  }
}
