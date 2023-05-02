import 'package:flutter/material.dart';

import '../const/const.dart';
import '../donut_tile.dart';
import '../screens/chat_screen/chat_screen.dart';
import '../screens/chat_screen/chat_travel_screen.dart';

class TravelTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List travelList = [
// <<<<<<< Updated upstream
//       'استعلام عن رصيد',
//       'تجديد باقة',
//     ];
//     return Column(
//       children: [
// =======
//       'حجز تذكرة قطار',
//       'استبدال تذكرة',
//     ];
    'استعلام عن رحلات',
    'حجز رحلات',
    ];


    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.blueGrey[200],
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Text('خدمات متعلقة بالقطارات '),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemCount: travelList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    navigateTo(context, ChatTravelScreen(serviceID: 'DbjE4TSwzGYF9gsRO9phv7ZOx3s1'));
                  },
                  child: DonutTile(
                    donutFlavour: travelList[index],
                  ),
                );
              }),
        )
      ],
    );
  }
}
