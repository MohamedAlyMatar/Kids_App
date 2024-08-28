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

    // Initializing the items and items2 lists
    items = [
      ItemModel(
          name: "Donut",
          icon: Icons.donut_large,
          value: '50',
          accepting: false),
      ItemModel(
          name: "Car Crash",
          icon: Icons.car_crash,
          value: '50',
          accepting: false),
      ItemModel(
          name: "Water", icon: Icons.water, value: '50', accepting: false),
      ItemModel(
          name: "Water", icon: Icons.water, value: '50', accepting: false),
      ItemModel(
          name: "Water", icon: Icons.water, value: '50', accepting: false),
    ];

    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
          height: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 20),
              // Choices
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
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
                                size: 50,
                              ),
                              child: Icon(
                                item.icon,
                                color: Colors.amber,
                                size: 50,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Destinations
                    Expanded(
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: items2.map((item) {
                          return DragTarget<ItemModel>(
                            onAccept: (receivedItem) {
                              if (item.value == receivedItem.value) {
                                setState(() {
                                  items.remove(receivedItem);
                                  items2.remove(item);
                                  score += 10;
                                  item.accepting = false;
                                });
                              } else {
                                setState(() {
                                  score -= 5;
                                  item.accepting = false;
                                });
                              }
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
                                color:
                                    item.accepting ? Colors.red : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                item.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ]),
              if (gameOver) ...[
                Column(
                  children: [
                    Text("Game Over. Your score is $score"),
                    ElevatedButton(onPressed: () {}, child: Text("data"))
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class ItemModel {
  final String name;
  final String value;
  final IconData icon;
  bool accepting;

  ItemModel({
    required this.name,
    required this.value,
    required this.icon,
    this.accepting = false,
  });
}
