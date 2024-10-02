import 'package:flutter/material.dart';
import 'package:kids_app/src/features/Game_Two/data/models/item_model.dart';
import 'package:kids_app/src/features/Game_Two/domain/repositories/game_two_repo.dart';

class GameTwoRepoImpl implements GameTwoRepo {
  List<ItemModel> items = [];
  List<ItemModel> items2 = [];
  int timerCount = 30;
  int currentTrial = 1;
  int score = 0;
  int mistakes = 0;
  late bool gameOver = false;
  late bool shake = false;

  @override
  Future<void> initGame() async {
    // Reset the game state
    score = 0;
    gameOver = false;

    items = [
      ItemModel(name: "Donut", icon: Icons.donut_large, value: 'Donut'),
      ItemModel(name: "Car", icon: Icons.car_crash, value: 'Car'),
      ItemModel(name: "Water", icon: Icons.water, value: 'Water'),
      ItemModel(name: "Home", icon: Icons.home, value: 'Home'),
    ];

    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  void retryTrials() {
    initGame();
    currentTrial = 1;
  }

  @override
  void updateScore(bool isCorrect) {
    if (isCorrect) {
      score += 10;
    } else {
      score -= 5;
      mistakes += 1;
      shake = true;
      Future.delayed(const Duration(milliseconds: 500), () {
        shake = false;
      });
    }
    if (items.isEmpty) gameOver = true;
  }

  @override
  Future<void> saveUserResponses() async {
    for (var item in items2) {
      if (item.matched) {
        print("User matched ${item.name} correctly.");
      } else {
        print("User did not match ${item.name}.");
      }
    }
  }

  @override
  int getCurrentTrial() {
    return currentTrial; // Return the actual currentTrial
  }

  @override
  int getScore() {
    return score; // Return the actual score
  }
}
