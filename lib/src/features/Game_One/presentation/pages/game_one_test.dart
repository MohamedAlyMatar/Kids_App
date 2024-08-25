import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/utils/assets_manager.dart';
import 'package:kids_app/src/core/widgets/button1.dart';
import 'package:kids_app/src/core/widgets/textDesc.dart';
import 'package:kids_app/src/core/widgets/tileHeading.dart';

class GameOneTest extends StatefulWidget {
  @override
  _GameOneTestState createState() => _GameOneTestState();
}

class _GameOneTestState extends State<GameOneTest> {
  int currentTest = 1;
  int currentLevel = 1; // Track the current level
  String resultMessage = "";
  bool isAudioPlaying = false;
  bool showPictures = false;
  late AudioPlayer audioPlayer;
  List<int> selectedPictureIndices = [];
  bool isAnswerSubmitted = false;
  List<int> correctAnswers = [0];
  late int fullMark = correctAnswers.length;

  List<int> userAnswers = [];

  // List to hold the images for each level
  List<String> images = [
    ImgAssets.mango1, // Image 0
    ImgAssets.mango2, // Image 2
  ];

  @override
  void initState() {
    print(correctAnswers.length);
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.setSourceAsset('assets/audios/mango.mp3');
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playAudio() async {
    setState(() {
      isAudioPlaying = true;
      resultMessage = "Audio is playing, listen carefully...";
      showPictures = false;
      selectedPictureIndices.clear();
      isAnswerSubmitted = false;
    });

    try {
      await audioPlayer.play(AssetSource('audios/mango.mp3'));

      audioPlayer.onPlayerComplete.listen((_) {
        if (mounted) {
          setState(() {
            isAudioPlaying = false;
            showPictures = true;
            resultMessage = "Choose the correct images.";
          });
        }
      });
    } catch (e) {
      setState(() {
        isAudioPlaying = false;
        resultMessage = "Error playing audio: $e";
      });
    }
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
      currentLevel++;
      currentTest = 1;
      resultMessage = "";
      showPictures = false;
      selectedPictureIndices.clear();
      isAnswerSubmitted = false;
      userAnswers.clear();

      // Increase the number of picture choices based on the level
      correctAnswers = List.generate(currentLevel + 1, (index) => index);

      // Add more images for the new level if needed
      images.addAll([
        ImgAssets.apple, // Image 1

        // ImgAssets.banana, // Example additional image
        // ImgAssets.orange, // Example additional image
      ]);
    });

    Navigator.pushNamed(context, Routes.gameOneTest);
  }

  bool checkAnswer() {
    return userAnswers.contains(fullMark);
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
                    title: "Game 1",
                    subtitle: "Test $currentTest of 2 - Level $currentLevel",
                    trailing: "AWM",
                  ),
                  const SizedBox(height: 20),
                  if (!isAudioPlaying && !showPictures) ...[
                    Image.asset(
                      ImgAssets.play,
                      width: 100,
                    ),
                    const SizedBox(height: 20),
                    TextDesc(textDesc: "Click play audio to begin"),
                    const SizedBox(height: 20),
                    Button1(textButton: "Play Audio", onPressed: playAudio),
                  ] else if (isAudioPlaying) ...[
                    Image.asset(
                      ImgAssets.listen,
                      width: 100,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Audio is playing, listen carefully...",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                  if (showPictures) ...[
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of columns in the grid
                        mainAxisSpacing: 10, // Spacing between rows
                        crossAxisSpacing: 10, // Spacing between columns
                        childAspectRatio: 3, // Aspect ratio for each grid item
                      ),
                      itemCount:
                          images.length, // Use the length of the images list
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
                              images[index], // Use the image from the list
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
            if (!isAudioPlaying && currentTest == 2 && checkAnswer()) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextDesc(textDesc: "You passed this level!"),
                  Button1(
                    textButton: "Start the Next Level",
                    onPressed: startNextLevel, // Updated onPressed
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
