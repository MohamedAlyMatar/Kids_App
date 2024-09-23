import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CountdownTimer extends StatefulWidget {
  final int initialTime; // Initial time in seconds
  final VoidCallback onTimerEnd; // Callback for when the timer ends

  const CountdownTimer({
    Key? key,
    required this.initialTime,
    required this.onTimerEnd,
  }) : super(key: key);

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int remainingTime;
  late Timer _timer;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initialTime;
    audioPlayer = AudioPlayer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          _timer.cancel();
          widget.onTimerEnd();
          _playAlertSound();
          showDialog();
        }
      });
    });
  }

  void resetTimer() {
    _timer.cancel();
    remainingTime = widget.initialTime;
  }

  void _playAlertSound() async {
    try {
      await audioPlayer.play(AssetSource('audios/mango.mp3'));
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void showDialog() {
    AwesomeDialog(
      width: 400,
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: true,
      animType: AnimType.bottomSlide,
      title: 'Time is Up!',
      desc: 'Retry and answer more quickly.',
      buttonsTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
      showCloseIcon: false,
      dismissOnTouchOutside: false,
      btnCancelOnPress: () {
        Navigator.pop(context);
      },
      btnOkOnPress: () {},
    ).show();
  }

  @override
  void dispose() {
    _timer.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}",
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
