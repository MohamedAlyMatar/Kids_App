import 'package:flutter/material.dart';

class TextDesc extends StatelessWidget {
  String textDesc;

  TextDesc({required this.textDesc});

  @override
  Widget build(BuildContext context) {
    return Text(
      textDesc,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }
}
