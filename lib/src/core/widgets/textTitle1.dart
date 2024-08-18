import 'package:flutter/material.dart';

class TextTitle1 extends StatelessWidget {
  String textTitle;

  TextTitle1({required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textTitle,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
