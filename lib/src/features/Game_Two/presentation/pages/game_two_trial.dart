import 'package:flutter/material.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';

class GameTwoTrial extends StatefulWidget {
  @override
  State<GameTwoTrial> createState() => _GameTwoTrialState();
}

class _GameTwoTrialState extends State<GameTwoTrial> {
  List<ItemModel> items = [];
  List<ItemModel> items2 = [];

  late int score;
  late bool gameOver;

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
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Game 2 - Trial 1 of 4",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "ADT",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Game Score
              Text.rich(TextSpan(children: [
                const TextSpan(
                    text: "Score: ",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0)),
                TextSpan(
                    text: "$score",
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0)),
              ])),
              const SizedBox(height: 20),
              // Choices and Destinations
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 430,
                    color: Colors.red,
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
                              color: Colors.teal,
                              size: 60,
                            ),
                            child: item.matched
                                ? Icon(
                                    item.icon,
                                    color: Colors.teal,
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
                  if (gameOver) Text("Game Over"),
                  ElevatedButton(
                    onPressed: () {
                      _showResults(context);
                    },
                    child: const Text("Submit"),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 430,
                    color: Colors.blue,
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
                              }
                              item.accepting = false;
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
                              color: item.accepting ? Colors.red : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            child: item.matched
                                ? Icon(item.icon, color: Colors.teal, size: 60)
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
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showResults(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Game Results"),
          content: Text("Your final score is $score"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _saveUserResponses();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
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
