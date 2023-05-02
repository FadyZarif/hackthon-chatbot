import 'package:flutter/material.dart';

class HomeWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => Category(context),
            itemCount: 4,
          ),
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemBuilder: (context, index) => Category(context),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}

Widget Category(context) => Container(
      height: 100,
      width: 50,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Colors.blueGrey.withOpacity(0.23))
          ]),
      child: Text(
        'kkkkkk',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
