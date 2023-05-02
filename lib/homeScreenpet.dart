import 'package:competition/tabs/civil_tab.dart';
import 'package:competition/tabs/education_tab.dart';
import 'package:competition/tabs/travel_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'my_tabs.dart';

class HomeScreenpet extends StatefulWidget {
  @override
  _HomeScreenpetState createState() => _HomeScreenpetState();
}

class _HomeScreenpetState extends State<HomeScreenpet> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  List<Widget> mytabs = [
    MyTab(text: ' خدمات المرور'),
    MyTab(text: 'خدمات القطارات'),
    MyTab(text: ' خدمات الاتصالات'),

  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: DefaultTabController(
        length: mytabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            leading: isDrawerOpen
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    },
                  )
                : IconButton(
                    icon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        'assets/icons/menu.svg',
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        xOffset = -70;
                        yOffset = 170;
                        scaleFactor = 0.6;
                        isDrawerOpen = true;
                      });
                    }),
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 12 * 2.5),
                      height: size.height * 0.2,
                      child: Stack(
                        children: [
                          Container(
                            height: size.height * 0.2 - 27,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(36),
                                    bottomRight: Radius.circular(36)),
                                color: Colors.blueGrey),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Center(
                                  child: Text(
                                    'مرحبا بك...',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 50,
                                          color:
                                              Colors.blueGrey.withOpacity(0.23))
                                    ]),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        onChanged: (value) {},
                                        decoration: InputDecoration(
                                            hintText: 'ابحث عن خدمة',
                                            hintStyle: TextStyle(
                                                color: Colors.blueGrey
                                                    .withOpacity(0.5)),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/search.svg',
                                      color: Colors.blueGrey,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                  indicatorWeight: 2,
                  indicatorColor: Colors.blueGrey,
                  physics: BouncingScrollPhysics(),
                  tabs: mytabs),
              Expanded(
                child: TabBarView(children: [
                  CivilTab(),
                  TravelTab(),
                  EducationTab(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
