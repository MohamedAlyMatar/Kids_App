import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Game1Test extends StatefulWidget {
  @override
  _Game1TestState createState() => _Game1TestState();
}

class _Game1TestState extends State<Game1Test> {
  int currentLevel = 1;
  int currentQuestion = 1;
  int correctAnswers = 0;
  String resultMessage = "";
  bool isAudioPlaying = false;
  bool showPictures = false;
  AudioPlayer audioPlayer = AudioPlayer();

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
    });

    try {
      await audioPlayer.play(AssetSource('audios/mango.mp3'));

      // Listen for the audio completion event
      audioPlayer.onPlayerComplete.listen((_) {
        if (mounted) {
          setState(() {
            isAudioPlaying = false;
            showPictures = true;
            resultMessage = "Choose the correct image.";
          });
        }
      });
    } catch (e) {
      // Handle errors
      setState(() {
        isAudioPlaying = false;
        resultMessage = "Error playing audio: $e";
      });
    }
  }

  void submitAnswer(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        correctAnswers++;
        resultMessage = "Correct answer!";
      } else {
        resultMessage = "Incorrect answer!";
      }

      if (currentQuestion < 2) {
        currentQuestion++;
        showPictures = false;
      } else {
        if (correctAnswers >= 1) {
          if (currentLevel < 4) {
            currentLevel++;
            currentQuestion = 1;
            correctAnswers = 0;
            resultMessage = "Level $currentLevel, get ready!";
          } else {
            resultMessage = "Congratulations! You completed all levels!";
          }
        } else {
          resultMessage = "Retry Level $currentLevel!";
          currentQuestion = 1;
          correctAnswers = 0;
        }
        showPictures = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.yellow[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    "Level $currentLevel",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Question $currentQuestion of 2",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (isAudioPlaying)
                    Text(
                      "Audio is playing, listen carefully...",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  if (showPictures) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () => submitAnswer(
                              true), // Mark this true/false as per the actual answer
                          child: Text("Pic1"),
                        ),
                        ElevatedButton(
                          onPressed: () => submitAnswer(false),
                          child: Text("Pic2"),
                        ),
                        ElevatedButton(
                          onPressed: () => submitAnswer(false),
                          child: Text("Pic3"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(resultMessage),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (!isAudioPlaying && !showPictures)
              ElevatedButton(
                onPressed: playAudio,
                child: Text("Play Audio"),
              ),
          ],
        ),
      ),
    );
  }
}
