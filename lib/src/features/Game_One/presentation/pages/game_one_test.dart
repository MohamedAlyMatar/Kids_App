import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/utils/assets_manager.dart';
import 'package:kids_app/src/core/widgets/button1.dart';
import 'package:kids_app/src/core/widgets/textDesc.dart';
import 'package:kids_app/src/core/widgets/tileHeading.dart';
import 'package:kids_app/src/features/Game_One/presentation/widgets/audio_player.dart';
import 'package:kids_app/src/features/Game_One/presentation/widgets/timer.dart';

class GameOneTest extends StatefulWidget {
  @override
  _GameOneTestState createState() => _GameOneTestState();
}

class _GameOneTestState extends State<GameOneTest> {
  int currentTest = 1;
  int currentLevel = 1;
  String resultMessage = "";
  bool showPictures = false;
  List<int> selectedPictureIndices = [];
  bool isAnswerSubmitted = false;
  List<int> correctAnswers = [0];
  late int fullMark = correctAnswers.length;

  List<int> userAnswers = [];
  int imageLength = 2;
  List<String> images = [
    ImgAssets.mango1,
    ImgAssets.mango2,
    ImgAssets.mango2,
    ImgAssets.mango2,
    ImgAssets.mango2,
    ImgAssets.mango2,
  ];

  void onAudioComplete() {
    setState(() {
      showPictures = true;
      resultMessage = "Choose the correct images.";
    });
  }

  void selectPicture(int index) {
    if (!isAnswerSubmitted) {
      setState(() {
        if (selectedPictureIndices.contains(index)) {
          selectedPictureIndices.remove(index);
        } else {
          selectedPictureIndices.add(index);
        }
      });
    }
  }

  void submitAnswer() {
    setState(() {
      isAnswerSubmitted = true;
      int correctCount = selectedPictureIndices
          .where((index) => correctAnswers.contains(index))
          .length;
      resultMessage =
          "You got $correctCount out of ${correctAnswers.length} correct!";
      userAnswers.add(correctCount);
      print(userAnswers);
    });
  }

  void nextTrial() {
    if (currentTest < 2) {
      setState(() {
        currentTest++;
        resultMessage = "";
        showPictures = false;
        selectedPictureIndices.clear();
        isAnswerSubmitted = false;
      });
    }
  }

  void startNextLevel() {
    setState(() {
      imageLength = imageLength + 2;
      currentLevel++;
      currentTest = 1;
      resultMessage = "";
      showPictures = false;
      selectedPictureIndices.clear();
      isAnswerSubmitted = false;
      userAnswers.clear();

      correctAnswers = List.generate(currentLevel + 1, (index) => index);
    });
  }

  bool checkAnswer() {
    return userAnswers.contains(fullMark);
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
                      initialTime: 30,
                      onTimerEnd: onTimerEnd,
                    ),
                    title: "Game 1",
                    subtitle: "Test $currentTest of 2 - Level $currentLevel",
                    trailing: "AWM",
                  ),
                  const SizedBox(height: 20),
                  if (!showPictures)
                    AudioPlayerWidget(
                      audioPath: 'audios/mango.mp3',
                      onAudioComplete: onAudioComplete,
                    ),
                  if (showPictures) ...[
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3,
                      ),
                      itemCount: imageLength,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => selectPicture(index),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: isAnswerSubmitted
                                  ? (correctAnswers.contains(index)
                                      ? Colors.green
                                      : selectedPictureIndices.contains(index)
                                          ? Colors.red
                                          : Colors.grey)
                                  : selectedPictureIndices.contains(index)
                                      ? Colors.blue
                                      : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              images[index],
                              width: 50,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Button1(textButton: "Submit", onPressed: submitAnswer),
                    const SizedBox(height: 10),
                    Text(resultMessage),
                    const SizedBox(height: 20),
                    if (resultMessage != "Choose the correct images." &&
                        currentTest != 2)
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
