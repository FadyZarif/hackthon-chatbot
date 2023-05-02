import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String text;

  MyTab({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 50,
      width: 250,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.blueGrey, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        // color: Colors.grey[100],

        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
