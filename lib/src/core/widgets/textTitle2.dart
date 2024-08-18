import 'package:flutter/material.dart';

class TextTitle2 extends StatelessWidget {
  String textSubTitle;

  TextTitle2({required this.textSubTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textSubTitle,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}
