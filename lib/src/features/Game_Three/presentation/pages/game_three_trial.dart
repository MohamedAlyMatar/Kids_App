import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/utils/assets_manager.dart';
import 'package:kids_app/src/core/widgets/button1.dart';
import 'package:kids_app/src/core/widgets/textDesc.dart';
import 'package:kids_app/src/core/widgets/tileHeading.dart';
import 'package:kids_app/src/features/Game_One/presentation/widgets/timer.dart';

class GameThreeTrial extends StatefulWidget {
  @override
  _GameThreeTrialState createState() => _GameThreeTrialState();
}

class _GameThreeTrialState extends State<GameThreeTrial> {
  int currentTrial = 1;
  String resultMessage = "";
  bool isAudioPlaying = false;
  bool showPictures = false;
  late AudioPlayer audioPlayer;
  List<int> selectedPictureIndices = [];
  bool isAnswerSubmitted = false;
  final List<int> correctAnswers = [
    0,
    2
  ]; // Example correct answers for trial 1

  @override
  void initState() {
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
      selectedPictureIndices.clear(); // Reset selections
      isAnswerSubmitted = false; // Allow new selection
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
    });
  }

  void nextTrial() {
    if (currentTrial < 3) {
      setState(() {
        currentTrial++;
        resultMessage = "";
        showPictures = false;
        selectedPictureIndices.clear();
        isAnswerSubmitted = false;
      });
    }
  }

  void retryTrials() {
    setState(() {
      currentTrial = 1;
      resultMessage = "";
      showPictures = false;
      selectedPictureIndices.clear();
      isAnswerSubmitted = false;
    });
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
                          initialTime: 30, onTimerEnd: onTimerEnd),
                      title: "Game 3",
                      subtitle: "Trial $currentTrial of 3",
                      trailing: "TPT"),
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
                    )
                  ],
                  if (showPictures) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => selectPicture(0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: isAnswerSubmitted
                                  ? (correctAnswers.contains(0)
                                      ? Colors.green
                                      : selectedPictureIndices.contains(0)
                                          ? Colors.red
                                          : Colors.grey)
                                  : selectedPictureIndices.contains(0)
                                      ? Colors.blue
                                      : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(ImgAssets.mango1, width: 100),
                          ),
                        ),
                        InkWell(
                          onTap: () => selectPicture(1),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: isAnswerSubmitted
                                  ? (correctAnswers.contains(1)
                                      ? Colors.green
                                      : selectedPictureIndices.contains(1)
                                          ? Colors.red
                                          : Colors.grey)
                                  : selectedPictureIndices.contains(1)
                                      ? Colors.blue
                                      : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(ImgAssets.apple, width: 100),
                          ),
                        ),
                        InkWell(
                          onTap: () => selectPicture(2),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: isAnswerSubmitted
                                  ? (correctAnswers.contains(2)
                                      ? Colors.green
                                      : selectedPictureIndices.contains(2)
                                          ? Colors.red
                                          : Colors.grey)
                                  : selectedPictureIndices.contains(2)
                                      ? Colors.blue
                                      : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(ImgAssets.mango2, width: 100),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Button1(textButton: "Submit", onPressed: submitAnswer),
                    const SizedBox(height: 10),
                    Text(resultMessage),
                    const SizedBox(height: 20),
                    if (resultMessage != "Choose the correct images." &&
                        currentTrial != 3)
                      Button1(textButton: "Next Trial", onPressed: nextTrial),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (!isAudioPlaying && currentTrial == 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button1(textButton: "Retry Trial", onPressed: retryTrials),
                  Button1(
                      textButton: "Ready? Start the test now",
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.gameOneTest)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
