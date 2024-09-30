import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int remainingTime = 30;

  void startTimer() {
    // Implement timer logic here
  }

  @override
  Widget build(BuildContext context) {
    return Text('Timer: $remainingTime');
  }
}
