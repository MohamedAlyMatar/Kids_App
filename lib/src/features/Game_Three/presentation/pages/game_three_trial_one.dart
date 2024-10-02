import 'package:flutter/material.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/widgets/button1.dart';
import 'package:kids_app/src/core/widgets/textDesc.dart';
import 'package:kids_app/src/core/widgets/tileHeading.dart';
import 'package:kids_app/src/features/Game_One/data/datasources/img_list.dart';
import 'package:kids_app/src/features/Game_One/presentation/widgets/audio_player.dart';
import 'package:kids_app/src/features/Game_One/presentation/widgets/timer.dart';

class GameThreeTrialOne extends StatefulWidget {
  @override
  _GameThreeTrialOneState createState() => _GameThreeTrialOneState();
}

class _GameThreeTrialOneState extends State<GameThreeTrialOne> {
  int currentTest = 1;
  int currentLevel = 1;
  String resultMessage = "";
  bool showPictures = false;
  List<int> selectedPictureIndices = [];
  bool isAnswerSubmitted = false;
  final GlobalKey<CountdownTimerState> timerKey = GlobalKey();

  void onAudioComplete() {
    setState(() {
      showPictures = true;
      resultMessage = "Choose the correct images.";
    });
    timerKey.currentState?.startTimer();
  }

  String answer = "";
  void selectPicture(int index) {
    if (!isAnswerSubmitted) {
      setState(() {
        answer = imgSounds.values.toList()[index];
        print(answer);
        if (selectedPictureIndices.contains(index)) {
          selectedPictureIndices.remove(index);
        } else {
          selectedPictureIndices.add(index);
        }
      });
    }
  }

  String globalTarget = "piano";
  void submitAnswer() {
    setState(() {
      isAnswerSubmitted = true;
      // int correctCount = selectedPictureIndices
      //     .where((index) => imgSounds.values.toList()[index] == globalTarget)
      //     .length;

      if (answer == globalTarget) {
        resultMessage = "Correct Answer!";
      } else {
        resultMessage = "Wrong Answer :(";
      }
    });
  }

  int sound = 0;
  List<String> sounds = ['do', 're', 'si'];
  void nextTrial() {
    if (currentTest < 8) {
      setState(() {
        currentTest++;
        resultMessage = "";
        showPictures = false;
        selectedPictureIndices.clear();
        isAnswerSubmitted = false;
      });
      timerKey.currentState?.resetTimer();
    }
  }

  void startNextLevel() {
    setState(() {
      currentLevel++;
      currentTest = 1;
      resultMessage = "";
      showPictures = false;
      selectedPictureIndices.clear();
      isAnswerSubmitted = false;
    });
  }

  bool checkAnswer() {
    return selectedPictureIndices
            .where((index) => imgSounds.values.toList()[index] == globalTarget)
            .length ==
        1;
  }

  void onTimerEnd() {
    print("Timer has ended!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 800,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Tileheading(
                    timer: CountdownTimer(
                      key: timerKey,
                      initialTime: 30,
                      // onTimerEnd: onTimerEnd,
                    ),
                    title: "Game 3 - Test 1",
                    subtitle: "Trial $currentTest of 8 - Level $currentLevel",
                    trailing: "TPT",
                  ),
                  const SizedBox(height: 20),
                  if (!showPictures)
                    AudioPlayerWidget(
                      audioPath: 'audios/${sounds.elementAt(sound)}.mp3',
                      onAudioComplete: onAudioComplete,
                    ),
                  if (showPictures) ...[
                    Center(
                      child: Wrap(
                        spacing: 10, // horizontal spacing
                        runSpacing: 10, // vertical spacing
                        children: List.generate(2, (index) {
                          return InkWell(
                            onTap: () => selectPicture(index),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: isAnswerSubmitted
                                    ? (imgSounds.values.toList()[index] ==
                                            globalTarget
                                        ? Colors.green
                                        : selectedPictureIndices.contains(index)
                                            ? Colors.red
                                            : Colors.grey)
                                    : selectedPictureIndices.contains(index)
                                        ? Colors.blue
                                        : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                imgSounds.keys.toList()[index],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button1(textButton: "Submit", onPressed: submitAnswer),
                    const SizedBox(height: 10),
                    Text(resultMessage),
                    const SizedBox(height: 20),
                    if (currentTest != 8)
                      Button1(textButton: "Next Test", onPressed: nextTrial),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (!showPictures && currentTest == 2 && checkAnswer()) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextDesc(textDesc: "You passed this level!"),
                  Button1(
                    textButton: "Start the Next Level",
                    onPressed: startNextLevel,
                  ),
                ],
              ),
            ] else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextDesc(textDesc: "Sorry you didn't meet the minimum score"),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
