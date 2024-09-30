import 'package:flutter/material.dart';

class ItemModel {
  final String name;
  final String value;
  final IconData icon;
  bool accepting;
  bool matched;

  ItemModel({
    required this.name,
    required this.value,
    required this.icon,
    this.accepting = false,
    this.matched = false,
  });
}
