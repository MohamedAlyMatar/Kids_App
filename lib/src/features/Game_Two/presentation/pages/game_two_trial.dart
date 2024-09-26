import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'dart:core';

import 'package:kids_app/src/core/widgets/tileHeading.dart';
import 'package:kids_app/src/features/Game_One/presentation/widgets/timer.dart';

class GameTwoTrial extends StatefulWidget {
  @override
  State<GameTwoTrial> createState() => _GameTwoTrialState();
}

class _GameTwoTrialState extends State<GameTwoTrial> {
  final GlobalKey<CountdownTimerState> timerKey = GlobalKey();
  List<ItemModel> items = [];
  List<ItemModel> items2 = [];

  int currentLevel = 1;
  int currentTrial = 1;

  int score = 0;
  int mistakes = 0;
  late bool gameOver;
  late bool shake = false;

  int timerCount = 30;
  bool startGame = true;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  void initGame() {
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

  void onTimerEnd() {
    print("Timer has ended!");
  }

  void startGameFun() {
    setState(() {
      startGame = false;
    });
    timerKey.currentState?.startTimer();
  }

  void retryTrials() {
    setState(() {
      initGame();
      currentTrial = 1;
    });
  }

  void nextTrial() {
    setState(() {
      initGame();
      currentTrial += 1;
      startGame = true;
    });
    timerKey.currentState?.resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) gameOver = true;

    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
          height: 650,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Game Bar
              Tileheading(
                timer: CountdownTimer(
                  key: timerKey,
                  initialTime: timerCount,
                  onTimerEnd: onTimerEnd,
                ),
                title: "Game 2",
                subtitle: "Trial $currentTrial of 4",
                trailing: "ADT",
              ),
              const SizedBox(height: 20),
              // Game Score
              if (startGame) ...[
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        startGameFun();
                      },
                      child: const Text("Start"),
                    ),
                  ),
                ),
              ] else ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Score: $score",
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text("Mistakes: $mistakes",
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                  ],
                ),
                const SizedBox(height: 20),
                // Choices and Destinations
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 405,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 0.1,
                        runSpacing: 0.1,
                        children: items.map((item) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            child: Draggable<ItemModel>(
                              data: item,
                              childWhenDragging: Icon(
                                item.icon,
                                color: Colors.grey,
                              ),
                              feedback: Icon(
                                item.icon,
                                color: Colors.black,
                                size: 60,
                              ),
                              child: item.matched
                                  ? Icon(
                                      item.icon,
                                      color: Colors.greenAccent,
                                      size: 60,
                                    )
                                  : Icon(
                                      item.icon,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    if (gameOver) ...[
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("DONE",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            ElevatedButton(
                              onPressed: () {
                                _showResults(context);
                              },
                              child: const Text("Submit"),
                            ),
                            if (currentTrial == 4)
                              ElevatedButton(
                                  onPressed: () {
                                    retryTrials();
                                  },
                                  child: const Text("Reset Trials")),
                          ],
                        ),
                      )
                    ],
                    const SizedBox(width: 20),
                    Container(
                      height: 405,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.start,
                        spacing: 0.1,
                        runSpacing: 0.1,
                        children: items2.map((item) {
                          return DragTarget<ItemModel>(
                            onAccept: (receivedItem) {
                              setState(() {
                                if (item.value == receivedItem.value) {
                                  items.remove(receivedItem);
                                  item.matched = true;
                                  score += 10;
                                } else {
                                  score -= 5;
                                  mistakes += 1;
                                  shake = true;

                                  // Reset shake after a short delay
                                  Future.delayed(
                                      const Duration(milliseconds: 300), () {
                                    setState(() {
                                      shake = false;
                                    });
                                  });
                                }
                              });
                            },
                            onWillAccept: (receivedItem) {
                              setState(() {
                                item.accepting = true;
                              });
                              return true;
                            },
                            onLeave: (receivedItem) {
                              setState(() {
                                item.accepting = false;
                              });
                            },
                            builder: (context, acceptedItems, rejectedItems) =>
                                Container(
                              decoration: BoxDecoration(
                                color: item.accepting
                                    ? Colors.white
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              height: 80,
                              width: 80,
                              alignment: Alignment.center,
                              child: item.matched
                                  ? Icon(item.icon,
                                      color: Colors.greenAccent, size: 60)
                                  : Text(
                                      item.name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          );
                        }).toList(),
                      ),
                    ).animate(target: shake == true ? 1.0 : 0.0).shake(),
                  ],
                ),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showResults(BuildContext context) {
    // Access the CountdownTimerState to get the remaining time
    final timerState = context.findAncestorStateOfType<CountdownTimerState>();

    int remainingTime = timerState?.getRemainingTime ?? 0;
    int timeTaken = timerCount - remainingTime;

    print("The player took $timeTaken seconds to submit the answer.");

    AwesomeDialog(
      width: 400,
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: true,
      animType: AnimType.bottomSlide,
      title: 'Game Results',
      desc: 'Your final score is $score\nYou answered in $timeTaken seconds',
      buttonsTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
      showCloseIcon: false,
      dismissOnTouchOutside: false,
      btnCancelOnPress: () {
        Navigator.pop(context);
      },
      btnOkOnPress: () {
        _saveUserResponses();
        nextTrial();
      },
    ).show();
  }

  void _saveUserResponses() {
    // Save the user's responses, e.g., to a database or file
    // For demonstration, we'll just print the matched items
    for (var item in items2) {
      if (item.matched) {
        print("User matched ${item.name} correctly.");
      } else {
        print("User did not match ${item.name}.");
      }
    }
  }
}

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
