import 'package:flutter/material.dart';

class ItemModel {
  final String name;
  final int value;
  bool matched;
  final IconData icon;
  bool accepting;

  ItemModel(
      {required this.name,
      required this.value,
      required this.icon,
      this.matched = false,
      this.accepting = false});
}
