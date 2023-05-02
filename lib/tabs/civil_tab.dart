import 'package:competition/screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';
import '../donut_tile.dart';

class CivilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List civilList = [
      'استعلام عن مخالفات',
      'خدمات نيابات المرور',
    ];
    return Column(
      children: [
        SizedBox(
          height: 70,
        ),
        Expanded(
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemCount: civilList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    navigateTo(context, ChatDetailsScreen(serviceID: 'v07COa4kjYSVRyFsanTNM0kPrcq2'));
                  },
                  child: DonutTile(
                    donutFlavour: civilList[index],
                  ),
                );
              }),
        )
      ],
    );
  }
}
