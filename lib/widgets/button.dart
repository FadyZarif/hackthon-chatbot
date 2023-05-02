import 'dart:ui';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final BuildContext context;
  final String string;
  final double width;
  final VoidCallback voidCallback;
  const Button({Key? key, required this.context, required this.string, required this.width, required this.voidCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: TextStyle(color: Colors.white.withOpacity(.9)),
            ),
          ),
        ),
      ),
    );
  }
}
