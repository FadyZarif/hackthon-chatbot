import 'package:flutter/material.dart';

import '../const/const.dart';
import '../constants.dart';
import '../homeScreenpet.dart';
import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      automaticallyImplyLeading: true,
      title: Row(
        children: [
          BackButton(
            onPressed: () {
              navigateToReplacement(context, HomeScreenpet());
            },
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " خدمات الرخص",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "نشط منذ 3 د",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
