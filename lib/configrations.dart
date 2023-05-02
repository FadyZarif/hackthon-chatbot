import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey.shade500, blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'images/horse.png'}
];

List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.home, 'title': 'الصفحة الرئيسية'},
  {'icon': Icons.mail, 'title': 'محادثات'},
  {'icon': Icons.favorite, 'title': 'مفضلات'},
  {'icon': FontAwesomeIcons.userAlt, 'title': 'صفحة شخصية'},
];
