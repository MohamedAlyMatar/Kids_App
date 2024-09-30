import 'package:flutter/material.dart';
import 'package:kids_app/src/features/Game_Two/data/models/item_model.dart';

class InitGame {
  List<ItemModel> call() {
    return [
      ItemModel(name: "Donut", icon: Icons.donut_large, value: 'Donut'),
      ItemModel(name: "Car", icon: Icons.car_crash, value: 'Car'),
      ItemModel(name: "Water", icon: Icons.water, value: 'Water'),
      ItemModel(name: "Home", icon: Icons.home, value: 'Home'),
    ]..shuffle();
  }
}
