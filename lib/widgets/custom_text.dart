import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color colour;
  final Alignment alignment;
  final int? maxLine;
  final double kheight;

  CustomText(
      {this.text = '',
      this.fontSize = 18,
      this.alignment = Alignment.topLeft,
      this.colour = Colors.black,
      this.maxLine,
      this.kheight = 1});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(color: colour, fontSize: fontSize, height: kheight),
        maxLines: maxLine,
      ),
    );
  }
}
