import 'package:flutter/material.dart';

class Mytext extends StatelessWidget {
  String text;
  Color textColor;
  double textSize;
  Mytext({required this.text, required this.textColor, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: textSize),
    );
  }
}
