import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/widgets/tileHeading.dart';
import 'package:kids_app/src/features/Game_One/presentation/widgets/timer.dart';
import 'package:kids_app/src/features/Game_Two/data/models/item_model.dart';
import 'package:kids_app/src/features/Game_Two/data/repositories/game_two_repo_impl.dart';
import 'package:kids_app/src/features/Game_Two/presentation/bloc/game_two_bloc.dart';
// import 'package:kids_app/src/features/Game_Two/presentation/widgets/draggable_items.dart';
// import 'package:kids_app/src/features/Game_Two/presentation/widgets/destination_items.dart';
// import 'package:kids_app/src/features/Game_Two/presentation/widgets/timer_widget.dart';

class GameTwoTrial extends StatefulWidget {
  @override
  _GameTwoTrialState createState() => _GameTwoTrialState();
}

class _GameTwoTrialState extends State<GameTwoTrial> {
  final GameTwoRepoImpl _gameService = GameTwoRepoImpl();
  final GlobalKey<CountdownTimerState> timerKey = GlobalKey();
  bool startGame = true;

  @override
  void initState() {
    super.initState();
    _gameService.initGame();
  }

  void startGameFun() {
    setState(() {
      startGame = false;
    });
    timerKey.currentState?.startTimer();
  }

  void nextTrial() {
    _gameService.initGame();
    _gameService.currentTrial += 1;
    startGame = true;
    timerKey.currentState?.resetTimer();
  }

  void _showResults(BuildContext context) {
    // Access the CountdownTimerState to get the remaining time
    final timerState = context.findAncestorStateOfType<CountdownTimerState>();
    int remainingTime = timerState?.getRemainingTime ?? 0;
    int timeTaken = _gameService.timerCount - remainingTime;

    print("The player took $timeTaken seconds to submit the answer.");

    AwesomeDialog(
      width: 400,
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: true,
      animType: AnimType.bottomSlide,
      title: 'Game Results',
      desc:
          'Your final score is ${_gameService.score}\nYou answered in $timeTaken seconds',
      buttonsTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
      showCloseIcon: false,
      dismissOnTouchOutside: false,
      btnCancelOnPress: () {
        Navigator.pop(context);
      },
      btnOkOnPress: () {
        _gameService.saveUserResponses();
        nextTrial();
        setState(() {});
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameTwoBloc()..add(GameInitEvent()),
      child: Scaffold(
        body: Center(
          child: Container(
            width: 600,
            height: 640,
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
                    initialTime: _gameService.timerCount,
                    // onTimerEnd: onTimerEnd,
                  ),
                  title: "Game 2",
                  subtitle: "Trial ${_gameService.currentTrial} of 4",
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
                        onPressed: startGameFun,
                        child: const Text("Start"),
                      ),
                    ),
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Score: ${_gameService.score}",
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                      Text("Mistakes: ${_gameService.mistakes}",
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
                      // Draggable Items Container
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
                          children: _gameService.items.map((item) {
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
                      if (_gameService.gameOver) ...[
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              ElevatedButton(
                                onPressed: () {
                                  _showResults(context);
                                },
                                child: const Text("Submit"),
                              ),
                              if (_gameService.currentTrial == 4)
                                ElevatedButton(
                                    onPressed: () {
                                      _gameService.retryTrials();
                                    },
                                    child: const Text("Reset Trials")),
                            ],
                          ),
                        )
                      ],
                      // Drag Targets Container
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
                          children: _gameService.items2.map((item) {
                            return DragTarget<ItemModel>(
                              onAccept: (receivedItem) {
                                setState(() {
                                  if (item.value == receivedItem.value) {
                                    _gameService.items.remove(receivedItem);
                                    item.matched = true;
                                    _gameService.updateScore(true);
                                  } else {
                                    _gameService.updateScore(false);
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
                              builder:
                                  (context, acceptedItems, rejectedItems) =>
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
                                        color: Colors.green, size: 60)
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
                      )
                          .animate(
                              target: _gameService.shake == true ? 1.0 : 0.0)
                          .shake(),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
